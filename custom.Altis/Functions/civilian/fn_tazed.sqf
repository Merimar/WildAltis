private _unit = param [0, objNull];
private _cop = param [1, objNull];

if(isNull _unit || isNull _cop || {player getVariable["restrained", false]} || playerSide isEqualTo west || life_istazed) exitWith {};
if(side _cop != west || playerSide == west) exitWith {};

if(typeOf vehicle player in ["B_Quadbike_01_F", "C_Kart_01_Blu_F", "C_Kart_01_Fuel_F", "C_Kart_01_Red_F", "C_Kart_01_Vrana_F"]) then {player action["Eject", vehicle player];};

life_istazed = true;
disableUserInput true;
private _tazePeople = playableUnits select {player distance _x <= 50};
[_unit, "tazer"] remoteExecCall ["life_fnc_say3D", _tazePeople];
[0, format ["%1 wurde von %2 getazert", name _unit, name _cop]] remoteExec ["life_fnc_broadcast", -2];
player setUnconscious true;
sleep 30;
player setUnconscious false;
player playMoveNow "AmovPercMstpSnonWnonDnon";
disableUserInput false;
life_istazed = false;