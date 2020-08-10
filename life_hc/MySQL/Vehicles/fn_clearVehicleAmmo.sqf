private _vehicle = param [0, objNull];
private _medic = param [1, false];

if(isNull _vehicle) exitWith {};
private _vehType = typeOf _vehicle;
private _allowedVehicles = if(_medic) then {[]}else {["O_G_Offroad_01_armed_F", "B_Heli_Transport_01_camo_F", "B_MRAP_01_hmg_F", "B_Boat_Armed_01_minigun_F"]};

if(!(_vehType in _allowedVehicles)) then {
{
private _turretClassname = _x select 0;
private _turretPath = _x select 1;
_vehicle removeMagazinesTurret [_turretClassname,_turretPath];
}forEach (magazinesAllTurrets _vehicle);
};

if(_vehType == "B_Boat_Armed_01_minigun_F") then {
_vehicle removeMagazinesTurret ["96Rnd_40mm_G_belt",[0]];
_vehicle removeMagazinesTurret ["96Rnd_40mm_G_belt",[0]];
};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;