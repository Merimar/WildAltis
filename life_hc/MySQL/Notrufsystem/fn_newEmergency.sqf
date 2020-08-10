#include "\life_hc\hc_macros.hpp"
_player = _this select 0;
_value = _this select 1;
_message = _this select 2;
_faction = _this select 3;
_pos = param [4, "Unbekannt"];

_time = bank_obj getVariable ["time", []];
_minuten = (_time select 4);
_stunden = (_time select 3);
_time = [_stunden, _minuten];
_informationArray = bank_obj getVariable ["Emergency_Calls", []];
_indexe = [];

private _realPos = if(_pos != "Unbekannt") then {getPos _player} else {[0, 0, 0]};

if(_value isEqualTo -1) exitWith {
_array = [name _player, [[_message, _time, false]], _time, _pos, "-1", false, _faction, _realPos];
{
if((_x select 0) == (name _player)) then {
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