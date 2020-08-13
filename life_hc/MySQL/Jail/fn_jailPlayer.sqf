private _unit = param [0, objNull, [objNull]];
private _criminal = param [1, objNull, [objNull]];
private _time = param [2, 10, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_jailPlayer"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _criminal) exitWith {};

if((side _unit) != west) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte den Spieler %4 (%5 - %6) ins Gefängnis stecken, ist aber kein Cop", name _unit, getPlayerUID _unit, side _unit, name _criminal, getPlayerUID _criminal, side _criminal];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Jail Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Jail Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if(_unit distance _criminal > 20) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte den Spieler %4 (%5 - %6) ins Gefängnis stecken, ist aber zu weit entfernt", name _unit, getPlayerUID _unit, side _unit, name _criminal, getPlayerUID _criminal, side _criminal];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Jail Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Jail Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _geheimZahl = [getPlayerUID _criminal] call HC_fnc_getGeheimzahl;

[_unit, _time, _geheimZahl] remoteExec ["life_fnc_jailMe", _criminal];
[getPlayerUID _criminal, _time] call HC_fnc_handleArrested;
[_criminal, _unit] call HC_fnc_fahndungBounty;
private _jailPos = markerPos "jail_marker";
_jailPos set [2, 1];
_criminal setPos _jailPos;

[0, format ["Der Spieler %1 wurde inhaftiert", name _criminal]] remoteExec ["life_fnc_broadcast", -2];

private _msg = format ["Der Spieler %1 (%2 - %3) hat den Spieler %4 (%5 - %6) für %7 Minuten ins Gefängnis gesteckt", name _unit, getPlayerUID _unit, side _unit, name _criminal, getPlayerUID _criminal, side _criminal, _time];
["JailLog", _msg] call HC_fnc_Log;

private _sideID = [side _criminal] call HC_fnc_getSideID;
private _query = format ["INSERT INTO player_jail (prisoner_id, officer_id, side_id, duration) VALUES ('%1', '%2', '%3', '%4')", getPlayerUID _criminal, getPlayerUID _unit, _sideID, _time];
[_query, 1] call HC_fnc_asyncCall;

_criminal setVariable ["Bank_geschafft", false, true];

//Illegale Items löschen

private _gear = getUnitLoadout _criminal;
_gear set [0, []];
_gear set [1, []];
_gear set [2, []];
_gear set [4, []];
_gear set [8, []];

private _uItemCopy = +((_gear select 3) param [1, []]);
private _vItemCopy = +((_gear select 4) param [1, []]);
private _bItemCopy = +((_gear select 5) param [1, []]);

private _newUItem = [];
private _newVItem = [];
private _newBItem = [];

{
_add = _x select 0;
_list = _x select 1;
{
private _item = _x select 0;
private _amount = _x select 1;
private _itemType = [_item] call HC_fnc_getItemType;

if(_itemType in [10, 8, 5, 9]) then {_add pushBack [_item, _amount];};
}forEach _list;
}forEach [[_newUItem, _uItemCopy], [_newVItem, _vItemCopy], [_newBItem, _bItemCopy]];

(_gear select 3) set [1, _newUItem];
(_gear select 4) set [1, _newVItem];
(_gear select 5) set [1, _newBItem];

_criminal setUnitLoadout _gear;
sleep 1;
private _newGear = [_criminal] call HC_fnc_getPlayerGear;
[getPlayerUID _criminal, _newGear] call HC_fnc_handleInv;