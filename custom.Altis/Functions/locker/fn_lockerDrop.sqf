disableSerialization;
private _target = param [0, controlNull];
private _sourceIDC = param [3, -1];
private _information = param [4, []];
private _sourceInfo = _information param [0, []];
private _lbValueNew = _sourceInfo param [1, -1];
private _itemMove = _sourceInfo param [2, ""];
private _targetIDC = ctrlIDC _target;
private _display = findDisplay 398000;
private _listIDS = [398007, 398008, 398009, 398010, 398011, 398012, 398019, 398020, 398021, 398022, 398039];
private _end = true;

_allowed1 = [[398007, 398013], [398008, 398014], [398009, 398015], [398010, 398016], [398011, 398017], [398012, 398018]];
_allowed2 = [[398019, 398023], [398020, 398024], [398019, 398025]];
_allowed3 = [[398021, 398027], [398021, 398028], [398021, 398029], [398021, 398030], [398021, 398035], [398021, 398036], [398021, 398037], [398021, 398038]];
_allowed4 = [[398022, 398026], [398039, 398040]];

private _allowedConversion = _allowed1 + _allowed2 + _allowed3 + _allowed4;
if(_itemMove == "" || count _itemMove < 3) exitWith {};
if(_sourceIDC isEqualTo _targetIDC) exitWith {};
private _itemType = [_itemMove] call life_fnc_getItemType;
private _weapon = if(_sourceIDC isEqualTo 398021 && _targetIDC in [398035, 398036, 398037, 398038]) then {handgunWeapon player} else {primaryWeapon player};

{
private _xIDCStart = _x select 0;
private _xIDCEnd = _x select 1;
if((_sourceIDC isEqualTo _xIDCStart && _targetIDC isEqualTo _xIDCEnd) || (_targetIDC isEqualTo _xIDCStart && _sourceIDC isEqualTo _xIDCEnd)) exitWith {_end = false;};
}forEach _allowedConversion;

if(_end) exitWith {["", "Das geht nicht!"] spawn life_fnc_message;};
if(_itemType isEqualTo 0 && _sourceIDC isEqualTo 398019 && _targetIDC isEqualTo 398025) exitWith {["", "Das geht nicht!"] spawn life_fnc_message;};
if(_itemType isEqualTo 2 && _sourceIDC isEqualTo 398019 && _targetIDC isEqualTo 398023) exitWith {["", "Das geht nicht!"] spawn life_fnc_message;};

