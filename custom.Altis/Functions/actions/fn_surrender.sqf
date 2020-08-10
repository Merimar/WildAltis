if(player getVariable ["restrained",false] || {player getVariable ["Escorting",false]} || !isNull objectParent player || speed player > 1) exitWith {};

private _state = player getVariable ["playerSurrender", false];
player setVariable ["playerSurrender", !_state, true];

while {player getVariable ["playerSurrender", false]} do {
    player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
    if(life_isDead || !isNull objectParent player) then {player setVariable ["playerSurrender", false, true];};
};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";