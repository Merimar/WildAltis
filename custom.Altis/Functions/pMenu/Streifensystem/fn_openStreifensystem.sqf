disableSerialization;
if(isNull findDisplay 1300) then {createDialog "Streifensystem";};
private _display = findDisplay 1300;
private _playerList = _display displayCtrl 1301;
private _comboList = _display displayCtrl 1302;

lbClear _playerList;
lbClear _comboList;

_positions = ["Nicht Eingeloggt", "Marktplatz", "Leistelle", "KAV 1", "KAV 2", "KAV 3", "ATH 1", "ATH 2", "ATH 3", "PYR 1", "PYR 2", "PYR 3", "HWP 1", "HWP 2", "ATFA 1", "ATFA 2", "ZIV 1", "ZIV 2", "IK 1"];
{_comboList lbAdd _x;}forEach _positions;

_playerList lbSetCurSel 0;