#include "..\script_macros.hpp"
private _itemArray = _this select 0;
private _curSel = _this select 1;
private _geheimZahl = _this select 2;
private _price = _this select 3;

if(count _itemArray isEqualTo 0) exitWith {};
if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};
if(_price > BANK) exitWith {["Du hast nicht genug Geld auf dem Konto", true, "slow"] call life_fnc_showNotification;};
BANK = BANK - _price;

private _handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

_itemArray params ["_uniform", "_vest", "_backpack", "_goggles", "_headgear", ["_items",[]], "_prim", "_seco", ["_uItems",[]], ["_uMags",[]], ["_bItems",[]], ["_bMags",[]], ["_vItems",[]], ["_vMags",[]], ["_pItems",[]], ["_hItems",[]]];

player addBackpack "B_AssaultPack_blk";
_haupt = false;
_neben = false;

if((_pItems select 4) != "") then {
player addItem (_pItems select 4);
_pItems deleteAt 4;
_haupt = true;
};

if((_hItems select 4) != "") then {
player addItem (_hItems select 4);
_hItems deleteAt 4;
_neben = true;
};

if(_haupt) then {
if (!(_prim isEqualTo "")) then {_handle = [_prim,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
};

if(_neben) then {
if (!(_seco isEqualTo "")) then {_handle = [_seco,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
};

{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} forEach _items;

removeBackPack player;

if (!(_goggles isEqualTo "")) then {_handle = [_goggles,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if (!(_headgear isEqualTo "")) then {_handle = [_headgear,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if (!(_uniform isEqualTo "")) then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if (!(_vest isEqualTo "")) then {_handle = [_vest,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if (!(_backpack isEqualTo "")) then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};

{player addItemToUniform _x;} forEach (_uItems);
{(uniformContainer player) addItemCargoGlobal [_x,1];} forEach (_uMags);
{player addItemToVest _x;} forEach (_vItems);
{(vestContainer player) addItemCargoGlobal [_x,1];} forEach (_vMags);
{player addItemToBackpack _x;} forEach (_bItems);
{(backpackContainer player) addItemCargoGlobal [_x,1];} forEach (_bMags);

//Primary & Secondary (Handgun) should be added last as magazines do not automatically load into the gun.
if(!_haupt) then {
if (!(_prim isEqualTo "")) then {_handle = [_prim,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
};
if(!_neben) then {
if (!(_seco isEqualTo "")) then {_handle = [_seco,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
};

{
    if (!(_x isEqualTo "")) then {
        player addPrimaryWeaponItem _x;
    };
} forEach (_pItems);
{
    if (!(_x isEqualTo "")) then {
        player addHandgunItem _x;
    };
} forEach (_hItems);

[format ["Loadout Nr. %1 geladen.", _curSel], "Loadout geladen"] spawn life_fnc_message;
[] call life_fnc_updateCom;