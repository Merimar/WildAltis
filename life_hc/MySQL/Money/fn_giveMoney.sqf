#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _moneyPlayer = param [1, objNull, [objNull]];
private _money = param [2, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_giveMoney"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _handMoney = [getPlayerUID _unit, "cash"] call HC_fnc_getMoney;
private _geheimZahl = [getPlayerUID _moneyPlayer] call HC_fnc_getGeheimzahl;

if(_handMoney < _money) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte dem Spieler %4 (%5 - %6) Geld geben, hat allerdings nicht genuegend Geld auf der Hand (%6 < %7)", name _unit, getPlayerUID _unit, side _unit, name _moneyPlayer, getPlayerUID _moneyPlayer, side _moneyPlayer, [_handMoney] call HC_fnc_numberSafe, [_money] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "MoneyGive Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein MoneyGive Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, side _unit, "cash", _money, false] call HC_fnc_handleMoney;
[getPlayerUID _moneyPlayer, "cash", _money, true] call HC_fnc_handleMoney;
[_moneyPlayer,_money,_unit,false,false,_geheimZahl] remoteExec ["life_fnc_receiveMoney", _moneyPlayer];

private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) %7 gegeben", name _unit, getPlayerUID _unit, side _unit, name _moneyPlayer, getPlayerUID _moneyPlayer, side _moneyPlayer, [_money] call HC_fnc_numberSafe];
["MoneyLog", _msg] call HC_fnc_Log;

if((side _unit) isEqualTo west && ((side _moneyPlayer) isEqualTo civilian || (side _moneyPlayer) isEqualTo east)) then {
_msg = format ["Der Polizist %1 (%2 - %3) hat dem Zivilisten %4 (%5 - %6) %7 gegeben", name _unit, getPlayerUID _unit, side _unit, name _moneyPlayer, getPlayerUID _moneyPlayer, side _moneyPlayer, [_money] call HC_fnc_numberSafe];
["CopLog", _msg] call HC_fnc_Log;
};