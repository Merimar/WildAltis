private _classname = param [0, "", [""]];

if(_classname == "") exitWith {false};

private _hasSpace = [_classname] call life_fnc_canAddItem;
private _itemType = [_classname] call life_fnc_getItemType;

private _uniform = uniform player;
private _vest = vest player;
private _backpack = backpack player;
private _headgear = headgear player;
private _glasses = goggles player;
private _binocular = binocular player;
private _primary = primaryWeapon  player;
private _secondary = secondaryWeapon player;
private _handgun = handgunWeapon player;

if(_itemType isEqualTo 0 && _primary == "") then {_hasSpace = true;};
if(_itemType isEqualTo 1 && _secondary == "") then {_hasSpace = true;};
if(_itemType isEqualTo 2 && _handgun == "") then {_hasSpace = true;};

if(_itemType isEqualTo 5 && _uniform == "") then {_hasSpace = true;};
if(_itemType isEqualTo 6 && _vest == "") then {_hasSpace = true;};
if(_itemType isEqualTo 7 && _backpack == "") then {_hasSpace = true;};
if(_itemType isEqualTo 8 && _headgear == "") then {_hasSpace = true;};
if(_itemType isEqualTo 9 && _glasses == "") then {_hasSpace = true;};

if(_itemType isEqualTo 5 && _uniform != "") then {_hasSpace = [_classname, "backpack"] call life_fnc_canAddItem;};
if(_itemType isEqualTo 6 && _vest == "") then {_hasSpace = [_classname, "backpack"] call life_fnc_canAddItem;};
if(_itemType isEqualTo 7 && _backpack != "") then {_hasSpace = false;};

if(_classname in ["Rangefinder", "Binocular"] && _binocular == "") then {_hasSpace = true;};
if(_classname in ["ItemMap", "ItemRadio", "ItemCompass", "ItemWatch", "ItemGPS"] && !(_classname in assignedItems player)) then {_hasSpace = true;};

_hasSpace;