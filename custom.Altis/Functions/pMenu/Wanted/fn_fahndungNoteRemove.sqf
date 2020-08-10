disableSerialization;
private _messageID = param [0, 0];
private _display = findDisplay 3900;
private _index = lbCurSel 3901;
if(_index isEqualTo -1) exitWith {};

private _criminalID = lbData [3901, _index];
private _criminalIndex = CURRENT_CRIMES findIf {_x select 1 == _criminalID};
if(_criminalIndex isEqualTo -1) exitWith {};

private _messages = CURRENT_CRIMES select _criminalIndex select 7;
private _messageIndex = _messages findIf {(_x select 4) isEqualTo _messageID};

if(_messageIndex isEqualTo -1) exitWith {};
_messages deleteAt _messageIndex;

closeDialog 0;
[player, _criminalID, _messageID] remoteExec ["HC_fnc_fahndungNoteRemove", HC_LIFE];