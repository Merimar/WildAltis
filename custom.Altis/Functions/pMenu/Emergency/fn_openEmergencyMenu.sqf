disableSerialization;
if(isNull findDisplay 1100) then {createDialog "Notrufsystem";};
private _display = findDisplay 1100;
private _list = _display displayCtrl 1101;
private _combo = _display displayCtrl 1102;
lbClear _list;
lbClear _combo;

private _informationArray = bank_obj getVariable ["Emergency_Calls", []];
private _comboArray = ["Wir schicken eine Einheit bei Ihnen vorbei","Wir haben gerade keine freie Einheit, haben sie einen Moment geduld", "Wir verhandeln nicht mit Terroristen", "Wo? Was? Wie?"];
{_combo lbAdd _x;}forEach _comboArray;

{
private _playerName = _x select 0;
private _messages = _x select 1;
private _time = _x select 2;
private _position = _x select 3;
private _accepted = _x select 4;
private _finished = _x select 5;
private _faction = _x select 6;
if(_faction isEqualTo playerSide && !_finished) then {
_list lbAdd _playerName;
_list lbSetValue [(lbSize _list)-1, _forEachIndex];
};
}forEach _informationArray;

_list lbSetCurSel 0;