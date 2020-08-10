#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _moneyPlayer = param [1, objNull, [objNull]];
private _money = param [2, 0, [0]];
private _tax = param [3, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_transferMoney"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _moneyPlayer) exitWith {};

private _bankMoney = [getPlayerUID _unit, side _unit, "bank"] call HC_fnc_getMoney;
private _geheimZahl = [getPlayerUID _moneyPlayer, side _moneyPlayer] call HC_fnc_getGeheimzahl;

if(_bankMoney < (_money + _tax)) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte dem Spieler %4 (%5 - %6) Geld ueberweisen, hat allerdings nicht genuegend Geld auf dem Konto (%7 < %8)", name _unit, getPlayerUID _unit, side _unit, name _moneyPlayer, getPlayerUID _moneyPlayer, side _moneyPlayer, [_bankMoney] call HC_fnc_numberSafe, [_money] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "MoneyTransfer Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein MoneyTransfer Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, side _unit, "bank", round(_money + _tax), false] call HC_fnc_handleMoney;
[getPlayerUID _moneyPlayer, side _moneyPlayer, "bank", _money, true] call HC_fnc_handleMoney;
[_money, _unit,_geheimZahl] remoteExec ["life_fnc_wireTransfer", _moneyPlayer];

private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) %7 ueberwiesen", name _unit, getPlayerUID _unit, side _unit, name _moneyPlayer, getPlayerUID _moneyPlayer, side _moneyPlayer, [_money] call HC_fnc_numberSafe];
["MoneyLog", _msg] call HC_fnc_Log;

if((side _unit) isEqualTo west && ((side _moneyPlayer) isEqualTo civilian || (side _moneyPlayer) isEqualTo east)) then {
_msg = format ["Der Polizist %1 (%2 - %3) hat dem Zivilisten %4 (%5 - %6) %7 ueberwiesen", name _unit, getPlayerUID _unit, side _unit, name _moneyPlayer, getPlayerUID _moneyPlayer, side _moneyPlayer, [_money] call HC_fnc_numberSafe];
["CopLog", _msg] call HC_fnc_Log;
};