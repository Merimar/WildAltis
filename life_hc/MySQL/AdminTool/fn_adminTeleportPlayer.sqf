private _unit = param [0, objNull, [objNull]];
private _teleportPlayer = param [1, objNull, [objNull, []]];
private _tel = param [2, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_adminTeleportPlayer", true] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _msg = "";

if(_tel isEqualTo 0) then {
(vehicle _unit) setPos (getPos _teleportPlayer);
_msg = format ["Der Spieler %1 (%2 - %3) hat sich zu %4 (%5 - %6) teleportiert", name _unit, getPlayerUID _unit, side _unit, name _teleportPlayer, getPlayerUID _teleportPlayer, side _teleportPlayer];
};

if(_tel isEqualTo 1) then {
(vehicle _teleportPlayer) setPos (getPos _unit);
_msg = format ["Der Spieler %1 (%2 - %3) hat %4 (%5 - %6) zu sich teleportiert", name _unit, getPlayerUID _unit, side _unit, name _teleportPlayer, getPlayerUID _teleportPlayer, side _teleportPlayer];
};

if(_tel isEqualTo 2) then {
(vehicle _unit) setPos _teleportPlayer;
_msg = format ["Der Spieler %1 (%2 - %3) hat sich auf der Map teleportiert", name _unit, getPlayerUID _unit, side _unit];
};

["AdminLog", _msg] call HC_fnc_Log;