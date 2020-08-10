disableSerialization;
if(isNull findDisplay 3900) then {createDialog "Wanted";};
private _display = findDisplay 3900;
private _playerList = _display displayCtrl 3901;
private _crimeList = _display displayCtrl 3902;
private _msgField = _display displayCtrl 3906;
private _btnSend = _display displayCtrl 3910;
private _btnCancel = _display displayCtrl 3911;
lbClear _playerList;

_btnSend ctrlSetText "Hinzufügen";
_btnCancel ctrlSetText "Entfernen";

_btnSend buttonSetAction "[] spawn life_fnc_fahndungCrimeAdd";
_btnCancel buttonSetAction "[] spawn life_fnc_fahndungCrimeRemove";

_playerList ctrlSetEventHandler ["LBSelChanged", "[] call life_fnc_fahndungPlayerAddChange"];
_crimeList ctrlSetEventHandler ["LBSelChanged", "[] call life_fnc_fahndungCrimeAddChange"];

_msgField ctrlEnable false;

private _selectedUnits = playableUnits select {!(_x getVariable ["isDead", false]) && (side _x) in [civilian, east]};

{
_playerList lbAdd (name _x);
_playerList lbSetData [(lbSize _playerList)-1, str _x];
}forEach _selectedUnits;

_playerList lbSetCurSel 0;