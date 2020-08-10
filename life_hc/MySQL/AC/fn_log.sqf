private _sel = _this select 0;
private _message = _this select 1;

private _query = format ["INSERT INTO server_logs (logtype, message) VALUES ('%1', '%2')", _sel, _message];
[_query, 1] call HC_fnc_asyncCall;

/*
private _key = call compile ("extDB3" callExtension "9:LOCAL_TIME");
private _time = _key select 1;
private _jahr = (_time select 0);
private _monat = (_time select 1);
private _tag = (_time select 2);
private _sekunden = (_time select 5);
private _minuten = (_time select 4);
private _stunden = (_time select 3);

if(_jahr < 10) then {_jahr = format["0%1", _jahr];};
if(_monat < 10) then {_monat = format["0%1", _monat];};
if(_tag < 10) then {_tag = format["0%1", _tag];};
if(_minuten < 10) then {_minuten = format["0%1", _minuten];};
if(_sekunden < 10) then {_sekunden = format["0%1", _sekunden];};
if(_stunden < 10) then {_stunden = format["0%1", _stunden];};

private _message = format ["[%1] - %2.%3.%4 - %5:%6:%7 - %8", _sel, _tag, _monat, _jahr, _stunden, _minuten, _sekunden, _message];
"A3Log" callExtension _message;
*/