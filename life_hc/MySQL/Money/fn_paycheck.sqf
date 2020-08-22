#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull];

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _pName = name _unit;

private _saveState = [_pID] call HC_fnc_getSave;

waitUntil {count (_saveState select SAVE_STATE_INDEX) > 0};

private _geheimZahl = [_pID] call HC_fnc_getGeheimzahl;
private _levelIdentifier = if(_pSide isEqualTo west) then {"cop"} else {"medic"};
private _level = [_pID, _levelIdentifier] call HC_fnc_getSpecialLevel;

private _money = switch (_pSide) do {
	case west : {missionNamespace getVariable [format ["PAYCHECK_MONEY_COP_%1", _level], 0];};
	case independent : {missionNamespace getVariable [format ["PAYCHECK_MONEY_MEDIC_%1", _level], 0];};
	case civilian : {PAYCHECK_MONEY_CIV};
	case east : {PAYCHECK_MONEY_EAST};
};

//private _extraMoney = [_pID] call HC_fnc_getHigherPaycheck;
//if(isNil "_extraMoney" || {!(_extraMoney isEqualType 0)}) then {_extraMoney = 0;};
//_money = _money + _extraMoney;

if(_money <= 0) exitWith {};

for "_int" from 0 to 1 step 0 do {
sleep (5 * 60);
if(isNull _unit) then {_unit = [_pID] call  HC_fnc_getPlayerByUID;};
if(!(isNull _unit)) then {
[_pID, "bank", _money, true] call HC_fnc_handleMoney;
[_money, _geheimZahl] remoteExec ["life_fnc_paycheck", _unit];
_msg = format ["Der Spieler %1 (%2 - %3) hat einen Paycheck bekommen (+%4)", _pName, _pID, _pSide, [_money] call HC_fnc_numberSafe];
["MoneyLog", _msg] call HC_fnc_Log;
};
};