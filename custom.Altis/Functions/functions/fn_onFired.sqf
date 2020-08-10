#include "..\script_macros.hpp"
private _ammoType = _this select 4;
private _projectile = _this select 6;

if(_ammoType in ["GrenadeHand_stone", "Chemlight_green", "Chemlight_red", "Chemlight_yellow", "Chemlight_blue"]) then {[player, _ammoType, "Fired"] remoteExec ["HC_fnc_putItem", HC_LIFE];};
if(_ammoType != "GrenadeHand_stone") exitWith {};

_projectile spawn {
	private _position = [0, 0, 0];
	while {!isNull _this} do {
		_position = ASLtoATL (visiblePositionASL _this);
		sleep 0.1;
	};
	
	[_position] remoteExec ["life_fnc_flashbang", -2];
};