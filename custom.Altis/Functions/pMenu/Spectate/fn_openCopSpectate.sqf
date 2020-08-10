disableSerialization;
if(isNull findDisplay 1350) then {createDialog "CopSpectate";};
private _display = findDisplay 1350;
private _playerList = _display displayCtrl 1351;

if(call life_coplevel < 8) exitWith {["Du kannst Polizisten erst beobachten wenn du Coplevel 7 bist", "Keine Rechte"] spawn life_fnc_message;};
private _players = playableUnits select {side _x isEqualTo west && _x != player};

{
_playerList lbAdd (name _x);
_playerList lbSetData [(lbSize _playerList)-1, str _x];
}forEach _players;