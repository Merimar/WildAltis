private _unit = param [0, objNull, [objNull]];
private _vehicle = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_vehicleInvSearch"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _vehicle) exitWith {};

private _searchSkill = [getPlayerUID _unit, "search"] call HC_fnc_getSkillAdvantage;
private _vUID = (_vehicle getVariable ["dbInfo", []]) param [2, -1];
if(_vUID isEqualTo -1) exitWith {["", "Es wurden keine illegalen Items gefunden"] remoteExec ["life_fnc_message", _unit]};

private _vehInvID = format ["VEHICLE_INV_%1", _vUID];
private _data = missionNamespace getVariable [_vehInvID, [[], 0]];
private _itemArray = _data select 0;
private _nameArray = [];

{
private _item = _x select 0;
private _amount = _x select 1;

if(_amount > 0) then {

_isIllegal = getNumber (missionConfigFile >> "Items" >> _item >> "illegal");
_displayName = getText (missionConfigFile >> "Items" >> _item >> "name");

private _random = round(random(100)) + 1;

if(_random < _searchSkill && _isIllegal isEqualTo 1) then {
_nameArray pushBack format ["%1 %2", _amount, _displayName];
[_vehicle, _item, _amount, false] call HC_fnc_handleVehicleInv;
private _vehicleCurrentWeight = ([_vehicle] call life_fnc_vehicleWeight) select 1;
private _itemWeight = [_item] call life_fnc_itemWeight;
private _vehData = _vehicle getVariable ["Trunk", [[], 0]];
private _inv = _vehData select 0;
private _itemIndex = _inv findIf {_x select 0 == _item};

if(_itemIndex != -1) then {
private _oldAmount = _inv select _itemIndex select 1;
(_inv select _itemIndex) set [1, 0];
_vehData set [1, _vehicleCurrentWeight - (_itemWeight * _amount)];
_vehicle setVariable ["Trunk", _vehData, true];
};
};
};
}forEach _itemArray;

private _removeText = _nameArray joinString "<br/>";
[_removeText, "Diese Items wurden entfernt"] remoteExec ["life_fnc_message", _unit];

_removeText = _nameArray joinString ", ";

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug durchsucht, und hat (%4) entfernt", name _unit, getPlayerUID _unit, side _unit, _removeText];
["SearchLog", _msg] call HC_fnc_Log;