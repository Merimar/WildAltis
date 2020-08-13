#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _victim = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_robPlayer"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _victim) exitWith {};

private _handMoney = [getPlayerUID _victim, "cash"] call HC_fnc_getMoney;
private _geheimZahl1 = [getPlayerUID _unit] call HC_fnc_getGeheimzahl;
private _geheimZahl2 = [getPlayerUID _victim] call HC_fnc_getGeheimzahl;

if(_handMoney > 0) then {
[_handMoney, _unit, _victim, true, _geheimZahl1] remoteExec ["life_fnc_robPerson", _unit];
[_handMoney, _unit, _victim, false, _geheimZahl2] remoteExec ["life_fnc_robPerson", _victim];
[getPlayerUID _unit, "cash", _handMoney, true] call HC_fnc_handleMoney;
[getPlayerUID _victim, "cash", _handMoney, false] call HC_fnc_handleMoney;
[_unit, "ROBBERY"] call HC_fnc_fahndungHandle;
[0, format ["%1 hat €%2 von %3 geraubt", name _unit, [_handMoney] call life_fnc_numberText, name _victim], false] remoteExec ["life_fnc_broadcast", -2];
private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) %7 geraubt", name _unit, getPlayerUID _unit, side _unit, name _victim, getPlayerUID _victim, side _victim, [_handMoney] call HC_fnc_numberSafe];
["MoneyLog", _msg] call HC_fnc_Log;

if((side _victim) isEqualTo west && ((side _unit) isEqualTo civilian || (side _unit) isEqualTo east)) then {
_msg = format ["Der Spieler %1 (%2 - %3) wurde von dem Zivilisten %4 (%5 - %6) um %7 ausgeraubt", name _victim, getPlayerUID _victim, side _victim, name _unit, getPlayerUID _unit, side _unit, [_handMoney] call HC_fnc_numberSafe];
["CopLog", _msg] call HC_fnc_Log;
};
}else {
["Der Spieler hat kein Geld", true, "slow"] remoteExecCall ["life_fnc_showNotification",_unit];
};

