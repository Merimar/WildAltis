#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _money = param [1, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_bankWithdraw"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _bankMoney = [getPlayerUID _unit, "bank"] call HC_fnc_getMoney;

if(_bankMoney < _money) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte %4 von der Bank abheben, hat aber nur %5 an Bankguthaben", name _unit, getPlayerUID _unit, side _unit, [_money] call HC_fnc_numberSafe, [_bankMoney] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "BankWithdraw Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein BankWithdraw Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, "bank", _money, false] call HC_fnc_handleMoney;
[getPlayerUID _unit, "cash", _money, true] call HC_fnc_handleMoney;

private _handMoney = [getPlayerUID _unit, "cash"] call HC_fnc_getMoney;
private _msg = format ["Der Spieler %1 (%2 - %3) hat sich %4 von der Bank ausgezahlt. Aktuelles Bargeld: %5", name _unit, getPlayerUID _unit, side _unit, [_money] call HC_fnc_numberSafe, [_handMoney] call HC_fnc_numberSafe];
["MoneyLog", _msg] call HC_fnc_Log;
