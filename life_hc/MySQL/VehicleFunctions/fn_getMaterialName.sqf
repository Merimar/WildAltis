private _folie = param [0, ""];
private _folienName = "Standard";

if(isClass (missionConfigFile >> "LifeCfgMaterials" >> _folie >> "name")) then {_folienName = getText (missionConfigFile >> "LifeCfgMaterials" >> _folie >> "name");};

_folienName;