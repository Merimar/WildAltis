#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _value = param [1, -1, [0]];
private _message = param [2, "", [""]];
private _faction = param [3, sideUnknown, [sideUnknown]];
private _pos = param [4, "Unbekannt", [""]];
private _deadPosition = param [5, [0,0,0], [[]]];

private _time = bank_obj getVariable ["time", []];
private _minuten = (_time select 4);
private _stunden = (_time select 3);
_time = [_stunden, _minuten];
private _informationArray = bank_obj getVariable ["Emergency_Calls", []];
private _indexe = [];

private _realPos = if(_pos != "Unbekannt") then {getPos _unit} else {[0, 0, 0]};
private _isDead = ((_deadPosition select 0) != 0 && (_deadPosition select 1) != 0);
if(_isDead) then {_realPos = _deadPosition;};

if(_value isEqualTo -1) exitWith {
_array = [name _unit, [[_message, _time, false]], _time, _pos, "-1", false, _faction, _realPos, _isDead];
{
if((_x select 0) == (name _unit)) then {
_indexe pushBack _forEachIndex;
};
}forEach _informationArray;
{
_info = _informationArray select _x;
_info set [5, true];
_informationArray set [_x, _info];
}forEach _indexe;
_informationArray pushBack _array;
bank_obj setVariable ["Emergency_Calls", _informationArray, true];
};

_information = _informationArray select _value;
_messages = _information select 1;

_messages pushBack [_message,_time,false];
_information set [1, _messages];
_informationArray set [_value,_information];
bank_obj setVariable ["Emergency_Calls", _informationArray, true];