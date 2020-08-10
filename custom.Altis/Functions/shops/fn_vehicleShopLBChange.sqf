disableSerialization;
private _step = (life_veh_shop param [4, 1]);

private _display = findDisplay 4450;
private _control = _display displayCtrl 4451;
private _infoBox = _display displayCtrl 4454;
private _moneyInfoRent = _display displayCtrl 4455;
private _moneyInfoBuy = _display displayCtrl 4456;

private _index = lbCurSel 4451;
private _configName = lbData [4451, _index];

_configName = if(_step isEqualTo 4) then {_configName == "Ja"} else {_configName};
_configName = if(_step isEqualTo 5) then {_configName == "Kaufen"} else {_configName};

life_veh_sel set [_step - 1, [_configName, _index]];
life_veh_sel params [["_step1_vehicle", ["", 0]], ["_step2_skin", ["", 0]], ["_step3_material", ["", 0]], ["_step4_insurance", [false, 0]], ["_step5_buyType", [false, 0]]];

private _vehicleClassname = _step1_vehicle select 0;
private _skinClassname = _step2_skin select 0;
private _materialClassname = _step3_material select 0;
private _insuranceClassname = _step4_insurance select 0;
private _buyClassname = _step5_buyType select 0;

private _buyMultiplier = switch (playerSide) do {case civilian : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_CIVILIAN")};case east : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_OPFOR")};case west : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_COP")};case independent : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_MEDIC")};};
private _rentMultiplier = switch (playerSide) do {case civilian : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_rental_multiplier_CIVILIAN")};case east : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_rental_multiplier_OPFOR")};case west : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_rental_multiplier_COP")};case independent : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_rental_multiplier_MEDIC")};};

switch (_step) do {
case 1 : {
life_veh_money set [0, getNumber (missionConfigFile >> "LifeCfgVehicles" >> _vehicleClassname >> "price")];
[_vehicleClassname] call life_fnc_vehicleShop3DPreview;
};

case 2 : {
[life_preview_3D_vehicle_object, _skinClassname] call life_fnc_colorVehicle;
if(_skinClassname != "" && _skinClassname != "-1") then {
life_veh_money set [1, getNumber (missionConfigFile >> "LifeCfgVehicles" >> _vehicleClassname >> "textures" >> _skinClassname >> "price")];
}else {
life_veh_money set [1, 1];
};
};

case 3 : {
[life_preview_3D_vehicle_object, _skinClassname, _materialClassname] call life_fnc_colorVehicle;
if(_materialClassname != "" && _materialClassname != "-1") then {
life_veh_money set [2, getNumber (missionConfigFile >> "LifeCfgMaterials" >> _materialClassname >> "price")];
}else {
life_veh_money set [2, 1];
};
};

case 4 : {
private _insuranceP = if(_insuranceClassname) then {1.7} else {1.0};
life_veh_money set [3, _insuranceP];
};

case 5 : {
private _buyTypeP = if(_buyClassname) then {_buyMultiplier} else {_rentMultiplier};
life_veh_money set [4, _buyTypeP];
};
};

private _vehiclePrice = life_veh_money param [0, 0];
private _skinPrice = life_veh_money param [1, 1];
private _materialPrice = life_veh_money param [2, 1];
private _insurancePrice = life_veh_money param [3, 1];

private _finalPrice = _vehiclePrice * _skinPrice * _materialPrice * _insurancePrice;

_moneyInfoBuy ctrlSetText format ["%1€",[round (_finalPrice * _buyMultiplier)] call life_fnc_numberText];
_moneyInfoRent ctrlSetText format ["%1€",[round (_finalPrice * _rentMultiplier)] call life_fnc_numberText];

private _skinInfo = if(_skinClassname != "" && _skinClassname != "-1") then {getText (missionConfigFile >> "LifeCfgVehicles" >> _vehicleClassname >> "textures" >> _skinClassname >> "name")} else {"Kein Skin ausgewählt"};
private _materialInfo = if(_materialClassname != "" && _materialClassname != "-1") then {getText (missionConfigFile >> "LifeCfgMaterials" >> _materialClassname >> "name")} else {"Keine Folie ausgewählt"};
private _insuranceInfo = if(_insuranceClassname) then {"Ja"} else {"Nein"};
private _buyName = if(_buyClassname) then {"Kaufen"} else {"Mieten"};
private _capacity = [_vehicleClassname] call life_fnc_vehicleWeightCfg;
private _vehicleInfo = [_vehicleClassname] call life_fnc_fetchVehInfo;
private _maxSpeed = _vehicleInfo select 8;
private _passengerSeats = _vehicleInfo select 10;
private _horsePower = _vehicleInfo select 11;
private _tank = _vehicleInfo select 12;
private _vehicleText = [["Max. Speed", _maxSpeed, false], [localize "STR_Garage2", _horsePower, false], [localize "STR_Garage3", _passengerSeats, false], [localize "STR_Garage4", _capacity, false], [localize "STR_Garage5", _tank, false], ["Farbe", _skinInfo, false], ["Folie", _materialInfo, false], ["Versicherung", _insuranceInfo, true], ["Kaufart", _buyName, true]] call life_fnc_getVehicleDescription;
_infoBox ctrlSetStructuredText parseText _vehicleText;