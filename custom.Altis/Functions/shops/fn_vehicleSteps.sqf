disableSerialization;
private _step = param [0, 1];

life_veh_shop params [["_shop", ""], ["_sideCheck", sideUnknown], ["_spawnPoints", ""]];
life_veh_sel params [["_step1_vehicle", ["", 0]], ["_step2_skin", ["", 0]], ["_step3_material", ["", 0]], ["_step4_insurance", [false, 0]], ["_step5_buyType", [false, 0]]];

private _display = findDisplay 4450;
private _control = _display displayCtrl 4451;
private _progress = _display displayCtrl 4452;
private _progressText = _display displayCtrl 4453;
private _next = _display displayCtrl 4457;
private _back = _display displayCtrl 4458;
lbClear _control;

switch (_step) do {
case 1 : {
life_veh_shop set [4, 1];
private _vehicleList = getArray (missionConfigFile >> "CarShops" >> _shop >> "vehicles");

{
private _className = _x select 0;
private _condition = call compile (_x select 1);
private _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
private _bankCapacity = getNumber (missionConfigFile >> "LifeCfgVehicles" >> _className >> "bankCapacity");

if(_condition) then {
private _vehicleName = if(_bankCapacity > 0) then {format ["%1 [Zentralbank Fahrzeug]", _vehicleInfo select 3]} else {_vehicleInfo select 3};
_control lbAdd _vehicleName;
_control lbSetPicture [(lbSize _control)-1, (_vehicleInfo select 2)];
_control lbSetData [(lbSize _control)-1, _className];
_control lbSetValue [(lbSize _control)-1, _forEachIndex];
}else {
_control lbAdd (_vehicleInfo select 3);
_control lbSetPicture [(lbSize _control)-1, (_vehicleInfo select 2)];
_control lbSetData [(lbSize _control)-1, _className];
_control lbSetValue [(lbSize _control)-1, _forEachIndex];
_control lbSetColor [(lbSize _control)-1, [1, 0, 0, 1]];
};


}forEach _vehicleList;

_control lbSetCurSel (_step1_vehicle select 1);
_progress progressSetPosition 0.2;
_progressText ctrlSetText "Fahrzeug aussuchen (1/5) ...";
_back buttonSetAction "closeDialog 0;";
_next buttonSetAction "[2] call life_fnc_vehicleSteps;";
_back ctrlSetText "Schließen";
_next ctrlSetText "Weiter";

life_veh_sel set [1, ["", 0]];
life_veh_sel set [2, ["", 0]];
life_veh_sel set [3, [false, 0]];
life_veh_sel set [4, [false, 0]];
life_veh_money set [1, 1];
life_veh_money set [2, 1];
life_veh_money set [3, 1];
life_veh_money set [4, 1];
};

case 2 : {
life_veh_shop set [4, 2];
private _vehicle = _step1_vehicle param [0, ""];
private _skins = "true" configClasses (missionConfigFile >> "LifeCfgVehicles" >> _vehicle >> "textures");

if(playerSide in [civilian, east]) then {
_control lbAdd "Kein Skin";
_control lbSetData [(lbSize _control)-1, "-1"];
_control lbSetValue [(lbSize _control)-1, 1];
};

{
private _texture = getText (_x >> "name");
private _condition = call compile (getText (_x >> "condition"));
	
if(_condition) then {
_control lbAdd _texture;
_control lbSetData [(lbSize _control)-1, configName _x];
_control lbSetValue [(lbSize _control)-1, _forEachIndex];
};
}forEach _skins;

if(lbSize _control isEqualTo 0 && playerSide in [west, independent]) then {
_control lbAdd "Kein Skin";
_control lbSetData [(lbSize _control)-1, "-1"];
_control lbSetValue [(lbSize _control)-1, 1];
};

_progress progressSetPosition 0.4;
_progressText ctrlSetText "Skin aussuchen (2/5) ...";
_back buttonSetAction "[1] call life_fnc_vehicleSteps;";
_next buttonSetAction "[3] call life_fnc_vehicleSteps;";
_back ctrlSetText "Zurück";
_next ctrlSetText "Weiter";

_control lbSetCurSel (_step2_skin select 1);
life_veh_sel set [2, ["", 0]];
life_veh_sel set [3, [false, 0]];
life_veh_sel set [4, [false, 0]];
life_veh_money set [2, 1];
life_veh_money set [3, 1];
life_veh_money set [4, 1];
};

case 3 : {
life_veh_shop set [4, 3];
private _previous = life_veh_shop select 4;
private _newStep = if(_previous isEqualTo 4) then {2} else {4};

if(playerSide in [west, independent]) exitWith {[_newStep] call life_fnc_vehicleSteps;};
private _materialList = "true" configClasses (missionConfigFile >> "LifeCfgMaterials");
private _premiumLvl = call life_donorlevel;

_control lbAdd "Keine Folie";
_control lbSetData [(lbSize _control)-1, "-1"];
_control lbSetValue [(lbSize _control)-1, 0];

{
private _displayName = getText (_x >> "name");
private _premium = getNumber (_x >> "premium");

if(_premium > _premiumLvl) then {
_control lbAdd format ["%1 (Benötigt Premium Lvl. %2)", _displayName, _premium];
_control lbSetColor[(lbSize _control)-1, [1, 0, 0, 1]];
}else {
_control lbAdd _displayName;
_control lbSetColor[(lbSize _control)-1, [0, 1, 0, 1]];
};

_control lbSetData [(lbSize _control)-1, configName _x];
_control lbSetValue [(lbSize _control)-1, _forEachIndex];
}forEach _materialList;

_progress progressSetPosition 0.6;
_progressText ctrlSetText "Folie aussuchen (3/5) ...";
_back buttonSetAction "[2] call life_fnc_vehicleSteps;";
_next buttonSetAction "[4] call life_fnc_vehicleSteps;";
_back ctrlSetText "Zurück";
_next ctrlSetText "Weiter";

_control lbSetCurSel (_step3_material select 1);
life_veh_sel set [3, [false, 0]];
life_veh_sel set [4, [false, 0]];
life_veh_money set [3, 1];
life_veh_money set [4, 1];
};

case 4 : {
life_veh_shop set [4, 4];
{
_control lbAdd (_x select 0);
_control lbSetColor[(lbSize _control)-1, [0.55, 1, 0.6, 1]];
_control lbSetData [(lbSize _control)-1, _x select 1];
_control lbSetValue [(lbSize _control)-1, _forEachIndex];
}forEach [["Kaufen ohne Versicherung", "Nein"], ["Kaufen mit Versicherung", "Ja"]];

_progress progressSetPosition 0.8;
_progressText ctrlSetText "Versicherung aussuchen (4/5) ...";
_back buttonSetAction "[3] call life_fnc_vehicleSteps;";
_next buttonSetAction "[5] call life_fnc_vehicleSteps;";
_back ctrlSetText "Zurück";
_next ctrlSetText "Weiter";

_control lbSetCurSel (_step4_insurance select 1);
life_veh_sel set [4, [false, 0]];
life_veh_money set [4, 1];
};

case 5 : {
life_veh_shop set [4, 5];
{
_control lbAdd _x;
_control lbSetColor[(lbSize _control)-1, [0.55, 1, 0.6, 1]];
_control lbSetData [(lbSize _control)-1, _x];
}forEach ["Mieten", "Kaufen"];

_progress progressSetPosition 1;
_progressText ctrlSetText "Mieten oder kaufen (5/5) ...";
_back buttonSetAction "[4] call life_fnc_vehicleSteps;";
_next buttonSetAction "[] spawn life_fnc_vehicleShopBuy;";
_back ctrlSetText "Zurück";
_next ctrlSetText "Bestätigen";
_control lbSetCurSel (_step5_buyType select 1);
};
};