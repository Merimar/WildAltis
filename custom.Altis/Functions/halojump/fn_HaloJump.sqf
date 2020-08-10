#include "..\script_macros.hpp"
private _haloMax = getNumber (missionConfigFile >> "Life_Settings" >> "halo_jump_max");
private _haloPrice = getNumber (missionConfigFile >> "Life_Settings" >> "halo_jump_price");
private _haloParachuteHeight = getNumber (missionConfigFile >> "Life_Settings" >> "halo_jump_auto_parachute");
private _haloJumpHeight = getNumber (missionConfigFile >> "Life_Settings" >> "halo_jump_height");
private _displayName = [_haloPrice] call life_fnc_numberText;

private _action = [
    format["Möchtest du wirklich %1€ für einen Halojump ausgeben", _displayName],
    "Halojump",
    "Springen",
    "Abbrechen"
] call BIS_fnc_guiMessage;

if(!_action) exitWith {};
if(_haloPrice > BANK) exitWith {titleText[format["Du hast keine %1€", [_haloPrice] call life_fnc_numberText], "PLAIN"];};

private _path = format ["halocount_%1", getPlayerUID player];
private _count = bank_obj getVariable [_path, 0];
if(_count >= _haloMax) exitWith {titleText[format["Du hast das Limit von %1 Halojumps pro Serverperiode schon erreicht", _haloMax], "PLAIN"];};
if(HALO_PROCCESS) exitwith {};

titleText["Klicke auf eine Stelle auf der Map wo du abbspringen möchtest", "PLAIN"];
openMap true;
HALO_PROCCESS = true;
HALO_PROCCESS_CLICK = false;

onMapSingleClick "HALO_PROCCESS_CLICK = true; HALO_PROCCESS_POS = _pos; true;";
waitUntil {HALO_PROCCESS_CLICK || !(visiblemap)};
onMapSingleClick "";
HALO_PROCCESS_CLICK = false;
if(!visibleMap) exitWith {systemChat "Halojump abgebrochen";HALO_PROCCESS = false;};
openMap false;
HALO_PROCCESS_POS set [2, _haloJumpHeight];

private _backpack = backpack player;
private _backpackItems = backpackItems player;

bank_obj setVariable [_path, _count + 1, true];
BANK = BANK - _haloPrice;

[player, HALO_PROCCESS_POS] remoteExec ["HC_fnc_haloJump", HC_LIFE];

waitUntil {(getPos player select 2) > 100};

if (cameraView isEqualTo "EXTERNAL") then {player switchCamera "INTERNAL";};
cutText ["", "BLACK IN", 0.5];
removeBackpack player;
player addBackpack "B_Parachute";

private _exit = false;

while {(getPos player select 2) > 2} do {
	if(getPos player select 2 < _haloParachuteHeight) exitWith {player action ["OpenParachute", player];};
	if(!(alive player)) exitWith {_exit = true;};
};

HALO_PROCCESS = false;

if(_exit) exitWith {};

removeBackPack player;
if(_backpack isEqualTo "") exitWith {};

sleep 3;

player addBackpack _backpack;
clearAllItemsFromBackpack player;
{player addItemToBackpack _x;}forEach _backpackItems;