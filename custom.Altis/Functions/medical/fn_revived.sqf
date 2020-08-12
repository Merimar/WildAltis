#include "..\script_macros.hpp"
private _medic = param [0, objNull];
private _isDefi = param [1, false];
private _reviveCost = 10000;

if(isNull _medic) exitWith {};

closeDialog 0;
player allowDamage true;

life_isDead = false;
player setVariable ["notruf_medic", "", true];
player setVariable ["isDead", false, true];

life_save_gear = [life_corpse] call life_fnc_fetchDeadGear;
[life_save_gear] spawn life_fnc_loadDeadGear;

if(!_isDefi) then {
	if(!(playerSide isEqualTo independent)) then {
		if(BANK >= _reviveCost) then {BANK = BANK - _reviveCost;};
		[format["%1 hat dich wiederbelebt und dafür eine Gebühr von €%2 von deinem Bankkonto eingezogen", name _medic, [_reviveCost] call life_fnc_numberText], "Du wurdest wiederbelebt"] spawn life_fnc_message;
	};
} else {
[] spawn life_fnc_reviveEffect;
};

private _information = life_corpse getVariable ["Loot_Information", []];
if(count _information > 0) then {
life_virt_gear = _information select 2;
CASH = _information select 3;
};

[player, life_corpse, _medic, _isDefi] remoteExec ["HC_fnc_playerRevived", HC_Life];

life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;
dynamicBlur ppEffectEnable false;
ppEffectDestroy dynamicBlur;
colorCorrection ppEffectEnable false;
ppEffectDestroy colorCorrection;

[] call life_fnc_hudUpdate;
[] call life_fnc_disableChannel;
[] call life_fnc_fixSpace;

if(JAIL_TIME > 0) then {[objNull, JAIL_TIME, life_geheimZahl] spawn life_fnc_jailMe;};