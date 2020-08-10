private _unit = param [0, objNull];
private _state = player getVariable ["execution", false];

if(_state) then {
player setVariable ["restrained", false, true];
player setVariable ["Escorting", false, true];
player setVariable ["transporting", false, true];
detach player;
[player, "Acts_ExecutionVictim_Loop"] remoteExec ["life_fnc_animSync", -2];
}else {
[player, "Acts_ExecutionVictim_Unbow"] remoteExec ["life_fnc_animSync", -2];
waitUntil {animationState player != "Acts_ExecutionVictim_Unbow"};
player setVariable ["restrained", true, true];
[_unit] spawn life_fnc_restrain;
};