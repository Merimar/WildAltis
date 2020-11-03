private _finalText = "";
private _config = "true" configClasses (missionConfigFile >> "LifeCfgMaterials");
{
private _material = configName _x;
private _displayName = getText (_x >> "name");
_finalText = _finalText + format ["INSERT INTO life_vehicle_materials (material, slug) VALUES ('%1', '%2');", _material, _displayName];
}forEach _config;

copyToClipboard _finalText;