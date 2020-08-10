private _newList = param [0, [], [[]]];
CURRENT_CRIMES = _newList;

["", "Fahndungsliste aktualisiert"] spawn life_fnc_message;

private _display = findDisplay 3900;
if(isNull _display) exitWith {};

private _playerList = _display displayCtrl 3901;
private _crimeList = _display displayCtrl 3902;
private _msgField = _display displayCtrl 3906;
private _btnSend = _display displayCtrl 3910;
private _btnCancel = _display displayCtrl 3911;
lbClear _playerList;

if(ctrlText _btnSend == "Notiz senden") then {
{
private _criminalName = _x param [0, "Unbekannt"];
private _criminalID = _x param [1, ""];
private _crimes = _x param [6, []];
private _onlineIndex = playableUnits findIf {getPlayerUID _x == _criminalID};

if(_onlineIndex != -1 && count _crimes > 0) then {
_playerList lbAdd _criminalName;
_playerList lbSetData [(lbSize _playerList)-1, _criminalID];
};
}forEach CURRENT_CRIMES;
_playerList lbSetCurSel 0;
CURRENT_CRIME_MESSAGE_ID = 0;
_msgField ctrlSetText "";
}else {
private _selectedUnits = playableUnits select {!(_x getVariable ["isDead", false]) && (side _x) in [civilian, east]};

{
_playerList lbAdd (name _x);
_playerList lbSetData [(lbSize _playerList)-1, str (_x)];
}forEach _selectedUnits;
_playerList lbSetCurSel 0;
};