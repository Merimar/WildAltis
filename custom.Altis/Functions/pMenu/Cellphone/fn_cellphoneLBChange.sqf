disableSerialization;
private _display = findDisplay 1000;
private _listMessages = _display displayCtrl 1002;
private _currentMessage = _display displayCtrl 1006;
private _index = lbCurSel _listMessages;

if(_index isEqualTo -1) exitWith {};

private _message = _listMessages lbData _index;
_currentMessage ctrlSetStructuredText parseText _message;