#include "..\..\script_macros.hpp"
private _option = _this select 0;
private _state = _this select 1;
private _settings = profileNamespace getVariable ["WildAltis_Settings", []];
private _index = -1;
private _value = false;

switch (_option) do {
    case "name": {
        if (_state isEqualTo 1) then {
            HEXAGON_NAME = true;
			_value = true;
        } else {
            HEXAGON_NAME = false;
			_value = false;
        };
		_index = 7;
    };
	
	case "grass": {
        if (_state isEqualTo 1) then {
            SETTINGS_GRAS = true;
			setTerrainGrid 50;
			_value = true;
        } else {
            SETTINGS_GRAS = false;
			setTerrainGrid 3.125;
			_value = false;
        };
		_index = 8;
    };
};

_settings set [_index, _value];
profileNamespace setVariable ["WildAltis_Settings", _settings];
saveProfileNamespace;