private _unit = param [0, objNull, [objNull]];
private _restrainedPlayer = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_copMoney"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _restrainedPlayer) exitWith {};

if(side _unit != west) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte dem Spieler %4 (%5 - %6) als Cop Geld abnehmen, ist aber gar kein Cop", name _unit, getPlayerUID _unit, side _unit, name _restrainedPlayer, getPlayerUID _restrainedPlayer, side _restrainedPlayer];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "CopMoney Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein CopMoney Hack festgestellt", name _unit], true] call HC_fnc_adminMessage;
};

private _money = [getPlayerUID _restrainedPlayer, "cash"] call HC_fnc_getMoney;

if(_money <= 0) then {
["", "Der Spieler hatte kein Geld dabei"] remoteExec ["life_fnc_message", _unit];
}else {
[getPlayerUID _restrainedPlayer, "cash", _money, false] call HC_fnc_handeMoney;
[format ["Du hast dem Spieler %1 €%2 entfernt."], "Geld gelöscht"] remoteExec ["life_fnc_message", _unit];
};

private _geheimZahl = [getPlayerUID _restrainedPlayer] call HC_fnc_getGeheimzahl;
[_geheimZahl] remoteExec ["life_fnc_copRemoveMoney", _restrainedPlayer];

private _msg = format ["Der Polizist %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) €%7 an Geld beschlagnahmt", name _unit, getPlayerUID _unit, side _unit, name _restrainedPlayer, getPlayerUID _restrainedPlayer, side _restrainedPlayer, [_money] call life_fnc_numberText];
["CopLog", _msg] call HC_fnc_Log;