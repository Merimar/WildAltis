params ["_id", "_uid", "_name", "_jip", "_owner"];

if(_uid == "" || _name == "headlessclient") exitWith {};
if("H" in _uid || "C" in _uid || "h" in _uid || "c" in _uid) exitWith {};

private _index = GEHEIM_ZAHL findIf {_x select 0 == _uid};
private _geheimZahl = if(_index isEqualTo -1) then {round (random 999999)} else {(GEHEIM_ZAHL select _index) select 1};

if(_index isEqualTo -1) then {GEHEIM_ZAHL pushBack [_uid, _geheimZahl];};

waitUntil {life_HC_isActive};

[_uid, _owner, _geheimZahl] remoteExec ["HC_fnc_onPlayerConnected", HC_LIFE];