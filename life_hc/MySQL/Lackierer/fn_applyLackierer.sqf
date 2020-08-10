private _unit = param [0, objNull, [objNull]];
private _classname = param [1, "", [""]];
private _id = param [2, -1, [0]];
private _apply = param [3, "", [""]];
private _playerPrice = param [4, -1, [0]];
private _skinMaterial = param [5, -1, [0]];
private _insurance = param [6, false, [false]];

private _isHacker = [[_classname, _apply], _unit, remoteExecutedOwner, "fn_applyLackierer"] call HC_fnc_checkSQLBreak;
if(_isHacker || _classname == "" || _apply == "") exitWith {};

private _sideID = [side _unit] call HC_fnc_getSideID;
private _lackiererType = if(_skinMaterial isEqualTo 0) then {"SKIN"} else {"FOLIE"};
private _typeColumn = if(_skinMaterial isEqualTo 0) then {"color_id"} else {"material_id"};
private _typeTable = if(_skinMaterial isEqualTo 0) then {"life_vehicle_colors"} else {"life_vehicle_materials"};
private _typeName = if(_skinMaterial isEqualTo 0) then {"color"} else {"material"};
private _vehicleName = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
private _bankMoney = [getPlayerUID _unit, side _unit, "bank"] call HC_fnc_getMoney;

if(_apply == "-1") exitWith {
private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug umlackiert (FAHRZEUG: %4 %5: Entfernt PREIS: $0)", name _unit, getPlayerUID _unit, side _unit, _vehicleName, _lackiererType];
["LackiererLog", _msg] call HC_fnc_Log;

private _query = format["UPDATE vehicles SET %1 = (SELECT id FROM %2 WHERE %3 = '%4') WHERE vuid = '%5' AND side_id = '%6' AND owner_id = '%7' AND active = '0' AND deleted_at IS NULL", _typeColumn, _typeTable, _typeName, _apply, _id, _sideID, getPlayerUID _unit];
[_query,1] call HC_fnc_asyncCall;
};

private _vehiclePrice = if(_skinMaterial isEqualTo 0) then {[_classname, _apply, "-1", _insurance, side _unit] call HC_fnc_getVehiclePrice} else {[_classname, "-1", _apply, _insurance, side _unit] call HC_fnc_getVehiclePrice};
private _changePrice = if(_skinMaterial isEqualTo 0) then {getNumber (missionConfigFile >> "LifeCfgVehicles" >> _classname >> "textures" >> _apply >> "price")} else {getNumber (missionConfigFile >> "LifeCfgMaterials" >> _apply >> "price")};
private _price = round (_vehiclePrice * _changePrice) - _vehiclePrice;

if(_playerPrice != _price) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte %4 %5 kaufen, hat aber einen anderen Preis angegeben (%6 != %7)", name _unit, getPlayerUID _unit, side _unit, _lackiererType, _apply, [_playerPrice] call HC_fnc_numberSafe, [_price] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Lackier Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Lackier Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if(_bankMoney < _price) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte %4 %5 kaufen, hat aber nicht genug Geld (%6 != %7)", name _unit, getPlayerUID _unit, side _unit, _lackiererType, _apply, [_bankMoney] call HC_fnc_numberSafe, [_price] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Lackier Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Lackier Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, side _unit, "bank", _price, false] call HC_fnc_handleMoney;

_msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug umlackiert (FAHRZEUG: %4 %5: %6 PREIS: %7)", name _unit, getPlayerUID _unit, side _unit, _vehicleName, _lackiererType, _apply, [_price] call HC_fnc_numberSafe];
["LackiererLog", _msg] call HC_fnc_Log;

private _query = format["UPDATE vehicles SET %1 = (SELECT id FROM %2 WHERE %3 = '%4') WHERE vuid = '%5' AND side_id = '%6' AND owner_id = '%7' AND active = '0' AND deleted_at IS NULL", _typeColumn, _typeTable, _typeName, _apply, _id, _sideID, getPlayerUID _unit];
[_query,1] call HC_fnc_asyncCall;