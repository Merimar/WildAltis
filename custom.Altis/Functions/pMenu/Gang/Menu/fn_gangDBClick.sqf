disableSerialization;
private _display = findDisplay 4200;
private _list = _display displayCtrl 4201;
private _group = group player;
private _groupBank = _group getVariable ["gang_bank", 0];
private _index = lbCurSel _list;

if(GANG_CUR_ACTION != "INVITE") exitWith {};
if(_index isEqualTo -1) exitWith {};
_action = ["Möchtest du diesen Spieler wirklich einladen", "Spieler einladen", "Ja", "Nein"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

private _unit = call compile format ["%1", _list lbData _index];
if(isNull _unit) exitWith {["", "Der Spieler ist offline"] spawn life_fnc_message;};
if(_groupBank < 10000) exitWith {["", "Es kostet €10.000 einen Spieler einzuladen"] spawn life_fnc_message;};

[format ["Du hast den Spieler %1 in deine Gang eingeladen. €10.000 wurden vom Gangkonto entfernt!", name _unit], "Gang Einladung"] spawn life_fnc_message;
[player, _unit, _group] remoteExec ["HC_fnc_gangInvite", HC_LIFE];