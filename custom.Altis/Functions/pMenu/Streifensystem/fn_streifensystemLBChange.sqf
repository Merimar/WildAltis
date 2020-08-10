disableSerialization;
private _display = findDisplay 1300;
private _playerList = _display displayCtrl 1301;
private _comboList = _display displayCtrl 1302;
if((lbCurSel _comboList) isEqualTo -1) exitWith {};
private _squad = _comboList lbText (lbCurSel _comboList);
lbClear _playerList;

private _allUnits = playableUnits select {(_x getVariable ["squad", "Nicht Eingeloggt"]) == _squad && (side _x) == west};

{
_playerList lbAdd (name _x);
}forEach _allUnits;