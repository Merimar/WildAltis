disableSerialization;
private _display = findDisplay 1350;
private _display = findDisplay 1350;
private _playerList = _display displayCtrl 1351;
private _index = lbCurSel _playerList;

if(call life_coplevel < 8) exitWith {["Du kannst Polizisten erst beobachten wenn du Coplevel 7 bist", "Keine Rechte"] spawn life_fnc_message;};
if(_index isEqualTo -1) exitWith {["Du hast keinen Spieler ausgewählt!", "Keine Auswahl"] spawn life_fnc_message;};

private _unit = call compile (_playerList lbData _index);

if(isNil "_unit" || {isNull _unit}) exitWith {["Der Spieler ist offline gegangen", "Spieler offline"] spawn life_fnc_message;};

_unit switchCamera "INTERNAL";
[player, _unit, true] remoteExec ["HC_fnc_copSpectate", HC_LIFE];
player allowDamage false;

[format["Du beobachtest nun %1. Mit F10 kannst du dieses Menu wieder verlassen", name _unit], "Spectate"] spawn life_fnc_message;

COP_EXIT = (findDisplay 46) displayAddEventHandler ["KeyDown",{
private _key = _this select 1;
if(_key != 68) exitWith {};

player allowDamage true;
[player, objNull, false] remoteExec ["HC_fnc_copSpectate", HC_LIFE];
player switchCamera "INTERNAL";
(findDisplay 46) displayRemoveEventHandler ['KeyDown', COP_EXIT];

false;
}];