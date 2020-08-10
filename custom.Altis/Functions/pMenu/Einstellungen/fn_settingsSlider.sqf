#include "..\..\script_macros.hpp"
disableSerialization;
private _mode = param [0, -1];
private _value = round (param [1, -1]);

if (_mode isEqualTo -1 || _value isEqualTo -1) exitWith {};
private _display = findDisplay 4000;
private _textColor = _display displayCtrl 4004;
private _settings = profileNamespace getVariable ["WildAltis_Settings", []];
private _index = -1;

switch (_mode) do {
    case 0: {
        DISTANCE_FOOT = _value;
        ctrlSetText[4018, str(_value)];
        [] call life_fnc_updateViewDistance;
		_index = 2;
    };

    case 1: {
        DISTANCE_CAR = _value;
        ctrlSetText[4017, str(_value)];
        [] call life_fnc_updateViewDistance;
		_index = 0;
    };

    case 2: {
        DISTANCE_AIR = _value;
        ctrlSetText[4016, str(_value)];
        [] call life_fnc_updateViewDistance;
		_index = 1;
    };
	
	case 3: {
        HEXAGON_R = _value;
        ctrlSetText[4019, str(_value)];
		_index = 3;
    };
	
	case 4: {
        HEXAGON_G = _value;
        ctrlSetText[4020, str(_value)];
		_index = 4;
    };
	
	case 5: {
        HEXAGON_B = _value;
        ctrlSetText[4021, str(_value)];
		_index = 5;
    };
};

_textColor ctrlSetBackgroundColor [HEXAGON_R / 100, HEXAGON_G / 100, HEXAGON_B / 100, 1];
_settings set [_index, _value];
profileNamespace setVariable ["WildAltis_Settings", _settings];
saveProfileNamespace;