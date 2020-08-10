#include "\life_hc\hc_macros.hpp"
private _unit = _this select 0;
private _value = _this select 1;

private _informationArray = bank_obj getVariable ["Emergency_Calls", []];
private _information = _informationArray select _value;
if (_information select 4 != name _unit) exitWith {};

_information set [4, "-1"];
_informationArray set [_value, _information];
bank_obj setVariable ["Emergency_Calls", _informationArray, true];

private _finalPlayer = objNull;
private _name = _information select 0;
_finalPlayer = playableUnits select {name _x == _name};
if(count _finalPlayer isEqualTo 0) exitWith {};
_finalPlayer = _finalPlayer select 0;

["Dein Auftrag wurde abgebrochen.", "Notruf abgebrochen"] remoteExec ["life_fnc_message", _finalPlayer];
_finalPlayer setVariable ["notruf_index", -1];
_finalPlayer setVariable ["notruf_medic", "", true];