private _unit = param [0, objNull, [objNull]];
private _item = param [1, "", ["", []]];
private _amount = param [2, 1, [0]];

private _isHacker = [[str _item], _unit, remoteExecutedOwner, "fn_lockerUpdate"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _gear = [_unit] call HC_fnc_getPlayerGear;
private _itemArray = [];
[getPlayerUID _unit, side _unit, _gear] call HC_fnc_handleInv;

if(_item isEqualType "") then {
[getPlayerUID _unit, side _unit, _item, _amount] call HC_fnc_handleLocker;
_displayName = ([_item] call HC_fnc_fetchCfgDetails) select 1;
_itemArray pushBack format ["%1 (%2x)", _displayName, _amount];
}else {
{
_curItem = _x select 0;
_curAmount = _x select 1;
[getPlayerUID _unit, side _unit, _curItem, _curAmount] call HC_fnc_handleLocker;
_displayName = ([_curItem] call HC_fnc_fetchCfgDetails) select 1;
_itemArray pushBack format ["%1 (%2x)", _displayName, _curAmount];
}forEach _item;
};

private _msg = format ["Der Spieler %1 (%2 - %3) hat Items in seinem Schliesfach verändert: %4", name _unit, getPlayerUID _unit, side _unit, _itemArray joinString ", "];
["LockerLog", _msg] call HC_fnc_Log;