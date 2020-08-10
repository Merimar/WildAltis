private _unit = _this select 0;
private _id = _this select 1;
private _pID = _this select 2;
private _pName = _this select 3;

if(isNull _unit) exitWith {};

private _pSide = side _unit;
if(life_HC_isActive) then {[_pID, _pName, _pSide] remoteExec ["HC_fnc_onPlayerDisconnected", HC_Life];};

private _containers = nearestObjects [_unit, ["WeaponHolderSimulated"], 5];
{deleteVehicle _x;}forEach _containers;
deleteVehicle _unit;