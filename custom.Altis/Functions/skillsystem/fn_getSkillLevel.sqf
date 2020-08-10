#include "..\script_macros.hpp"
private _skill = param [0, ""];
private _points = [_skill] call life_fnc_getSkillPoints;
private _group = [_skill] call life_fnc_getSkillGroup;
private _level = 0;

switch (_group) do {

case "character" : {
for "_int" from 0 to 99 step 1 do {
_spezialInt = if(_int isEqualTo 0) then {1} else {_int};
_hasLevel = _points >= (5 * _spezialInt * (_int + 1));
if(!_hasLevel) exitWith {};
_level = _int + 1;
};
};

case "farm" : {
for "_int" from 0 to 50 step 1 do {
_multiplier = switch (true) do {
	case (_int isEqualTo 0) : {20};
    case (1 <= _int && _int < 5) : {20};
    case (5 <= _int && _int < 10) : {25};
    case (10 <= _int && _int < 20) : {30};
    case (20 <= _int && _int < 30) : {35};
    case (30 <= _int && _int < 40) : {40};
    case (40 <= _int && _int < 50) : {45};
    default {50};
};
_spezialInt = if(_int isEqualTo 0) then {1} else {_int};
_hasLevel = _points >= (_multiplier * _spezialInt * (_int + 1));
if(!_hasLevel) exitWith {};
_level = _int + 1;
};
};

case "process" : {
for "_int" from 0 to 99 step 1 do {
_spezialInt = if(_int isEqualTo 0) then {1} else {_int};
_hasLevel = _points >= (15 * _spezialInt * (_int + 1));
if(!_hasLevel) exitWith {};
_level = _int + 1;
};
};

case "crafting" : {
for "_int" from 0 to 99 step 1 do {
_spezialInt = if(_int isEqualTo 0) then {1} else {_int};
_hasLevel = _points >= (5 * _spezialInt * (_int + 1));
if(!_hasLevel) exitWith {};
_level = _int + 1;
};
};
};

_level;