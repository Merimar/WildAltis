#include "..\script_macros.hpp"
private _skill = param [0, ""];
private _level = [_skill] call life_fnc_getSkillLevel;
private _group = [_skill] call life_fnc_getSkillGroup;
private _needed = 0;

switch (_group) do {

case "character" : {
_needed = 5 * _level * (_level + 1);
if(_level isEqualTo 0) then {_needed = 5;};
};

case "farm" : {
_needed = switch (true) do {
    case (_level isEqualTo 0) : {20;};
    case (1 <= _level && _level < 5) : {(20 * _level) * (_level + 1);};
    case (5 <= _level && _level < 10) : {(25 * _level) * (_level + 1);};
    case (10 <= _level && _level < 20) : {(30 * _level) * (_level + 1);};
    case (20 <= _level && _level < 30) : {(35 * _level) * (_level + 1);};
    case (30 <= _level && _level < 40) : {(40 * _level) * (_level + 1);};
    case (40 <= _level && _level < 50) : {(45 * _level) * (_level + 1);};
    default {(50 * _level) * (_level + 1);};
};
};

case "process" : {
_needed = 15 * _level * (_level + 1);
if(_level isEqualTo 0) then {_needed = 15;};
};

case "crafting" : {
_needed = 5 * _level * (_level + 1);
if(_level isEqualTo 0) then {_needed = 5;};
};

};

_needed;