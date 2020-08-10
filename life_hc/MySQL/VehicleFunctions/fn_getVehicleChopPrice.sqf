private _vehicle = param [0, ""];
private _vehiclePrice = getNumber (missionConfigFile >> "LifeCfgVehicles" >> _vehicle >> "chopPrice");
_vehiclePrice;