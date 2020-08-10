disableSerialization;
if(isNull findDisplay 3750) then {createDialog "Loadout";};
_display = findDisplay 3750;

_loadouts = _display displayCtrl 3751;
lbClear _loadouts;

_loadouts lbAdd "Loadout 1";
_loadouts lbAdd "Loadout 2";
_loadouts lbAdd "Loadout 3";
_loadouts lbAdd "Loadout 4";
_loadouts lbAdd "Loadout 5";