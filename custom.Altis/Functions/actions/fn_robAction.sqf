private _target = cursorObject;
if (isNull _target || {!isPlayer _target || {_target getVariable ["robbed", false]}}) exitWith {};

_target setVariable ["robbed", true, true];
[player, _target] remoteExec ["HC_fnc_robPlayer", HC_LIFE];