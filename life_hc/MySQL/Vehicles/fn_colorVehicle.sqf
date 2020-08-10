private _vehicle = param [0, objNull];
private _color = param [1, "-1"];
private _material = param [2, "-1"];

if(isNull _vehicle || !alive _vehicle) exitWith {};

private _classname = typeOf _vehicle;

if(!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classname)) exitWith {};

if(_color != "-1") then {
private _pathSkin = getArray(missionConfigFile >> "LifeCfgVehicles" >> _classname >> "textures" >> _color >> "path");
{_vehicle setObjectTextureGlobal [_forEachIndex, _x];}forEach _pathSkin;
};

if(_material != "-1") then {
private _pathMaterial = getText(missionConfigFile >> "LifeCfgMaterials" >> _material >> "path");
_vehicle setObjectMaterialGlobal [0,_pathMaterial];
_vehicle setObjectMaterialGlobal [1,_pathMaterial];
_vehicle setObjectMaterialGlobal [2,_pathMaterial];
_vehicle setObjectMaterialGlobal [3,_pathMaterial];
};

_vehicle setVariable ["Life_VEH_color", [_color, _material], true];