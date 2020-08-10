#include "..\..\script_macros.hpp"
disableSerialization;
private _amount = parseNumber (ctrlText 4354);
private _curSel = lbCurSel 4353;

if(_curSel isEqualTo -1 || _amount <= 0) exitWith {["", "Du hast nichts augewählt"] spawn life_fnc_message;};

private _unit = call compile format ["%1", lbData [4353, _curSel]];

if(_amount > CASH) exitWith {["", "Du hast nicht soviel Geld"] spawn life_fnc_message;};
if(isNull _unit) exitWith {};
if(player distance _unit > 10) exitWith {["", "Der Spieler ist auserhalb deiner Reichweite"] spawn life_fnc_message;};
if(moneyGive_TIMER) exitWith {["", "Du kannst nur alle 5 Sekunden Geld geben"] spawn life_fnc_message;};

[] spawn {moneyGive_TIMER = true;sleep 5;moneyGive_TIMER = false;};
[format["Du hast dem Spieler %1 €%2 gegeben", name _unit, [_amount] call life_fnc_numberText], "Geld gegeben"] spawn life_fnc_message;

CASH = CASH - _amount;
[] call life_fnc_openZInv;
[player, _unit, _amount] remoteExecCall ["HC_fnc_giveMoney",HC_LIFE];