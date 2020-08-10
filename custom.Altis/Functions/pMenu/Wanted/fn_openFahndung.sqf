disableSerialization;
if(isNull findDisplay 3900) then {createDialog "Wanted";};

private _display = findDisplay 3900;
private _playerList = _display displayCtrl 3901;
private _crimeList = _display displayCtrl 3902;
private _msgField = _display displayCtrl 3906;
private _btnSend = _display displayCtrl 3910;
private _btnCancel = _display displayCtrl 3911;
lbClear _playerList;

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

_btnSend ctrlSetText "Notiz senden";
_btnCancel ctrlShow false;
CURRENT_CRIME_MESSAGE_ID = 0;

_btnSend buttonSetAction "[] spawn life_fnc_fahndungNoteAdd";
_btnCancel buttonSetAction "[] spawn life_fnc_fahndungNoteCancel";

_playerList ctrlSetEventHandler ["LBSelChanged", "[] call life_fnc_fahndungPlayerChange"];
_crimeList ctrlSetEventHandler ["LBSelChanged", "[] call life_fnc_fahndungCrimeChange"];

_msgField ctrlEnable true;