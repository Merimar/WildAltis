private _vehicle = param [0, ""];
private _weight = getNumber (missionConfigFile >> "LifeCfgVehicles" >> _vehicle >> "vItemSpace");
_weight;