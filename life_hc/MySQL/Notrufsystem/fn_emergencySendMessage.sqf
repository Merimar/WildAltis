#include "\life_hc\hc_macros.hpp"
private _unit = _this select 0;
private _value = _this select 1;
private _message = _this select 2;

private _informationArray = bank_obj getVariable ["Emergency_Calls", []];
private _information = _informationArray select _value;
private _name = _information select 0;
private _messages = _information select 1;
if(_information select 5) exitWith {};

private _time = bank_obj getVariable ["time", []];
private _minuten = (_time select 4);
private _stunden = (_time select 3);
private _time = [_stunden, _minuten];

_messages pushBack [_message,_time,true];
_information set [1, _messages];
_informationArray set [_value,_information];
bank_obj setVariable ["Emergency_Calls", _informationArray, true];

private _finalPlayer = playableUnits select {name _x == _name};
if(count _finalPlayer isEqualTo 0) exitWith {};
_finalPlayer = _finalPlayer select 0;

if((side _unit) isEqualTo west) then {
[10, _message, name _unit] remoteExec ["life_fnc_receiveMessage", _finalPlayer];
}else {
[11, _message, name _unit] remoteExec ["life_fnc_receiveMessage", _finalPlayer];
};