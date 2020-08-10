_message = _this select 0;
_factionNew = _this select 1;
_pos = _this select 2;
_informationArray = bank_obj getVariable ["Emergency_Calls", []];

_time = bank_obj getVariable ["time", []];
_minuten = (_time select 4);
_stunden = (_time select 3);

_lastNotrufIndex = -1;

{
_name = _x select 0;
_finished = _x select 5;
_faction = _x select 6;
if(_faction isEqualTo _factionNew && !_finished) then {
if(_name == profileName) then {
_xZeit = _x select 2;
_xStunden = _xZeit select 0;
_xMinuten = _xZeit select 1;
if(_xStunden isEqualTo _stunden) then {
if((_minuten - _xMinuten) <= 15) exitWith {
_lastNotrufIndex = _forEachIndex;
};
}else {
if((_xStunden + 1) isEqualTo _stunden) then {
_dazu = (60 - _xMinuten);
_plus = _minuten;
_insg = _dazu + _plus;
if(_insg <= 15) exitWith {
_lastNotrufIndex = _forEachIndex;
};
};
};
};
};
}forEach _informationArray;

[player, _lastNotrufIndex, _message, _factionNew, _pos] remoteExec ["HC_fnc_newEmergency", HC_LIFE];