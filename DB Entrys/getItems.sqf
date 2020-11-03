private _finalText = "";
private _config = "true" configClasses (missionConfigFile >> "Items");
{
private _item = configName _x;
private _displayName = getText (_x >> "name");
_finalText = _finalText + format ["INSERT INTO life_virtual_items (name, slug) VALUES ('%1', '%2');", _item, _displayName];
}forEach _config;

copyToClipboard _finalText;