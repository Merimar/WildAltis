private _unit = _this select 0;
private _removePlayer = _this select 1;
private _action = _this select 2;

private _remInfo = [remoteExecutedOwner] call HC_fnc_getPlayerByID;
private _remSuccess = _remInfo select 1;
private _rem = _remInfo select 0;

if(!_remSuccess) exitWith {};
if(_rem != _unit) then {
_reason1 = format ["Der Spieler %1 (%2) wollte dem Spieler %3 (%4) ein Item wegnehmen (%5) hat sich allerdings als %6 (%7) ausgegeben", name _rem, getPlayerUID _rem, name _removePlayer, getPlayerUID _removePlayer, name _unit, getPlayerUID _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _rem];
[_rem, "Item Remove Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Item Remove Hack festgestellt", name _rem], false] call HC_fnc_adminMessage;
};

private _gear = [getPlayerUID _removePlayer, side _removePlayer] call HC_fnc_getGear;
private _geheimZahl = [getPlayerUID _removePlayer, side _removePlayer] call HC_fnc_getGeheimzahl;

if(_action isEqualTo 0) then {
[_geheimZahl, _action] remoteExec ["life_fnc_copRemove", _removePlayer];
_gear = [getPlayerUID _removePlayer, side _removePlayer] call HC_fnc_getGear;
_items = _gear param [5, []];
_radioIndex = _items find "ItemRadio";
_gpsIndex = _items find "ItemGPS";
_mapIndex = _items find "ItemMap";
if(!(_radioIndex isEqualTo -1)) then {
_items deleteAt _radioIndex;
};
if(!(_gpsIndex isEqualTo -1)) then {
_items deleteAt _gpsIndex;
};
if(!(_mapIndex isEqualTo -1)) then {
_items deleteAt _mapIndex;
};

[getPlayerUID _removePlayer, side _removePlayer, _gear] call HC_fnc_handleInv;
_msg = format ["Der Spieler %1 (%2) hat dem Spieler %3 (%4) seine Kommunikationsmittel weggenommen", name _unit, getPlayerUID _unit, name _removePlayer, getPlayerUID _removePlayer];
["CopRemoveLog", _msg] call HC_fnc_Log;
};

if(_action isEqualTo 1) then {
[_geheimZahl, _action] remoteExec ["life_fnc_copRemove", _removePlayer];
_gear set [6, ""];
_gear set [7, ""];
_gear set [14, ["", "", "", "", ""]];
_gear set [15, ["", "", "", "", ""]];
[getPlayerUID _removePlayer, side _removePlayer, _gear] call HC_fnc_handleInv;
_msg = format ["Der Spieler %1 (%2) hat dem Spieler %3 (%4) seine Waffen weggenommen", name _unit, getPlayerUID _unit, name _removePlayer, getPlayerUID _removePlayer];
["CopRemoveLog", _msg] call HC_fnc_Log;
};

if(_action isEqualTo 2) then {
removeVest _removePlayer;
_gear set [0, ""];
_gear set [12, []];
_gear set [13, []];
[getPlayerUID _removePlayer, side _removePlayer, _gear] call HC_fnc_handleInv;
_msg = format ["Der Spieler %1 (%2) hat dem Spieler %3 (%4) seine Weste weggenommen", name _unit, getPlayerUID _unit, name _removePlayer, getPlayerUID _removePlayer];
["CopRemoveLog", _msg] call HC_fnc_Log;
};

if(_action isEqualTo 3) then {
removeUniform _removePlayer;
_gear set [1, ""];
_gear set [8, []];
_gear set [9, []];
[getPlayerUID _removePlayer, side _removePlayer, _gear] call HC_fnc_handleInv;
_msg = format ["Der Spieler %1 (%2) hat dem Spieler %3 (%4) seine Uniform weggenommen", name _unit, getPlayerUID _unit, name _removePlayer, getPlayerUID _removePlayer];
["CopRemoveLog", _msg] call HC_fnc_Log;
};

if(_action isEqualTo 4) then {
[_geheimZahl, _action] remoteExec ["life_fnc_copRemove", _removePlayer];
[getPlayerUID _removePlayer, side _removePlayer, "gun", false] call HC_fnc_handleLicenses;
_msg = format ["Der Spieler %1 (%2) hat dem Spieler %3 (%4) seinen Waffenschein weggenommen", name _unit, getPlayerUID _unit, name _removePlayer, getPlayerUID _removePlayer];
["CopRemoveLog", _msg] call HC_fnc_Log;
};

if(_action isEqualTo 5) then {
[_geheimZahl, _action] remoteExec ["life_fnc_copRemove", _removePlayer];
[getPlayerUID _removePlayer, side _removePlayer, "driver", false] call HC_fnc_handleLicenses;
_msg = format ["Der Spieler %1 (%2) hat dem Spieler %3 (%4) seine Führerschein weggenommen", name _unit, getPlayerUID _unit, name _removePlayer, getPlayerUID _removePlayer];
["CopRemoveLog", _msg] call HC_fnc_Log;
};

_removePlayer setVariable ["uniformContainer", (uniformContainer _removePlayer)];
_removePlayer setVariable ["vestContainer", (vestContainer _removePlayer)];
_removePlayer setVariable ["backpackContainer", (backpackContainer _removePlayer)];