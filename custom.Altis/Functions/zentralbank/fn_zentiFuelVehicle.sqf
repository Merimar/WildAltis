disableSerialization;
private _display = findDisplay 3650;
private _vehicleList = _display displayCtrl 3651;
private _index = lbCurSel _vehicleList;

if(_index isEqualTo -1) exitWith {};
if(isNil "fuel_delay") then {fuel_delay = time - 10;};

if((time - fuel_delay) < 10) exitWith {["Du kannst nur alle 10 Sekunden ein Fahrzeug befüllen.", "Zentralbank"] spawn life_fnc_message;};
fuel_delay = time;

private _netID = _vehicleList lbData _index;
if(_netID isEqualTo "") exitWith {};

private _vehicle = objectFromNetId _netID;
private _max = getNumber (missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle >> "bankCapacity");
private _current = _vehicle getVariable ["zenti_fuel", 0];
private _currentFuel = zenti getVariable ["fuel", 0];
private _open = zenti getVariable ["open", false];

if(!_open) exitWith {["Der Tresor ist geschlossen.", "Zentralbank"] spawn life_fnc_message;};
if(_current >= _max) exitWith {["Das Fahrzeug ist voll.", "Zentralbank"] spawn life_fnc_message;};
if(_currentFuel <= 0) exitWith {["Der Tresor ist leer.", "Zentralbank"] spawn life_fnc_message;};

private _fuelPlayer = _vehicle getVariable ["fuelPlayer", objNull];
if(!(isNull _fuelPlayer)) exitWith {["Das Fahrzeug wird bereits befüllt.", "Zentralbank"] spawn life_fnc_message;};
_vehicle setVariable ["fuelPlayer", player, true];
["Das Fahrzeug wird nun befüllt ...", "Zentralbank"] spawn life_fnc_message;

while {true} do {
_currentFuel = zenti getVariable ["fuel", 0];
private _currentVehicleFuel = _vehicle getVariable ["zenti_fuel", 0];
if(_currentFuel <= 0 || _currentVehicleFuel >= _max || (_vehicle distance zenti) > 40 || !(zenti getVariable ["open", false])) exitWith {};
if(player != (_vehicle getVariable ["fuelPlayer", objNull])) exitWith {};
zenti setVariable ["fuel", (_currentFuel - 1), true];
_vehicle setVariable ["zenti_fuel", (_currentVehicleFuel + 1), true];
sleep 12;
};

private _vehicleName = getText (configFile >> "CfgVehicles" >> typeof _vehicle >> "displayName");
[format["Das Fahrzeug %1 wurde fertig betankt", _vehicleName], "Zentralbank"] spawn life_fnc_message;
_vehicle setVariable ["fuelPlayer", objNull, true];