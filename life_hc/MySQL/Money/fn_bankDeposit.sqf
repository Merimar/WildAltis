#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _moneyBankDeposit = param [1, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_bankDeposit"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _handMoney = [getPlayerUID _unit, side _unit, "cash"] call HC_fnc_getMoney;

if(_handMoney < _moneyBankDeposit) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte %4 auf die Bank einzahlen, hat aber nur %5 an Bargeld", name _unit, getPlayerUID _unit, side _unit, [_moneyBankDeposit] call HC_fnc_numberSafe, [_handMoney] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "BankDeposit Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein BankDeposit Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, side _unit, "cash", _moneyBankDeposit, false] call HC_fnc_handleMoney;
[getPlayerUID _unit, side _unit, "bank", _moneyBankDeposit, true] call HC_fnc_handleMoney;

private _bankMoney = [getPlayerUID _unit, side _unit, "bank"] call HC_fnc_getMoney;
private _msg = format ["Der Spieler %1 (%2 - %3) hat %4 auf die Bank eingezahlt. Aktuelles Bankguthaben: %5", name _unit, getPlayerUID _unit, side _unit, [_moneyBankDeposit] call HC_fnc_numberSafe, [_bankMoney] call HC_fnc_numberSafe];
["MoneyLog", _msg] call HC_fnc_Log;