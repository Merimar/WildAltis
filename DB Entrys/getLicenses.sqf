private _finalText = "";
private _config = "true" configClasses (missionConfigFile >> "Licenses");
{
private _license = configName _x;
private _displayName = localize (getText (_x >> "displayName"));
_finalText = _finalText + format ["INSERT INTO life_licenses (color, slug) VALUES ('%1', '%2');", _license, _displayName];
}forEach _config;

copyToClipboard _finalText;