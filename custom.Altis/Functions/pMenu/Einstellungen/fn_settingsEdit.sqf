#include "..\..\script_macros.hpp"
disableSerialization;
private _control = _this select 0;
private _code = _this select 1;
private _slider = _this select 2;

if(isNull _control) exitWith {};
private _display = findDisplay 4000;
private _textColor = _display displayCtrl 4004;
private _value = parseNumber (ctrlText _control);
private _settings = profileNamespace getVariable ["WildAltis_Settings", []];
private _index = -1;

if(_slider in ["ground", "vehicle", "air"] && (_value > 5000 || _value < 1)) exitWith {};
if(_slider in ["rot", "grun", "blau"] && (_value > 100 || _value < 1)) exitWith {};

switch (_slider) do {
	case "ground": {
	DISTANCE_FOOT = _value;
	_index = 2;
	};
	case "vehicle": {
	DISTANCE_CAR = _value;
	_index = 0;
	};
	case "air": {
	DISTANCE_AIR = _value;
	_index = 1;
	};
	case "rot": {
	HEXAGON_R = _value;
	_index = 3;
	};
	case "grun": {
	HEXAGON_G = _value;
	_index = 4;
	};
	case "blau": {
	HEXAGON_B = _value;
	_index = 5;
	};
};

_settings set [_index, _value];
_textColor ctrlSetBackgroundColor [HEXAGON_R / 100, HEXAGON_G / 100, HEXAGON_B / 100, 1];
profileNamespace setVariable ["WildAltis_Settings", _settings];
saveProfileNamespace;
[] call life_fnc_openSettings;
[] call life_fnc_updateViewDistance;