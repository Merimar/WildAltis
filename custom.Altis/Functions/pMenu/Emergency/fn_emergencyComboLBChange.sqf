disableSerialization;
private _display = findDisplay 1100;
private _combo = _display displayCtrl 1102;
private _messageCtrl = _display displayCtrl 1106;
private _curSel = lbCurSel _combo;

if(_curSel isEqualTo -1) exitWith {};
_messageCtrl ctrlSetText (_combo lbText _curSel);