private _vehicle = param [0, objNull];
private _siren = param [1, ""];

private _sirenState = format ["%1_state", _siren];

if(SIREN_TIMER) exitWith {};
[] spawn {SIREN_TIMER = true;sleep 2;SIREN_TIMER = false;};

private _sirenStateVar = _vehicle getVariable [_sirenState, false];
_vehicle setVariable [_sirenState, !_sirenStateVar, true];

if(_sirenStateVar) exitWith {titleText ["Sirene ausgeschaltet", "PLAIN"];};
titleText ["Sirene angeschaltet", "PLAIN"];

private _isRunning = _vehicle getVariable [_siren, false];
if(_isRunning) exitWith {};

[_vehicle, _siren] remoteExec ["life_fnc_siren", playableUnits];