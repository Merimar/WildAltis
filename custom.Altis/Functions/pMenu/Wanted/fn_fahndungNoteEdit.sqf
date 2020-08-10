disableSerialization;
private _messageID = param [0, 0];

private _display = findDisplay 3900;
private _index = lbCurSel 3901;
private _editField = _display displayCtrl 3906;
private _btnSend = _display displayCtrl 3910;
private _btnCancel = _display displayCtrl 3911;

if(_index isEqualTo -1) exitWith {};

private _criminalID = lbData [3901, _index];
private _criminalIndex = CURRENT_CRIMES findIf {_x select 1 == _criminalID};
if(_criminalIndex isEqualTo -1) exitWith {};

private _messages = CURRENT_CRIMES select _criminalIndex select 7;
private _messageIndex = _messages findIf {(_x select 4) isEqualTo _messageID};

if(_messageIndex isEqualTo -1) exitWith {};
private _message = _messages select _messageIndex select 3;
_editField ctrlSetText _message;

CURRENT_CRIME_MESSAGE_ID = _messageID;

_btnSend ctrlSetText "Fertig";
_btnCancel ctrlShow true;