disableSerialization;
private _display = findDisplay 3900;
private _editField = _display displayCtrl 3906;
private _btnSend = _display displayCtrl 3910;
private _btnCancel = _display displayCtrl 3911;
private _text = ctrlText 3906;
private _index = lbCurSel 3901;

if(_index isEqualTo -1) exitWith {["Du musst einen Spieler angeben!", "Fahndungsliste"] spawn life_fnc_message;};
if(count _text < 5) exitWith {["Die Nachricht ist zu kurz. Eine Nachricht muss mindestens 5 Zeichen lang sein!", "Fahndungsliste"] spawn life_fnc_message;};

private _criminalID = lbData [3901, _index];
private _criminalIndex = CURRENT_CRIMES findIf {_x select 1 == _criminalID};
if(_criminalIndex isEqualTo -1) exitWith {};
private _messages = CURRENT_CRIMES select _criminalIndex select 7;

if(ctrlText _btnSend == "Fertig") then {
private _messageIndex = _messages findIf {(_x select 4) isEqualTo CURRENT_CRIME_MESSAGE_ID};
if(_messageIndex isEqualTo -1) exitWith {};
(_messages select _messageIndex) set [3, _text];
[player, _text, _criminalID, CURRENT_CRIME_MESSAGE_ID] remoteExec ["HC_fnc_fahndungNoteEdit", HC_LIFE];
_btnSend ctrlSetText "Notiz senden";
_btnCancel ctrlShow false;
}else {
private _random = round (random (99999));
_messages pushBack [getPlayerUID player, profileName, "#1E8FBA", _text, _random];
[player, _text, _criminalID, _random] remoteExec ["HC_fnc_fahndungNoteAdd", HC_LIFE];
};

_editField ctrlSetText "";
[] call life_fnc_fahndungPlayerChange;