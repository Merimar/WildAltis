private _configs = "true" configClasses (missionConfigFile >> "CfgItemShop");
private _br = toString [10];
private _tab = toString [9];
private _output = "";

{
private _uniforms = getArray (_x >> "uniform");
private _headgears = getArray (_x >> "headgear");
private _goggles = getArray (_x >> "goggles");
private _vests = getArray (_x >> "vest");
private _weapons = getArray (_x >> "weapons");
private _backpacks = getArray (_x >> "backpack");
private _items = getArray (_x >> "items");

private _prefix = if(_forEachIndex > 0) then {_br + _br} else {""};
_output = _output + _prefix + "SHOP" + _tab + configName _x;

{
private _currentArray = _x;
if(count _currentArray > 0) then {
private _header = switch (_forEachIndex) do {case 0 : {"Kleidungen"}; case 1 : {"Helme"}; case 2 : {"Brillen"}; case 3 : {"Westen"}; case 4 : {"Rucksäcke"}; case 5 : {"Waffen"}; case 6 : {"Items"};};
private _ifPrefix = if(_forEachIndex > 0) then {_br} else {""};
_output = _output + _br + _br + "Kategorie" + _tab + _header + _br + _br + "Name" + _tab + "Preis" + _br;
{
private _classname = _x select 0;
private _price = _x select 2;
private _configName = switch (true) do {
	case (isClass(configFile >> "CfgMagazines" >> _classname)): {getText (configFile >> "CfgMagazines" >> _classname >> "displayName")};
	case (isClass(configFile >> "CfgWeapons" >> _classname)): {getText (configFile >> "CfgWeapons" >> _classname >> "displayName")};
	case (isClass(configFile >> "CfgVehicles" >> _classname)): {getText (configFile >> "CfgVehicles" >> _classname >> "displayName")};
	case (isClass(configFile >> "CfgGlasses" >> _classname)): {getText (configFile >> "CfgGlasses" >> _classname >> "displayName")};
};
private _ifBR = if(_forEachIndex > 0) then {_br} else {""};
_output = _output + _ifBR + _configName + _tab + (str _price);
}forEach _currentArray;
};
}forEach [_uniforms, _headgears, _goggles, _vests, _backpacks, _weapons, _items];
}forEach _configs;

copyToClipboard _output;