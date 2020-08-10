disableSerialization;
if(isNull findDisplay 3650) then {createDialog "Tresor";};

private _display = findDisplay 3650;
private _list = _display displayCtrl 3651;
private _progress = _display displayCtrl 3652;
private _progressText = _display displayCtrl 3653;
private _nearVehicles = nearestObjects [getPos player, ["Car", "Air", "Ship"], 40];

{
if(isClass (missionConfigFile >> "LifeCfgVehicles" >> typeOf _x)) then {
private _bankCapacity = getNumber (missionConfigFile >> "LifeCfgVehicles" >> typeOf _x >> "bankCapacity");
if(_bankCapacity > 0) then {
_displayName = getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
_list lbAdd _displayName;
_list lbSetData [(lbSize _list)-1, netID _x];
};
};
}forEach _nearVehicles;

private _currentFuel = zenti getVariable ["fuel", 0];
private _maxFuel = zenti getVariable ["maxFuel", 0];

if(_maxFuel < 0) exitWith {};

private _prg = round((_currentFuel / _maxFuel) * 100);
_progress progressSetPosition (_currentFuel / _maxFuel);
_progressText ctrlSetStructuredText parseText format ["%1/%2 (%3%4)", _currentFuel, _maxFuel, _prg, "%"];

while {!(isNull _display)} do {[] call life_fnc_zentiLBChange;sleep 15;};