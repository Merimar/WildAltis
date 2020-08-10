#include "..\script_macros.hpp"

_unit = lbData[100021,lbCurSel (100021)];
_unit = call compile format["%1", _unit];

if(player getVariable ["List", false]) then {
_unit = lbData[100022,lbCurSel (100022)];
_unit = call compile format["%1", _unit];
};

if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

[player, _unit] remoteExec ["HC_fnc_adminStrip", HC_LIFE];