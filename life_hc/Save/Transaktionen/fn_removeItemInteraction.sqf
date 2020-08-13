private _unit = param [0, objNull, [objNull]];
private _removePlayer = param [1, objNull, [objNull]];
private _action = param [2, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_removeItemInteraction"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _gear = [getPlayerUID _removePlayer] call HC_fnc_getGear;
private _geheimZahl = [getPlayerUID _removePlayer] call HC_fnc_getGeheimzahl;

if(_action isEqualTo 0) then {
[_geheimZahl, _action] remoteExec ["life_fnc_copRemove", _removePlayer];
private _items = _gear param [5, []];
private _radioIndex = _items find "ItemRadio";
private _gpsIndex = _items find "ItemGPS";
private _mapIndex = _items find "ItemMap";

if(_radioIndex != -1) then {_items deleteAt _radioIndex;};
if(_gpsIndex != -1) then {_items deleteAt _gpsIndex;};
if(_mapIndex != -1) then {_items deleteAt _mapIndex;};

[getPlayerUID _removePlayer, _gear] call HC_fnc_handleInv;
private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) seine Kommunikationsmittel weggenommen", name _unit, getPlayerUID _unit, side _unit, name _removePlayer, getPlayerUID _removePlayer, side _removePlayer];
["CopLog", _msg] call HC_fnc_Log;
};

if(_action isEqualTo 1) then {
[_geheimZahl, _action] remoteExec ["life_fnc_copRemove", _removePlayer];
_gear set [6, ""];
_gear set [7, ""];
_gear set [14, ["", "", "", "", ""]];
_gear set [15, ["", "", "", "", ""]];
[getPlayerUID _removePlayer, _gear] call HC_fnc_handleInv;
private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) seine Waffen weggenommen", name _unit, getPlayerUID _unit, side _unit, name _removePlayer, getPlayerUID _removePlayer, side _removePlayer];
["CopLog", _msg] call HC_fnc_Log;
};

if(_action isEqualTo 2) then {
removeVest _removePlayer;
_gear set [0, ""];
_gear set [12, []];
_gear set [13, []];
[getPlayerUID _removePlayer, _gear] call HC_fnc_handleInv;
private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) seine Weste weggenommen", name _unit, getPlayerUID _unit, side _unit, name _removePlayer, getPlayerUID _removePlayer, side _removePlayer];
["CopLog", _msg] call HC_fnc_Log;
};

if(_action isEqualTo 3) then {
removeUniform _removePlayer;
_gear set [1, ""];
_gear set [8, []];
_gear set [9, []];
[getPlayerUID _removePlayer, _gear] call HC_fnc_handleInv;
private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) seine Uniform weggenommen", name _unit, getPlayerUID _unit, side _unit, name _removePlayer, getPlayerUID _removePlayer, side _removePlayer];
["CopLog", _msg] call HC_fnc_Log;
};

if(_action isEqualTo 4) then {
[_geheimZahl, _action] remoteExec ["life_fnc_copRemove", _removePlayer];
[getPlayerUID _removePlayer, "gun", false] call HC_fnc_handleLicenses;
private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) seinen Waffenschein weggenommen", name _unit, getPlayerUID _unit, side _unit, name _removePlayer, getPlayerUID _removePlayer, side _removePlayer];
["CopLog", _msg] call HC_fnc_Log;
};

if(_action isEqualTo 5) then {
[_geheimZahl, _action] remoteExec ["life_fnc_copRemove", _removePlayer];
[getPlayerUID _removePlayer, "driver", false] call HC_fnc_handleLicenses;
private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) seine Führerschein weggenommen", name _unit, getPlayerUID _unit, side _unit, name _removePlayer, getPlayerUID _removePlayer, side _removePlayer];
["CopLog", _msg] call HC_fnc_Log;
};

_removePlayer setVariable ["uniformContainer", (uniformContainer _removePlayer)];
_removePlayer setVariable ["vestContainer", (vestContainer _removePlayer)];
_removePlayer setVariable ["backpackContainer", (backpackContainer _removePlayer)];