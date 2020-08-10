#include "\life_hc\hc_macros.hpp"
private _unit = _this select 0;
private _value = _this select 1;

private _informationArray = bank_obj getVariable ["Emergency_Calls", []];
private _information = _informationArray select _value;
if (_information select 4 != "-1") exitWith {};

_information set [4, name _unit];
_informationArray set [_value, _information];
bank_obj setVariable ["Emergency_Calls", _informationArray, true];

_finalPlayer = objNull;
_name = _information select 0;
_finalPlayer = playableUnits select {name _x == _name};
if(count _finalPlayer isEqualTo 0) exitWith {};
_finalPlayer = _finalPlayer select 0;

[format ["Dein Auftrag wurde von %1 angenommen.", name _unit], "Notruf angenommen"] remoteExec ["life_fnc_message", _finalPlayer];

if((side _unit) isEqualTo independent) then {
_finalPlayer setVariable ["notruf_index", _value];
_finalPlayer setVariable ["notruf_medic", name _unit, true];
};