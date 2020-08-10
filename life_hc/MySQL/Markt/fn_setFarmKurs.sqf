private _unit = param [0, objNull, [objNull]];
private _newPrice = param [1, 0, [0]];
private _item = param [2, "", [""]];

private _isHacker = [[_item], _unit, remoteExecutedOwner, "fn_setFarmKurs", true] call HC_fnc_checkSQLBreak;
if(_isHacker || _item == "") exitWith {};

private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");
private _oldPrice = getNumber (missionConfigFile >> "Items" >> _item >> "sellPrice");
private _index = MARKT_ARRAY findIf {(_x select 0) == _item};
if(_index isEqualTo -1) exitWith {};

private _newPerc = round (_newPrice / _oldPrice);
(MARKT_ARRAY select _index) set [4, _newPerc];
publicVariable "MARKT_ARRAY";
MARKT_SERVER_ARRAY = +MARKT_ARRAY;

private _msg = format ["Der Admin %1 (%2 - %3) hat für das Item %4 einen neuen Preis: %5 festgelegt", name _unit, getPlayerUID _unit, side _unit, _displayName, [_newPrice] call HC_fnc_numberSafe];
["MarktLog", _msg] call HC_fnc_Log;