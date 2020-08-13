private _checkStrings = param [0, [], [[]]];
private _unit = param [1, objNull, [objNull]];
private _remoteExecutedOwner = param [2, -1, [0]];
private _file = param [3, "Unknown file", [""]];
private _checkAdminLevel = param [4, false, [false]];

if(_remoteExecutedOwner isEqualTo -1) exitWith {true;};

private _found = false;
{if("'" in (str _x) || "{" in (str _x) || "}" in (str _x) || "toString" in (str _x) || "tostring" in (str _x) || "];" in (str _x)) exitWith {_found = true;};}forEach _checkStrings;

private _remInfo = [_remoteExecutedOwner] call HC_fnc_getPlayerByID;
private _remSuccess = _remInfo select 1;
private _rem = _remInfo select 0;
if(!_remSuccess) exitWith {true;};

private _rName = name _rem;
private _rID = getPlayerUID _rem;
private _rSide = side _rem;
private _uName = if(isNull _unit) then {"Null Object"} else {name _unit};
private _uID = if(isNull _unit) then {"Null Object"} else {getPlayerUID _unit};
private _uSide = if(isNull _unit) then {"Null Object"} else {side _unit};

if(_found) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) hat folgende Datei ausgeführt: %4 hat aber einen SQL Outbreak versucht", _rName, _rID, _rSide, _file, _uName, _uID, _uSide];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", _rName];
[_rem, format ["%1 Hack", _file], [_reason1, _reason2], true] call HC_fnc_reportHacker;
[format ["Bei dem Spieler %1 wurde ein %2 Hack festgestellt", _rName, _file], false] call HC_fnc_adminMessage;
true;
};

if(_rem != _unit) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) hat folgende Datei ausgeführt: %4 hat sich aber als %5 (%6 - %7) ausgegeben", _rName, _rID, _rSide, _file, _uName, _uID, _uSide];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", _rName];
[_rem, format ["%1 Hack", _file], [_reason1, _reason2], true] call HC_fnc_reportHacker;
[format ["Bei dem Spieler %1 wurde ein %2 Hack festgestellt", _rName, _file], false] call HC_fnc_adminMessage;
true;
};

private _adminLevel = [_uID, "admin"] call HC_fnc_getSpecialLevel;

if(_adminLevel < 1 && _checkAdminLevel) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) hat folgende Datei ausgeführt: %4 hat aber kein Admin Level", _rName, _rID, _rSide, _file, _uName, _uID, _uSide];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", _rName];
[_rem, format ["%1 Hack", _file], [_reason1, _reason2], true] call HC_fnc_reportHacker;
[format ["Bei dem Spieler %1 wurde ein %2 Hack festgestellt", _rName, _file], false] call HC_fnc_adminMessage;
true;
};

_found;