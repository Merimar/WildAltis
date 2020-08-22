#include "\life_hc\hc_macros.hpp"
private _vault = param [0, objNull, [objNull]];
private _minCops = param [1, 5, [0]];
private _unit = param [2, objNull, [objNull]];
private _group = group _unit;

private _pName = name _unit;
private _pID = getPlayerUID _unit;
private _pSide = side _unit;

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_smallbank"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

if(isNull _vault || isNull _unit) exitWith {};
if(_vault getVariable ["opening", false]) exitWith {["Der Geldautomat wird bereits geknackt", true, "slow"] remoteExec ["life_fnc_showNotification", _unit];};
if(_vault getVariable ["atm_cooldown", false]) exitWith {["Die Bank kann nur alle 30 Minuten ausgeraubt werden", true, "slow"] remoteExec ["life_fnc_showNotification", _unit];};
if(west countSide playableUnits < _minCops) exitWith {[format ["Es sind nicht genügend Polizisten online.<br/>Mindestanzahl: %1", _minCops], "Kleine Bank"] remoteExec ["life_fnc_message", _unit];};
if(NO_BANK) exitWith {["Die Bank kann gerade nicht ausgeraubt werden", true, "slow"] remoteExec ["life_fnc_showNotification", _unit];};

_vault setVariable ["opening",true,true];
[2,"Eine Bank wird ausgeraubt macht euch schnell auf den Weg!"] remoteExecCall ["life_fnc_broadcast",west];
_msg = format ["Der Spieler %1 (%2 - %3) raubt eine Bank aus", _pName, _pID, _pSide];
["BankLog", _msg] call HC_fnc_Log;

[_unit, "BANK_CHARGE"] call HC_fnc_fahndungHandle;

_marker = createMarker [str(random (10000)), getPos _vault];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Überfall";
_marker setMarkerType "mil_objective";
_marker setMarkerPos (getPos _vault);

private _handle = [_vault, _unit] spawn HC_fnc_bankTimerServer;
//[_vault, _unit] remoteExec ["life_fnc_bankTimerDisplay", west];
[_vault] remoteExec ["life_fnc_bankTimer", _unit];

_members = units _group;
_members = _members - [_unit];
if(count _members > 0) then {
[_vault, _unit] remoteExec ["life_fnc_bankTimerDisplay", _members];
};

_geheimZahl = [getPlayerUID _unit] call HC_fnc_getGeheimzahl;

waitUntil {scriptDone _handle};
deleteMarker _marker;

if(_vault getVariable ["opening", false]) then {
if(isNull _unit) then {
_msg = format ["Der Spieler %1 (%2 - %3) ist bei einem Bankraub gescheitert (GANG: %4)", _pName, _pID, _pSide, _group getVariable ["gang_name", "Keine Gang"]];
["BankLog", _msg] call HC_fnc_Log;
}else {
_money = round (random [1000000, 1500000, 2000000]);
_money = round (_money * 1.3);
[_vault, _money, _geheimZahl] remoteExec ["life_fnc_smallbankcash", _unit];
[_unit, _money, _group, _pName, _pID, _pSide] spawn {
_unit = _this select 0;
_money = _this select 1;
_group = _this select 2;
private _pName = _this select 3;
private _pID = _this select 4;
private _pSide = _this select 5;
sleep (15 * 60);
if(!(isNull _unit) && {_unit getVariable ["Bank_geschafft", false]}) then {
_unit setVariable ["Bank_geschafft", false, true];
[_pID, "cash", _money, true] call HC_fnc_handleMoney;
_msg = format ["Der Spieler %1 (%2 - %3) hat eine Bank erfolgreich ausgeraubt und %4 bekommen (GANG: %5)", _pName, _pID, _pSide, [_money] call HC_fnc_numberSafe, _group getVariable ["gang_name", "Keine Gang"]];
["BankLog", _msg] call HC_fnc_Log;
}else {
_msg = format ["Der Spieler %1 (%2 - %3) hat eine Bank erfolgreich ausgeraubt, ist aber danach nicht mit dem Geld entkommen (GANG: %4)", _pName, _pID, _pSide, _group getVariable ["gang_name", "Keine Gang"]];
["BankLog", _msg] call HC_fnc_Log;
};
};
};
}else {
if(!isNull _unit) then {["Der Raub ist gescheitert", false, "slow"] remoteExec ["life_fnc_showNotification", _unit];};
_msg = format ["Der Spieler %1 (%2 - %3) ist bei einem Bankraub gescheitert (GANG: %4)", _pName, _pID, _pSide, _group getVariable ["gang_name", "Keine Gang"]];
["BankLog", _msg] call HC_fnc_Log;
};

_vault setVariable ["opening", false, true];

_vault setVariable ["atm_cooldown",true];
sleep (30 * 60);
_vault setVariable ["atm_cooldown",false];