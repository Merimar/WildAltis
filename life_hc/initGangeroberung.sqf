private _query = "SELECT value FROM settings WHERE name = 'gangeroberung'";
private _queryResult = [_query, 2] call HC_fnc_asyncCall;
private _currentCaptured = _queryResult select 0;
SCHILD_DEALER setVariable["Zone_Dealer_Winner", _currentCaptured, true];
"Gangeroberung_Text" setMarkerText format [" Gangfight - %1", _currentCaptured];

ANMELDUNGEN = [];
ANMELDEN = false;
NO_BANK = true;
GE_ACTIVE = false;

publicVariable "ANMELDEN";
publicVariable "NO_BANK";

sleep (10 * 60);

GE_ACTIVE = true;
ANMELDEN = true;
publicVariable "ANMELDEN";
SCHILD_DEALER setVariable["Zone_Dealer_Time", servertime + (10 * 60), true];

sleep (10 * 60);

ANMELDEN = false;
publicVariable "ANMELDEN";
_member = playableUnits select {(group _x) in ANMELDUNGEN};
if(count _member isEqualTo 0) exitWith {};
SCHILD_DEALER setVariable["Zone_Dealer_Time", servertime + (10 * 60), true];
SCHILD_DEALER setVariable["Zone_Dealer_Start", true, true];

_gangList = [];
{_gangList pushBack (_x getVariable ["gang_name",""]);}forEach ANMELDUNGEN;
_gangs = format ["Folgende Gangs sind beteiligt:<br/><br/><t align = 'center'>%1</t>", _gangList joinString "<br/>"];
[_gangs, "Der Kampf beginnt!"] remoteExec ["life_fnc_message", _member];
{_x setVariable ["gangeroberung", false, true];}forEach ANMELDUNGEN;

sleep (10 * 60);

GE_ACTIVE = false;
SCHILD_DEALER setVariable["Zone_Dealer_Start", false, true];
_member = playableUnits select {(group _x) in ANMELDUNGEN};
_currentCaptured = SCHILD_DEALER getVariable ["Zone_Dealer_Winner", ""];
["Der Gangfight ist vorbei, ihr dürft euch nun dem Gebiet nähern!", "Gangfight vorbei"] remoteExec ["life_fnc_message", independent];
if(_currentCaptured == "" || "'" in _currentCaptured) exitWith {
["EroberungLog", "Der Gangfight wurde von keiner Gang eingenommen"] call HC_fnc_Log;
["Der Gangfight wurde von keiner Gang eingenommen", "Gangfight"] remoteExec ["life_fnc_message", _member];
};

[format ["Die Gang %1 hat den Gangfight gewonnen", _currentCaptured], "Gangfight"] remoteExec ["life_fnc_message", _member];
["EroberungLog", format ["Die Gang %1 hat den Gangfight gewonnen", _currentCaptured]] call HC_fnc_Log;

"Gangeroberung_Text" setMarkerText format [" Gangfight - %1", _currentCaptured];

_query = format ["UPDATE settings SET value = '%1' WHERE name = 'gangeroberung'", _currentCaptured];
[_query, 1] call HC_fnc_asyncCall;

{
private _xName = _x getVariable ["gang_name", "."];
if(_xName == _currentCaptured) exitWith {[_x] call HC_fnc_giveRandomBuff;};
}forEach allGroups;

ANMELDUNGEN = [];
NO_BANK = false;
publicVariable "NO_BANK";