#include "..\script_macros.hpp"
_msg = _this select 0;
_position = _this select 1;
_duration = _this select 2;
_fadeTime = _this select 3;

if(clientOwner isEqualTo HC_LIFE) exitWith {};

[parseText _msg, _position, nil, _duration, _fadeTime, 0] spawn BIS_fnc_textTiles;