_exit = false;
if(_targetIDC in [398027,398028,398029,398030,398035,398036,398037,398038] && _sourceIDC isEqualTo 398021) then {
private _baseWeapon = getText(configFile >> "CfgWeapons" >> _weapon >> "baseWeapon");

_pointer = getArray(configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
_optic = getArray(configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
_silencer = getArray(configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
_bipod = getArray(configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");

if(_baseWeapon != _weapon) then {
_pointer1 = getArray(configFile >> "CfgWeapons" >> _baseWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
_optic1 = getArray(configFile >> "CfgWeapons" >> _baseWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
_silencer1 = getArray(configFile >> "CfgWeapons" >> _baseWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
_bipod1 = getArray(configFile >> "CfgWeapons" >> _baseWeapon >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");
_pointer append _pointer1;
_optic append _optic1;
_silencer append _silencer1;
_bipod append _bipod1;
};


if(_targetIDC in [398027, 398035] && !(_itemMove in _silencer)) then {_exit = true;};
if(_targetIDC in [398028, 398036] && !(_itemMove in _optic)) then {_exit = true;};
if(_targetIDC in [398029, 398037] && !(_itemMove in _pointer)) then {_exit = true;};
if(_targetIDC in [398030, 398038] && !(_itemMove in _bipod)) then {_exit = true;};
};

if(_exit) exitWith {["", "Das geht nicht!"] spawn life_fnc_message;};

if(_sourceIDC in _listIDS) then {
if(_sourceIDC isEqualTo 398022 && ([_itemMove] call life_fnc_hasSpace) < 1) exitWith {["", "Du hast zu wenig Platz!"] spawn life_fnc_message;};
if(_sourceIDC isEqualTo 398039 && [_itemMove] call life_fnc_hasSpace < 1) exitWith {["", "Du hast zu wenig Platz!"] spawn life_fnc_message;};

[_itemMove, -1] call life_fnc_lockerManage;

if(_sourceIDC != 398039 && _sourceIDC != 398022) then {
private _lbDataOld = _target lbData 0;
if(_lbDataOld != "") then {[_lbDataOld, 1] call life_fnc_lockerManage;};
};
_bino = (getUnitLoadout player select 8) param [0, ""];

switch(_targetIDC) do {
case 398013 : {if(_itemMove != headgear player) then {player addHeadgear _itemMove};};
case 398014 : {if(_itemMove != goggles player) then {player addGoggles _itemMove};};
case 398015 : {if(_itemMove != _bino) then {player addWeapon _itemMove};};
case 398016 : {if(_itemMove != uniform player) then {player forceAddUniform _itemMove};};
case 398017 : {if(_itemMove != vest player) then {player addVest _itemMove};};
case 398018 : {if(_itemMove != backpack player) then {player addBackpack _itemMove};};
case 398026 : {player addMagazine _itemMove;};
case 398023 : {if(_itemMove != primaryWeapon player) then {player addWeapon _itemMove};};
case 398024 : {if(_itemMove != secondaryWeapon player) then {player addWeapon _itemMove};};
case 398025 : {if(_itemMove != handgunWeapon player) then {player addWeapon _itemMove};};
case 398027 : {if(!(_itemMove in primaryWeaponItems player)) then {player addPrimaryWeaponItem _itemMove};};
case 398028 : {if(!(_itemMove in primaryWeaponItems player)) then {player addPrimaryWeaponItem _itemMove};};
case 398029 : {if(!(_itemMove in primaryWeaponItems player)) then {player addPrimaryWeaponItem _itemMove};};
case 398030 : {if(!(_itemMove in primaryWeaponItems player)) then {player addPrimaryWeaponItem _itemMove};};
case 398035 : {if(!(_itemMove in handgunItems player)) then {player addHandgunItem _itemMove};};
case 398036 : {if(!(_itemMove in handgunItems player)) then {player addHandgunItem _itemMove};};
case 398037 : {if(!(_itemMove in handgunItems player)) then {player addHandgunItem _itemMove};};
case 398038 : {if(!(_itemMove in handgunItems player)) then {player addHandgunItem _itemMove};};
case 398040 : {[_itemMove, 1, true] call life_fnc_addItem;};
};
}else {
_uniformItems = (uniformItems player) + [_itemMove];
_vestItems = (vestItems player) + [_itemMove];
_backpackItems = (backpackItems player) + [_itemMove];
_primaryItems = (primaryWeaponItems player) + [_itemMove];
_secondaryItems = (secondaryWeaponItems player) + [_itemMove];
_handgunItems = (handgunItems player) + [_itemMove];

switch (_sourceIDC) do {
case 398016 : {[_uniformItems, 1] call life_fnc_lockerManage;};
case 398017 : {[_vestItems, 1] call life_fnc_lockerManage;};
case 398018 : {[_backpackItems, 1] call life_fnc_lockerManage;};
case 398023 : {[_primaryItems, 1] call life_fnc_lockerManage;};
case 398024 : {[_secondaryItems, 1] call life_fnc_lockerManage;};
case 398025 : {[_handgunItems, 1] call life_fnc_lockerManage;};
default {[_itemMove, 1] call life_fnc_lockerManage;};
};

switch(_sourceIDC) do {
case 398013 : {removeHeadgear player;};
case 398014 : {removeGoggles player;};
case 398015 : {player removeWeapon ((getUnitLoadout player) select 8 select 0);};
case 398016 : {removeUniform player;};
case 398017 : {removeVest player;};
case 398018 : {removeBackpack player;};
case 398023 : {player removeWeapon (primaryWeapon player);};
case 398024 : {player removeWeapon (secondaryWeapon player);};
case 398025 : {player removeWeapon (handgunWeapon player);};
case 398026 : {player removeMagazine _itemMove;};
case 398027 : {player removePrimaryWeaponItem _itemMove;};
case 398028 : {player removePrimaryWeaponItem _itemMove;};
case 398029 : {player removePrimaryWeaponItem _itemMove;};
case 398030 : {player removePrimaryWeaponItem _itemMove;};
case 398035 : {player removeHandgunItem _itemMove;};
case 398036 : {player removeHandgunItem _itemMove;};
case 398037 : {player removeHandgunItem _itemMove;};
case 398038 : {player removeHandgunItem _itemMove;};
case 398040 : {if(_itemMove in assignedItems player) then {player removeWeapon _itemMove} else {player removeItem _itemMove};};
};
};

[CURRENT_TAB] call life_fnc_lockerTab;