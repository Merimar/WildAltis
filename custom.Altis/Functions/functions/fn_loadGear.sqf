#include "..\script_macros.hpp"
private _itemArray = param [0, []];
waitUntil {!(isNull (findDisplay 46))};

private _handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

if(count _itemArray isEqualTo 0) exitWith {
    switch (playerSide) do {
        case west: {[] call life_fnc_copLoadout;};
        case civilian: {[] call life_fnc_civLoadout;};
		case east: {[] call life_fnc_civLoadout;};
        case independent: {[] call life_fnc_medicLoadout;};
    };
};

_itemArray params [
    "_uniform",
    "_vest",
    "_backpack",
    "_goggles",
    "_headgear",
    ["_items",[]],
    "_prim",
    "_seco",
    ["_uItems",[]],
    ["_uMags",[]],
    ["_bItems",[]],
    ["_bMags",[]],
    ["_vItems",[]],
    ["_vMags",[]],
    ["_pItems",[]],
    ["_hItems",[]]
];

player addBackpack "B_AssaultPack_blk";
private _haupt = false;
private _neben = false;

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

if(!(_prim isEqualTo "") && _haupt) then {_handle = [_prim,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(_seco isEqualTo "") && _neben) then {_handle = [_seco,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};

{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} forEach _items;

removeBackPack player;

if(!(_goggles isEqualTo "")) then {_handle = [_goggles,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(_headgear isEqualTo "")) then {_handle = [_headgear,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(_uniform isEqualTo "")) then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(_vest isEqualTo "")) then {_handle = [_vest,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(_backpack isEqualTo "")) then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};

if(_backpack != "") then {life_maxWeight = life_maxWeight + (round(FETCH_CONFIG2(getNumber,"CfgVehicles",(backpack player),"maximumload") / 4));} else {life_maxWeight = 24;};

{player addItemToUniform _x;} forEach (_uItems);
{(uniformContainer player) addItemCargoGlobal [_x,1];} forEach (_uMags);
{player addItemToVest _x;} forEach (_vItems);
{(vestContainer player) addItemCargoGlobal [_x,1];} forEach (_vMags);
{player addItemToBackpack _x;} forEach (_bItems);
{(backpackContainer player) addItemCargoGlobal [_x,1];} forEach (_bMags);

if (!(_prim isEqualTo "") && !_haupt) then {_handle = [_prim,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(_seco isEqualTo "") && !_neben) then {_handle = [_seco,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};

{if(!(_x isEqualTo "")) then {player addPrimaryWeaponItem _x;};}forEach _pItems;
{if(!(_x isEqualTo "")) then {player addHandgunItem _x;};}forEach _hItems;