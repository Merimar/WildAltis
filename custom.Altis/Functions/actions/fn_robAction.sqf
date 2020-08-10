private _target = cursorObject;
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(_target getVariable ["robbed", false]) exitWith {};

_target setVariable ["robbed", true, true];
[player, _target] remoteExec ["HC_fnc_robPlayer", HC_LIFE];