disableSerialization;
private _display = findDisplay 4200;
private _list = _display displayCtrl 4201;
private _group = group player;
private _index = lbCurSel 4201;

if(GANG_CUR_ACTION == "INVITE") exitWith {};
if(_index isEqualTo -1) exitWith {["", "Du musst jemanden auswählen"] spawn life_fnc_message;};

_action = ["Möchtest du diesen Spieler wirklich kicken", "Spieler kicken", "Ja", "Nein"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

if(GANG_CUR_ACTION == "OFFLINE") exitWith {
private _pArray = call compile format["%1", _list lbData _index];
private _pName = _pArray select 0;
private _pID = _pArray select 1;
private _pSideID = _pArray select 2;

private _playerRang = [player, _group] call life_fnc_getGangRank;
private _unitRank = [objNull, _group, _pID, _pSideID] call life_fnc_getGangRank;

if(_unitRank >= _playerRang) exitWith {["", "Keine Rechte!"] spawn life_fnc_message;};

["Du hast den Spieler aus deiner Gang geworfen", "Gang Kick"] spawn life_fnc_message;
[player, _pArray, _group] remoteExec ["HC_fnc_gangOfflineKick", HC_LIFE];
closeDialog 0;
GANG_CUR_ACTION = "";
};

private _unit = call compile format ["%1", _list lbData _index];
if(isNull _unit) exitWith {["", "Der Spieler ist offline"] spawn life_fnc_message;};

private _playerRang = [player, _group] call life_fnc_getGangRank;
private _unitRank = [_unit, _group] call life_fnc_getGangRank;

if(_unitRank >= _playerRang) exitWith {["", "Keine Rechte!"] spawn life_fnc_message;};

[format ["Du hast den Spieler %1 aus deiner Gang geworfen!", name _unit], "Gang Kick"] spawn life_fnc_message;
[player, _unit, _group] remoteExec ["HC_fnc_gangKick", HC_LIFE];
closeDialog 0;