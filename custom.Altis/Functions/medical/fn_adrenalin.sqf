#include "..\script_macros.hpp"
if(isNull life_corpse) exitWith {};
private _information = life_corpse getVariable ["Loot_Information", []];
if(count _information isEqualTo 0) exitWith {};
private _canAdrenalin = ((_information select 2) findIf {(_x select 0) == "adrenalin" && (_x select 1) > 0}) != -1;
if(!_canAdrenalin) exitWith {["", "Ein Spieler hat deine Adrenalinspritze gelootet"] spawn life_fnc_message;};

life_virt_gear = _information select 2;
CASH = _information select 3;
[false, "adrenalin", 1] call life_fnc_handleInv;

closeDialog 0;
life_isDead = false;
player setVariable ["notruf_medic", "", true];
player setVariable ["isDead", false, true];
player allowDamage true;

life_save_gear = [life_corpse] call life_fnc_fetchDeadGear;
[life_save_gear] spawn life_fnc_loadDeadGear;
[] spawn life_fnc_reviveEffect;

[player, life_corpse] remoteExec ["HC_fnc_playerAdrenalin", HC_Life];

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

private _informationArray = bank_obj getVariable ["Emergency_Calls", []];
{
	if((_x select 0) == (name player)) exitWith {
		_x set [5, true];
	};
} forEach _informationArray;
bank_obj setVariable ["Emergency_Calls", _informationArray, true];