disableSerialization;
if(isNull findDisplay 1050) then {createDialog "Affiliate";};
private _display = findDisplay 1050;
private _listPlayers = _display displayCtrl 1051;
private _editCode = _display displayCtrl 1052;
private _btnGenerate = _display displayCtrl 1053;
lbClear _listPlayers;

_btnGenerate ctrlEnable (life_code == "");
_editCode ctrlSetText (if(life_code == "") then {"Du hast noch keinen Code erstellt"} else {life_code});

{
private _xName = _x select 0;
private _xUID = _x select 1;
_listPlayers lbAdd _xName;
}forEach life_code_players;