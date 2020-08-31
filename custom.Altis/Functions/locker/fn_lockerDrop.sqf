disableSerialization;
private _target = param [0, controlNull];
private _sourceIDC = param [3, -1];
private _information = param [4, []];
private _sourceInfo = _information param [0, []];
private _itemMove = _sourceInfo param [2, ""];
private _targetIDC = ctrlIDC _target;
private _display = findDisplay 398000;

if(time - life_locker_delay < 1) exitWith {};
life_locker_delay = time;

if(_sourceIDC isEqualTo _targetIDC || _itemMove == "") exitWith {};

if(_targetIDC isEqualTo 398039) then {
//Ins Schließfach

private _allItems = switch (true) do {
	case (_itemMove == uniform player) : {([_itemMove] + uniformItems player)};
	case (_itemMove == vest player) : {([_itemMove] + vestItems player)};
	case (_itemMove == backpack player) : {([_itemMove] + backpackItems player)};
	case (_itemMove == primaryWeapon player) : {([_itemMove] + primaryWeaponItems player + primaryWeaponMagazine player)};
	case (_itemMove == secondaryWeapon player) : {([_itemMove] + secondaryWeaponItems player + secondaryWeaponMagazine player)};
	case (_itemMove == handgunWeapon player) : {([_itemMove] + handgunItems player + handgunMagazine player)};
	default {[_itemMove]};
};

for "_int" from 0 to (count _allItems - 1) step 1 do {
private _curItem = _allItems select _int;
if(_curItem != "") then {[_allItems select _int, 1] call life_fnc_lockerManage;};
};

switch (true) do {
	case (_itemMove == uniform player) : {removeUniform player;};
	case (_itemMove == vest player) : {removeVest player;};
	case (_itemMove == backpack player) : {removeBackpack player;};
	case (_itemMove == primaryWeapon player) : {player removeWeapon (primaryWeapon player);};
	case (_itemMove == secondaryWeapon player) : {player removeWeapon (secondaryWeapon player);};
	case (_itemMove == handgunWeapon player) : {player removeWeapon (handgunWeapon player);};
	case (_itemMove in ["Binocular", "Rangefinder"] && _itemMove in assignedItems player) : {player removeWeapon _itemMove;};
	default {[_itemMove, false] call life_fnc_handleItem;};
};
}else {
//Aus dem Schließfach
if(!([_itemMove] call life_fnc_lockerCanAdd)) exitWith {["Du hast zuwenig Platz dafür", "Schließfach"] spawn life_fnc_message;};
if(_itemMove in ["ItemMap", "ItemRadio", "ItemCompass", "ItemWatch", "ItemGPS", "Rangefinder", "Binocular"]) then {
player addItem _itemMove;
}else {
[_itemMove, true] call life_fnc_handleItem;
};
[_itemMove, -1] call life_fnc_lockerManage;
};

[true] call life_fnc_lockerMenu;