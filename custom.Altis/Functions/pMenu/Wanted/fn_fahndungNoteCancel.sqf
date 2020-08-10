disableSerialization;
private _display = findDisplay 3900;
private _editField = _display displayCtrl 3906;
private _btnSend = _display displayCtrl 3910;
private _btnCancel = _display displayCtrl 3911;

_btnSend ctrlSetText "Notiz senden";
_editField ctrlSetText "";
_btnCancel ctrlShow false;