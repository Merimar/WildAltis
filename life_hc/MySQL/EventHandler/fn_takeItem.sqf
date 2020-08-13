private _unit = param [0, objNull, [objNull]];
private _item = param [1, "", [""]];
private _container = param [2, objNull, [objNull]];

private _isHacker = [[_item], _unit, remoteExecutedOwner, "fn_takeItem"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};
private _itemType = [_item] call HC_fnc_getItemType;
private _event = _container getVariable ["eventContainer", false];

if(_itemType in [5,6,7] && !_event) then {
private _itemList = _container getVariable ["itemList", []];
private _index = _itemList findIf {_x select 0 == _item};
if(_index isequalTo -1) then {
[format["Der Spieler %1 wollte ein Item (%2) aufheben was nicht existieren sollte", name _unit, _item], false] call HC_fnc_adminMessage;
["DupeLog", format["Der Spieler %1 (%2 - %3) wollte ein Item (%4) aufheben was nicht existieren sollte", name _unit, getPlayerUID _unit, side _unit, _item]] call HC_fnc_Log;
}else {
private _newAmount = _itemList select _index select 1;
(_itemList select _index) set [1, _newAmount - 1];
_container setVariable ["itemList", _itemList];
if(_newAmount isEqualTo 0) then {
[format["Der Spieler %1 wollte ein Item (%2) aufheben was nicht existieren sollte", name _unit, _item], false] call HC_fnc_adminMessage;
["DupeLog", format["Der Spieler %1 (%2 - %3) wollte ein Item (%4) aufheben was nicht existieren sollte", name _unit, getPlayerUID _unit, side _unit, _item]] call HC_fnc_Log;
};
};
};

private _playerGear = [_unit] call HC_fnc_getPlayerGear;
[getPlayerUID _unit, _playerGear] call HC_fnc_handleInv;

private _details = [_item] call HC_fnc_fetchCfgDetails;
private _name = _details param [1, "Kein Name"];

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Item aufgenommen (ITEM: %4)", name _unit, getPlayerUID _unit, side _unit, _name];
["TakeLog", _msg] call HC_fnc_Log;