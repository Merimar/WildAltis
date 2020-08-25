#include "..\script_macros.hpp"
disableSerialization;

if(isNull LIFEdisplay) then {10 cutRsc ["playerHUD", "PLAIN", 2, false];};

private _time = bank_obj getVariable ["time", [0, 0, 0, 0, 16]];
private _jahr = _time select 0;
private _monat = _time select 1;
private _tag = _time select 2;
private _minuten = _time select 4;
private _stunden = _time select 3;

if(_jahr < 10) then {_jahr = format["0%1", _jahr];};
if(_monat < 10) then {_monat = format["0%1", _monat];};
if(_tag < 10) then {_tag = format["0%1", _tag];};
if(_minuten < 10) then {_minuten = format["0%1", _minuten];};
if(_stunden < 10) then {_stunden = format["0%1", _stunden];};

private _zeit = format["%1:%2", _stunden, _minuten];
private _datum = format["%1.%2.%3", _tag, _monat, _jahr];
private _walk = if(isNil "WALK_CURRENT") then {0} else {WALK_CURRENT};
private _walkSkill = ["stamina"] call life_fnc_getSkillAdvantage;
private _ausdauer = (_walkSkill - _walk) / _walkSkill;

LIFEctrl(44002) ctrlSetText format["%1 | UID: %2 | %3", _zeit, life_uid, profileName];

LIFEctrl(44003) progressSetPosition (life_thirst / 100);
LIFEctrl(44004) progressSetPosition (life_hunger / 100);
LIFEctrl(44005) progressSetPosition (1 - (damage player));
LIFEctrl(44006) progressSetPosition (_ausdauer);

LIFEctrl(44007) ctrlSetText format["%1", life_thirst];
LIFEctrl(44008) ctrlSetText format["%1", life_hunger];
LIFEctrl(44009) ctrlSetText format["%1", round(100 * (1 - (damage player)))];
LIFEctrl(44010) ctrlSetText format["%1", round(100 * _ausdauer)];