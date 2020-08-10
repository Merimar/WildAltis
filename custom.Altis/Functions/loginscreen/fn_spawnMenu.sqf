disableSerialization;
if(!isNull findDisplay 38500) exitWith {};
createDialog "Spawnmenu";
private _display = findDisplay 38500;
private _spawnList = _display displayCtrl 38501;
_display displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

life_spawned = false;

private _spawnConfig = "true" configClasses (missionConfigFile >> "CfgSpawnPoints");

{
private _displayName = getText(_x >> "displayName");
private _icon = getText (_x >> "icon");
private _condition = getText(_x >> 'condition');
if(call compile _condition) then {
_spawnList lbAdd _displayName;
_spawnList lbSetData [(lbSize _spawnList)-1, configName _x];
_spawnList lbSetPicture [(lbSize _spawnList)-1, _icon];
};
}forEach _spawnConfig;

if (playerSide in [civilian, east]) then {
{
_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");

_spawnList lbAdd _houseName;
_spawnList lbSetData [(lbSize _spawnList)-1, ""];
_spawnList lbSetValue [(lbSize _spawnList)-1, _forEachIndex];
_spawnList lbSetPicture [(lbSize _spawnList)-1, "\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
}forEach life_houses;
};

_spawnList lbSetCurSel 0;
player switchCamera "EXTERNAL";

[] call life_fnc_disableChannel;