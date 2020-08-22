#include "..\script_macros.hpp"
disableSerialization;
closeDialog 0;
private _unit = param [0, objNull, [objNull]];
private _killer = param [1, objNull, [objNull]];
private _adminLvl = call life_adminlevel;

if(playerSide isEqualTo west) then {COP_SAVE_GEAR = [getUnitLoadout _unit] call life_fnc_fetchDeadCopGear;};

_unit setVariable ["Revive", true, true];
player setVariable ["isDead", true, true];
player setVariable ["adminLvl", _adminLvl, true];

createDialog "DeathScreen";
life_deathCamera = "CAMERA" camCreate (getPosATL _unit); 
life_deathCamera cameraEffect ["Internal","Back"]; 
life_deathCamera camSetTarget _unit; 
life_deathCamera camSetRelPos [0,3.5,4.5]; 
life_deathCamera camSetFovRange [1, 0.5]; 
life_deathCamera camSetFocus [50,0]; 
life_deathCamera camCommit 10; 
showCinemaBorder true; 
colorCorrection = ppEffectCreate ["ColorCorrections", 200]; 
dynamicBlur = ppEffectCreate ["DynamicBlur", 100]; 
dynamicBlur ppEffectEnable true; 
colorCorrection ppEffectEnable true; 
colorCorrection ppEffectAdjust [1,0.4,0,0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0]; 
colorCorrection ppEffectCommit (random 10); 
dynamicBlur ppEffectAdjust [10]; 
dynamicBlur ppEffectCommit 10; 

_unit spawn {
	disableSerialization;
	private _respawnTime = time + 60;
    private _respawnBtn = ((findDisplay 7300) displayCtrl 7303);
    _respawnBtn ctrlEnable false;
    waitUntil {_respawnBtn ctrlSetText format["Neues Leben (%1)",[(_respawnTime - time),"MM:SS"] call BIS_fnc_secondsToString]; round(_respawnTime - time) <= 0 || isNull _this};
    _respawnBtn ctrlEnable true;
    _respawnBtn ctrlSetText "Neues Leben";
};

private _canAdrenalin = (life_virt_gear findIf {(_x select 0) == "adrenalin" && (_x select 1) > 0}) != -1;
private _valid = _canAdrenalin && (isNull _killer || {_killer == _unit});
if(!("adrenalin" in LICENSES) && playerSide in [civilian, east]) then {_valid = false;};
[_valid] spawn life_fnc_deathScreen;
if(!isNil "REDGULL_THREAD") then {terminate REDGULL_THREAD;};
REDGULL = false;

(findDisplay 7300) displaySetEventHandler ["keyDown", "_this call life_fnc_displayHandler"];

life_save_gear = [];
[] call life_fnc_disableChannel;

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_isDead = true;
CURRENT_DEAD_UNIT = _unit;
CURRENT_DEAD_KILLER = _killer;

[] call life_fnc_hudUpdate;

if(_unit inArea "VirtusZone") then {
private _downPos = getPos _unit;
_downPos set [2, 0];
private _box = "Box_NATO_Ammo_F" createVehicle _downPos;
_box setVectorUp (surfaceNormal _downPos);
_box enableRopeAttach false;
clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

{_box addWeaponCargoGlobal [_x, 1];} forEach (weapons _unit);
{_box addMagazineCargoGlobal [_x, 1];} forEach (magazines _unit);
{_box addItemCargoGlobal [_x, 1];} forEach (items _unit);
			
_box addItemCargoGlobal [uniform _unit, 1];
_box addItemCargoGlobal [vest _unit, 1];
_box addBackpackCargoGlobal [unitBackpack _unit, 1];
_box addUniform (uniform _unit);

removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
};

_unit removeWeapon (primaryWeapon _unit);
_unit removeWeapon (secondaryWeapon _unit);
_unit removeWeapon (handgunWeapon _unit);