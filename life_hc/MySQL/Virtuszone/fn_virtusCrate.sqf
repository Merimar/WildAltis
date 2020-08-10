private _unit = param [0, objNull, [objNull]];
private _time = param [1, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_virtusCrate"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

if(abs (_time - time) > 1) then {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte eine Virtuskiste öffnen, hat aber länger als 2 Sekunden gebraucht um die Kiste zu öffnen (Lagswitch)", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Virtus Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Virtus Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};