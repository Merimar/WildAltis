private _finalText = "";
private _config = "true" configClasses (missionConfigFile >> "LifeCfgVehicles");
{
private _displayName = getText (configFile >> "CfgVehicles" >> configName _x >> "displayName");
private _vehicleClass = getText (configFile >> "CfgVehicles" >> configName _x >> "vehicleClass");
private _typeID = switch (_vehicleClass) do {case "Car" : {1}; case "Air" : {2}; case "Ship" : {3}; default {1};};
private _displayNameArray = toArray _displayName;
private _badChars = toArray "'";
private _newArray = [];
{if(!(_x in _badChars)) then {_newArray pushBack _x;};}forEach _displayNameArray;
private _newDisplayName = toString _newArray;
_finalText = _finalText + format ["INSERT INTO life_classnames (classname, type_id, slug) VALUES ('%1', '%2', '%3');", configName _x, _typeID, _newDisplayName];
}forEach _config;

copyToClipboard _finalText;