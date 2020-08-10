#include "..\script_macros.hpp"
disableSerialization;

private _display = findDisplay 3700;
private _vehicleList = _display displayCtrl 3701;
private _skinCombo = _display displayCtrl 3702;

private _index = lbCurSel 3701;
private _skinIndex = lbCurSel 3702;

if(-1 in [_index, _skinIndex]) exitWith {["Du musst etwas auswählen", "Lackierer"] spawn life_fnc_message;};

private _data = call compile (_vehicleList lbData _index);
private _skinData = call compile (_skinCombo lbData _skinIndex);
private _newSkin = _skinData select 1;
private _id = _data select 0;
private _classname = _data select 1;
private _color = _data select 2;
private _material = _data select 3;
private _insurance = (_data select 4) isEqualTo 1;
private _vehicleName = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
if(_newSkin == _color) exitWith {["Dieser Skin ist schon auf deinem Fahrzeug", "Lackierer"] spawn life_fnc_message;};

private _skinName = if(_newSkin != "-1") then {getText (missionConfigFile >> "LifeCfgVehicles" >> _classname >> "textures" >> _newSkin >> "name")} else {"Entfernt"};
private _skinPrice = if(_newSkin != "-1") then {getNumber (missionConfigFile >> "LifeCfgVehicles" >> _classname >> "textures" >> _newSkin >> "price")} else {1.0};
private _vehiclePrice = [_classname, _newSkin, _material, _insurance] call life_fnc_getVehiclePrice;
private _price = round ((_vehiclePrice * _skinPrice) - _vehiclePrice);

if(_price > BANK) exitWith {[format["Du hast nicht genug Geld für diese Änderung. Die Änderung kostet €%1", [_price] call life_fnc_numberText], "Lackierer"] spawn life_fnc_message;};

[format["Du hast den Skin deines %1 auf %2 geändert! Es hat dich €%3 gekostet", _vehicleName, _skinName, [_price] call life_fnc_numberText], "Lackierer"] spawn life_fnc_message;
[player, _classname, _id, _newSkin, _price, 0, _insurance] remoteExec ["HC_fnc_applyLackierer", HC_LIFE];
closeDialog 0;

BANK = BANK - _price;