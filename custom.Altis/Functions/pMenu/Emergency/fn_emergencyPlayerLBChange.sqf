disableSerialization;
private _display = findDisplay 1100;
private _list = _display displayCtrl 1101;
private _timeCtrl = _display displayCtrl 1104;
private _acceptCtrl = _display displayCtrl 1105;
private _mapCtrl = _display displayCtrl 1107;
private _messageCtrl = _display displayCtrl 1108;
private _positionCtrl = _display displayCtrl 1109;
private _annehmCtrl = _display displayCtrl 1112;

private _index = lbCurSel _list;
if(_index isEqualTo -1) exitWith {};

private _value = _list lbValue _index;
private _informationArray = bank_obj getVariable ["Emergency_Calls", []];
private _information = _informationArray select _value;
private _messages = _information select 1;
private _timeval = _information select 2;
private _position = _information select 3;
private _accepted = _information select 4;
private _realPos = _information select 7;

//Messages
private _finalString = "";
{
private _message = _x select 0;
private _time = _x select 1;
private _color = if(_x select 2) then {"#1A51E3"} else {"#EC5514"};
private _stunden = _time select 0;
private _minuten = _time select 1;

if(_minuten < 10) then {_minuten = format["0%1", _minuten];};
if(_stunden < 10) then {_stunden = format["0%1", _stunden];};
_finalString = format ["%1<t color='#FFD43F'>%2:%3</t><br/><t color='%4'>%5</t><br/><br/>", _finalString, _stunden, _minuten, _color, _message];
}forEach _messages;
_messageCtrl ctrlSetStructuredText parseText _finalString;

//Zeit
private _stunden = if((_timeval select 0) < 10) then {format["0%1", _timeval select 0]} else {format["%1", _timeval select 0]};
private _minuten = if((_timeval select 1) < 10) then {format["0%1", _timeval select 1]} else {format["%1", _timeval select 1]};
_timeCtrl ctrlSetText format ["%1:%2", _stunden, _minuten];

//Angenommen von
private _unit = if(_accepted == "-1") then {"Niemandem"} else {_accepted};
_acceptCtrl ctrlSetText _unit;

if(_accepted == "-1") then {
_annehmCtrl ctrlSetText "Annehmen";
_annehmCtrl ctrlEnable true;
_annehmCtrl buttonSetAction "[] spawn life_fnc_emergencyAccept;";
}else {
_annehmCtrl ctrlSetText "Abbrechen";
_annehmCtrl ctrlEnable (_accepted == profileName);
_annehmCtrl buttonSetAction "[] spawn life_fnc_emergencyCancel;";
};

//Position
_positionCtrl ctrlSetText format ["Position auf der Map: %1", _position];

if(_position != "Unbekannt") then {
_mapCtrl ctrlMapAnimAdd [1, 0.1, _realPos];
ctrlMapAnimCommit _mapCtrl;
};