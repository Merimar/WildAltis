private _unit = param [0, objNull, [objNull]];
private _group = param [1, grpNull, [grpNull]];
private _buff = param [2, "", [""]];

private _isHacker = [[_buff], _unit, remoteExecutedOwner, "fn_activateBuff"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _group || _buff == "") exitWith {};

private _groupName = _group getVariable ["gang_name", ""];
if(_buff == "dealer" && GANG_DEALER) exitWith {["Der Gangdealer ist bereits auf der Insel.", "Buff nicht aktiviert"] remoteExec ["life_fnc_message", _unit];};
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _groupName};

if(_gangIndex isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte einen Gang Buff zünden, die Gang existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Buff Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Buff Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _id = _gangInformation select 0;
private _gangBuffs = _gangInformation select 8;
private _buffIndex = _gangBuffs findIf {_x select 0 == _buff && _x select 1 > 0};

if(_buffIndex isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte einen %4 Buff zünden, die Gang besitzt diesen Buff aber nicht", name _unit, getPlayerUID _unit, side _unit, _buff];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Buff Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Buff Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _amount = _gangBuffs select _buffIndex select 1;

_activeBuffIndex = ACTIVE_BUFFS findIf {_x select 0 == _groupName && _x select 1 == _buff};
if(_activeBuffIndex != -1) exitWith {};

private _newAmount = _amount - 1;

if(_newAmount isEqualTo 0) then {
_gangBuffs deleteAt _buffIndex;
}else {
_gangBuffs select _buffIndex set [1, _amount - 1];
};

_group setVariable ["gang_buffs", _gangBuffs, true];
[_group, _buff] spawn HC_fnc_buffThread;

_query = format ["UPDATE gang_buffs SET amount = '%1' WHERE gang_id = '%2' AND buff_id = (SELECT id FROM life_buffs WHERE buff = '%3')", _newAmount, _id, _buff];
[_query, 1] call HC_fnc_asyncCall;

private _buffName = getText (missionConfigFile >> "CfgBuffs" >> _buff >> "name");
private _msg = format ["Der Spieler %1 (%2 - %3) hat einen Buff aktiviert (BUFF: %4)", name _unit, getPlayerUID _unit, side _unit, _buffName];
["GangLog", _msg] call HC_fnc_Log;

if(_buff == "dealer") then {
["Der Gangdealer hat die Insel betreten. Ihr könnt dort eure Drogen für einen höheren Preis verkaufen!", "Gangdealer"] remoteExec ["life_fnc_message", -2];
GANG_DEALER = true;
private _randomPos = selectRandom GANG_DEALER_POSITIONS;
private _marker = createMarker ["GangDealer", _randomPos];
_marker setMarkerText "Gangdealer";
_marker setMarkerType "mil_dot";
_marker setMarkerColor "ColorRed";
private _sleep = getNumber(missionConfigFile >> "CfgBuffs" >> "dealer" >> "duration");
sleep _sleep;
deleteMarker _marker;
GANG_DEALER = false;
["Der Gangdealer hat die Insel wieder verlassen.", "Gangdealer"] remoteExec ["life_fnc_message", -2];
};