private _unit = cursorObject;
if(isNull _unit || {player distance _unit > 3 || {_unit getVariable ["restrained", false]} || side _unit isEqualTo west && (playerSide isEqualTo west || playerSide isEqualTo east) || !isPlayer _unit}) exitWith {};

_unit setVariable ["restrained", true, true];
_unit setVariable ["execution", false, true];
[player] remoteExec ["life_fnc_restrain", _unit];

[0, format ["%1 hat %2 festgenommen", profileName, name _unit]] remoteExecCall ["life_fnc_broadcast",west];

if(playerSide in [east, civilian]) then {
[player, "kabelbinder"] remoteExec ["HC_fnc_useItem", HC_LIFE];
};