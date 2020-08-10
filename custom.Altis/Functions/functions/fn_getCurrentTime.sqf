_time = bank_obj getVariable ["time", []];
_jahr = (_time select 0);
_monat = (_time select 1);
_tag = (_time select 2);
_minuten = (_time select 4);
_stunden = (_time select 3);
if(_jahr < 10) then {
_jahr = format["0%1", _jahr];
};
if(_monat < 10) then {
_monat = format["0%1", _monat];
};
if(_tag < 10) then {
_tag = format["0%1", _tag];
};
if(_minuten < 10) then {
_minuten = format["0%1", _minuten];
};
if(_stunden < 10) then {
_stunden = format["0%1", _stunden];
};
_zeit = format["%1:%2", _stunden, _minuten];
_datum = format["%1.%2.%3", _tag, _monat, _jahr];

_return = format ["%1 %2", _datum, _zeit];
_return;