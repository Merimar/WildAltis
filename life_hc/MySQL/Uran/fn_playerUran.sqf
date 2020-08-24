private _unit = param [0, objNull, [objNull]];
private _endTime = servertime + (5 * 60);

if((_unit getVariable ["UranTime", 0]) != 0) exitWith {};

_unit setVariable ["UranTime", _endTime, true];

waitUntil {isNull _unit || {(_unit getVariable ["UranTime", 0]) isEqualTo 0 || (_endTime - servertime) <= 0}};

if(isNull _unit) exitWith {["StrahlungLog", format ["Der Spieler %1 (%2 - %3) hat sich mit Uran im Inventar ausgeloggt (REST-ZEIT: %4)", name _unit, getPlayerUID _unit, side _unit, _endTime - servertime]] call HC_fnc_Log;};
if((_unit getVariable ["UranTime", 0]) isEqualTo 0) exitWith {};

_unit setDamage 1;
["Du hast deine Ladung Unstable Uran nicht rechtzeitig in die Hände eines Fachmannes gebracht!", "Unstable Uran"] remoteExec ["life_fnc_message", _unit];
["StrahlungLog", format ["Der Spieler %1 (%2 - %3) ist durch Unstable Uran gestorben", name _unit, getPlayerUID _unit, side _unit]] call HC_fnc_Log;