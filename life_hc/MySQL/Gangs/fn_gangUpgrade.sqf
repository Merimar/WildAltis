private _unit = param [0, objNull, [objNull]];
private _price = param [1, 0, [0]];
private _group = param [2, grpNull, [grpNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_gangUpgrade"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _group) exitWith {};

private _groupName = _group getVariable ["gang_name", ""];
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _groupName};

if(_gangIndex isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte seine Gang upgraden, die Gang existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangUpgrade Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangUpgrade Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _maxSize = getNumber (missionConfigFile >> "Life_Settings" >> "gang_max_size");
private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _id = _gangInformation select 0;
private _maxMembers = _gangInformation select 4;
private _bank = _gangInformation select 5;
private _newSlots = _maxMembers + 1;
if(_newSlots > _maxSize) exitWith {};
private _realPrice = round(_newSlots * 10000);
private _newBank = _bank - _realPrice;

if(_bank < _realPrice) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte seine Gang upgraden, die Gang hat allerdings nicht genug Geld (%4 < %5)", name _unit, getPlayerUID _unit, side _unit, [_bank] call HC_fnc_numberSafe, [_realPrice] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangUpgrade Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangUpgrade Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

_gangInformation set [4, _newSlots];
_gangInformation set [5, _newBank];

_group setVariable ["gang_bank", _newBank, true];
_group setVariable ["gang_maxMembers", _newSlots, true];

private _msg = format ["Der Spieler %1 (%2 - %3) hat die Gang %4 auf %5 Slots für $%6 geupgradet", name _unit, getPlayerUID _unit, side _unit, _groupName, _newSlots, [_realPrice] call HC_fnc_numberSafe];
["GangLog", _msg] call HC_fnc_Log;

_query = format ["UPDATE gangs SET bank_balance = '%1', max_members = '%2' WHERE uid='%3' AND deleted_at IS NULL", _newBank, _newSlots, _id];
[_query, 1] call HC_fnc_asyncCall;