#include "..\script_macros.hpp"
private _vehicle = param [0, objNull];
private _color = param [1, ""];
private _material = param [2, ""];

if (isNull _vehicle || !alive _vehicle) exitWith {};
private _className = typeOf _vehicle;

if(_color != "") then {
private _pathSkin = getArray(missionConfigFile >> "LifeCfgVehicles" >> _className >> "textures" >> _color >> "path");
{_vehicle setObjectTexture [_forEachIndex,_x];} forEach _pathSkin;
}else {
private _skinArray = getArray (configfile >> "CfgVehicles" >> _className >> "hiddenSelectionsTextures");
{_vehicle setObjectTexture [_forEachIndex,_x];} forEach _skinArray;
};

if(_material != "") then {
private _pathMaterial = getText(missionConfigFile >> "LifeCfgMaterials" >> _material >> "path");
_vehicle setObjectMaterial [0,_pathMaterial];
_vehicle setObjectMaterial [1,_pathMaterial];
_vehicle setObjectMaterial [2,_pathMaterial];
_vehicle setObjectMaterial [3,_pathMaterial];
}else {
_vehicle setObjectMaterial [0, ""];
_vehicle setObjectMaterial [1, ""];
_vehicle setObjectMaterial [2, ""];
_vehicle setObjectMaterial [3, ""];
};