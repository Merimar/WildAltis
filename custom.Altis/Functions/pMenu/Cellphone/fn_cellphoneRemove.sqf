disableSerialization;
private _display = findDisplay 1000;
private _listMessages = _display displayCtrl 1002;
private _currentMessage = _display displayCtrl 1006;
private _index = lbCurSel _listMessages;

if(_index isEqualTo -1) exitWith {};
private _message = _listMessages lbData _index;

private _messageIndex = LIFE_MESSAGE_SAVE findIf {_x select 1 == _message};
if(_messageIndex isEqualTo -1) exitWith {};

LIFE_MESSAGE_SAVE deleteAt _messageIndex;
[] call life_fnc_openCellphone;