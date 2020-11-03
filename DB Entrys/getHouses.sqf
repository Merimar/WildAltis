private _finalText = "";
private _config = "true" configClasses (missionConfigFile >> "CfgHouses");
{
private _house = configName _x;
private _displayName = getText (configFile >> "CfgVehicles" >> _house >> "displayName");
_finalText = _finalText + format ["INSERT INTO life_classnames (classname, type_id, slug) VALUES ('%1', '%2', '%3');", _house, 5, _displayName];
}forEach _config;

copyToClipboard _finalText;