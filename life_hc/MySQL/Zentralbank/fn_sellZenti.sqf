private _unit = param [0, objNull, [objNull]];
private _fuel = param [1, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_sellZenti"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

if(MAXFUEL < _fuel) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte Zenti Inhalt verkaufen, es gibt aber nicht soviel Zenti Inhalt (%4 < %5)", name _unit, getPlayerUID _unit, side _unit, MAXFUEL, _fuel];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Zenti Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Zenti Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

MAXFUEL = MAXFUEL - _fuel;

private _msg = format ["Der Spieler %1 (%2 - %3) hat Zenti Inhalt verkauft (%4)", name _unit, getPlayerUID _unit, side _unit, _fuel];
["BankLog", _msg] call HC_fnc_Log;

private _moneyGive = _fuel * 1000000;
[getPlayerUID _unit, side _unit, "cash", _moneyGive, true] call HC_fnc_handleMoney;