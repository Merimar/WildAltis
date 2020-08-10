#include "..\script_macros.hpp"
private _cop = param [0, objNull];
if(isNull _cop) exitWith {};

private _licenseArray = [];
{
private _displayName = localize getText (missionConfigFile >> "Licenses" >> _x >> "displayName");
_licenseArray pushBack _displayName;
}forEach LICENSES;

private _licenseText = _licenseArray joinString "<br/>";

if(count LICENSES isEqualTo 0) then {_licenseText = "Keine Lizenzen gefunden";};
[_licenseText, format["%1 Lizenzen", profileName], 10] remoteExec ["life_fnc_message", _cop];