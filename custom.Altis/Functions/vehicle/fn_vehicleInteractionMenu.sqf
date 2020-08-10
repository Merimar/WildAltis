if(!(isNull (findDisplay 374000))) exitWith {};
if(isNull CUR_VEHICLE_IDC) exitWith {};
if(!(alive CUR_VEHICLE_IDC)) exitWith {};
if((player distance CUR_VEHICLE_IDC) > 4 ) exitWith {};
if(player getVariable ["restrained", false]) exitWith {};

createDialog "Interaction_Menu";
disableSerialization;

CUR_AMOUNT_IDC = 0;

private _createElement = {
disableSerialization;
private _name = _this select 0;
private _action = _this select 1;
private _enable = _this select 2;
private _control = (findDisplay 374000) ctrlCreate ["Trans_Button", -1];
private _yValue = 0.19 + (0.044 * CUR_AMOUNT_IDC);
CUR_AMOUNT_IDC = CUR_AMOUNT_IDC + 1;
_control ctrlSetPosition [0.402031 * safezoneW + safezoneX, _yValue * safezoneH + safezoneY, 0.195937 * safezoneW, 0.033 * safezoneH];
_control ctrlCommit 0;
_control ctrlSetText _name;
_control ctrlCommit 0;
_control buttonSetAction _action;
_control ctrlEnable _enable;
};

private _einsteigen = (locked CUR_VEHICLE_IDC isEqualTo 0);
private _halter = (CUR_VEHICLE_IDC in life_vehicles || playerSide in [independent, west]);
private _pullOut = (count crew CUR_VEHICLE_IDC > 0 && locked CUR_VEHICLE_IDC isEqualTo 0 && _halter);
private _device = (CUR_VEHICLE_IDC getVariable ["mining", false]);
private _impound = (count crew CUR_VEHICLE_IDC isEqualTo 0);
private _repair = ("ToolKit" in (items player));
private _restrained = player getVariable ["restrained", false];
private _isDevice = ((typeOf CUR_VEHICLE_IDC) in ["O_Truck_03_device_F", "O_T_Truck_03_device_ghex_F"]);
private _deviceName = if(_device) then {"Gerät ausschalten"} else {"Gerät anschalten"};
private _deviceAction = if(_device) then {"closeDialog 0; [CUR_VEHICLE_IDC, false] spawn life_fnc_deviceMine"} else {"closeDialog 0; [CUR_VEHICLE_IDC, true] spawn life_fnc_deviceMine"};
private _amount = CUR_VEHICLE_IDC getVariable ["zenti_fuel", 0];
private _scorpion = (CUR_VEHICLE_IDC distance zenti_sell_1) <= 20 || (CUR_VEHICLE_IDC distance zenti_sell_2) <= 20;
private _nearHemtts = nearestObjects [getPos CUR_VEHICLE_IDC, ["B_Truck_01_box_F"], 30];
private _butcher = ({"hemtt_1.jpg" in (str (getObjectTextures _x))} count _nearHemtts) > 0;


["Umdrehen", "closeDialog 0; [CUR_VEHICLE_IDC] spawn life_fnc_flipVehicle;", (_halter || _einsteigen) && !_restrained] call _createElement;
["Schieben", "closeDialog 0; [CUR_VEHICLE_IDC] spawn life_fnc_pushObject;", (_halter || _einsteigen) && !_restrained] call _createElement;
["Reparieren", "closeDialog 0; [CUR_VEHICLE_IDC] spawn life_fnc_repairTruck;", _repair && !_restrained] call _createElement;
["Einsteigen", "if(player distance CUR_VEHICLE_IDC < 20) then {closeDialog 0; player moveInAny CUR_VEHICLE_IDC;};", _einsteigen && !_restrained] call _createElement;
["Aus Fahrzeug ziehen", "if(player distance CUR_VEHICLE_IDC < 20) then {closeDialog 0; [CUR_VEHICLE_IDC] spawn life_fnc_pulloutAction;};", _pullOut && !_restrained] call _createElement;
["Halterabfrage", "closeDialog 0; [CUR_VEHICLE_IDC] spawn life_fnc_searchVehAction;", _halter && !_restrained] call _createElement;

if(playerSide in [civilian, east]) then {
[_deviceName, _deviceAction, _isDevice && _halter] call _createElement;
[format ["Skorpion Gift verkaufen [%1]", _amount], "closeDialog 0; [CUR_VEHICLE_IDC] spawn life_fnc_zentiSell;", _amount > 0 && _halter && !_restrained && _scorpion] call _createElement;
};

if(playerSide in [west, independent]) then {
["Beschlagnahmen", "closeDialog 0; [CUR_VEHICLE_IDC] spawn life_fnc_impoundAction;", _impound] call _createElement;
if(playerSide isEqualTo west) then {
["Durchsuchen", "closeDialog 0; [CUR_VEHICLE_IDC] spawn life_fnc_vehInvSearch;", true] call _createElement;
if(_butcher) then {
["Fahrzeug zerstören", "closeDialog 0; [CUR_VEHICLE_IDC] spawn life_fnc_vehicleButcher;", true] call _createElement;
};
};
};