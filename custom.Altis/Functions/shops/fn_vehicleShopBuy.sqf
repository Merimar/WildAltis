life_veh_sel params [["_step1_vehicle", ["", 0]], ["_step2_skin", ["", 0]], ["_step3_material", ["", 0]], ["_step4_insurance", [false, 0]], ["_step5_buyType", [false, 0]]];

private _vehicleClassname = _step1_vehicle select 0;
private _skinClassname = _step2_skin select 0;
private _materialClassname = _step3_material select 0;
private _insuranceClassname = _step4_insurance select 0;
private _buyClassname = _step5_buyType select 0;

private _vehicleInfo = [_vehicleClassname] call life_fnc_fetchVehInfo;
private _nameVehicle = _vehicleInfo select 3;

private _vehicleList = getArray (missionConfigFile >> "CarShops" >> (life_veh_shop select 0) >> "vehicles");
private _vehicleIndex = _vehicleList findIf {_x select 0 == _vehicleClassname};
if(_vehicleIndex isEqualTo -1) exitWith {["", "Fahrzeug Config Fehler"] spawn life_fnc_message;};

private _condition = _vehicleList select _vehicleIndex select 1;
if(!(call compile _condition)) exitWith {["Du kannst dir dieses Fahrzeug nicht kaufen", "Fahrzeugshop"] spawn life_fnc_message;};

if(_materialClassname == "") then {_materialClassname = "-1";};
if(_skinClassname == "") then {_skinClassname = "-1";};

if("" in [_vehicleClassname, _skinClassname, _materialClassname]) exitWith {["Es fehlen einige Angaben.", "Fahrzeugshop"] spawn life_fnc_message;};
private _vehiclePrice = life_veh_money param [0, 0];
private _skinPrice = life_veh_money param [1, 1];
private _materialPrice = life_veh_money param [2, 1];
private _insurancePrice = life_veh_money param [3, 1];
private _buyTypePrice = life_veh_money param [4, 1];
private _finalPrice = round (_vehiclePrice * _skinPrice * _materialPrice * _insurancePrice * _buyTypePrice);

private _premiumLvl = call life_donorlevel;
private _hasPremium = if(_materialClassname != "-1") then {(_premiumLvl >= getNumber (missionConfigFile >> "LifeCfgMaterials" >> _materialClassname >> "premium"))} else {true};
private _hasSkin = if(_skinClassname != "-1") then {call compile (getText (missionConfigFile >> "LifeCfgVehicles" >> _vehicleClassname >> "textures" >> _skinClassname >> "condition"))} else {true};
private _buyOrRent = if(_buyClassname) then {"kaufen"} else {"mieten"};

if(!_hasPremium) exitWith {["Du kannst dir dieses Fahrzeug aufgrund der ausgewählten Folie nicht kaufen", "Fahrzeugshop"] spawn life_fnc_message;};
if(!_hasSkin) exitWith {["Du kannst dir dieses Fahrzeug aufgrund des ausgewählten Skins nicht kaufen", "Fahrzeugshop"] spawn life_fnc_message;};
if(_finalPrice <= 0) exitWith {["Das Fahrzeug hat keinen Preis", "Fahrzeugshop"] spawn life_fnc_message;};
if(CASH < _finalPrice) exitWith {[format ["Du kannst dir dieses Fahrzeug nicht leisten.<br/>Dir fehlen €%1", [_finalPrice - CASH] call life_fnc_numberText], "Fahrzeugshop"] spawn life_fnc_message;closeDialog 0;};

private _action = [
    format["Möchtest du folgendes Fahrzeug: %1 wirklich %2?", _nameVehicle, _buyOrRent],
    "Fahrzeug Kaufen",
    _buyOrRent,
    "Abbrechen"
] call BIS_fnc_guiMessage;

if(!_action) exitWith {};
[player, _vehicleClassname, _skinClassname, _materialClassname, _insuranceClassname, _buyClassname, _finalPrice, life_veh_shop] remoteExec ["HC_fnc_buyVehicle", HC_LIFE];
closeDialog 0;

waitUntil {!(isNil "vehicle_money")};
if(vehicle_money) then {CASH = CASH - _finalPrice;};
vehicle_money = nil;