private _finalText = "";
private _config = "true" configClasses (missionConfigFile >> "LifeCfgVehicles");
private _textures = [];
{
private _textureConfig = "true" configClasses (_x >> "textures");
{
private _texture = configName _x;
private _displayName = getText (_x >> "name");
if(!(_texture in _textures)) then {
_textures pushBack _texture;
_finalText = _finalText + format ["INSERT INTO life_vehicle_colors (license, slug) VALUES ('%1', '%2');", _texture, _displayName];
};
}forEach _textureConfig;
}forEach _config;

copyToClipboard _finalText;