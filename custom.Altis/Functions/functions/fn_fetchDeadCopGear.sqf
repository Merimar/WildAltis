private _gear = param [0, []];
if(_gear isEqualTo []) exitWith {[]};

_primaryWeaponArray = _gear select 0;
_secondaryWeaponArray = _gear select 1;
_handgunWeaponArray = _gear select 2;
_uniformArray = _gear select 3;
_vestArray = _gear select 4;
_backpackArray = _gear select 5;
_helmet = _gear select 6;
_glasses = _gear select 7;
_binocularArray = _gear select 8;
_assignedItems = _gear select 9;

_primaryWeapon = _primaryWeaponArray select 0;
_secondaryWeapon = _secondaryWeaponArray select 0;
_handgunWeapon = _handgunWeaponArray select 0;
_uniform = _uniformArray select 0;
_vest = _vestArray select 0;
_backpack = _backpackArray select 0;
_binocular = _binocularArray select 0;
_gear;