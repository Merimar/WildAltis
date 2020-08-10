private _target = param [0, objNull];

if(isNull _target || {!(isPlayer _target) || player distance _target > 4 || playerSide isEqualTo independent}) exitWith {};
life_knockout = true;
[player, "AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["life_fnc_animSync", -2];
sleep 0.08;
[profileName] remoteExec ["life_fnc_knockedOut", _target];
sleep 3;
life_knockout = false;