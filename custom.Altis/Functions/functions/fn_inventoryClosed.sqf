#include "..\script_macros.hpp"
private _container = param [1, objNull];
if(isNull _container) exitWith {};
if(_container getVariable ["rewardbox", false]) then {
	deleteVehicle _container;
};