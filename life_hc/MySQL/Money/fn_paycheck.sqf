#include "\life_hc\hc_macros.hpp"
private _unit = _this select 0;

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _pName = name _unit;

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {};

waitUntil {count (SAVE_ARRAY select _index select SAVE_STATE_INDEX) > 0};

private _geheimZahl = [_pID, _pSide] call HC_fnc_getGeheimzahl;
private _levelIdentifier = if(_pSide isEqualTo west) then {"cop"} else {"medic"};
private _level = [_pID, _pSide, _levelIdentifier] call HC_fnc_getSpecialLevel;
private _money = switch (_pSide) do {
	case west : {missionNamespace getVariable [format ["PAYCHECK_MONEY_COP_%1", _level], 0];};
	case independent : {missionNamespace getVariable [format ["PAYCHECK_MONEY_MEDIC_%1", _level], 0];};
	case civilian : {PAYCHECK_MONEY_CIV};
	case east : {PAYCHECK_MONEY_EAST};
};

if(_money <= 0) exitWith {};

for "_int" from 0 to 1 step 0 do {
sleep (5 * 60);
if(isNull _unit) then {_unit = [_pID] call  HC_fnc_getPlayerByUID;};
if(!(isNull _unit)) then {
[_pID, _pSide, "bank", _money, true] call HC_fnc_handleMoney;
[_money, _geheimZahl] remoteExec ["life_fnc_paycheck", _unit];
_msg = format ["Der Spieler %1 (%2 - %3) hat einen Paycheck bekommen (+%4)", _pName, _pID, _pSide, [_money] call HC_fnc_numberSafe];
["MoneyLog", _msg] call HC_fnc_Log;
};
};