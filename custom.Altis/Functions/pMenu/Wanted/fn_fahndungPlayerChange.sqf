disableSerialization;
private _display = findDisplay 3900;
private _crimeList = _display displayCtrl 3902;
private _ctrlGroup = _display displayCtrl 3908;
private _btnSend = _display displayCtrl 3910;
private _btnCancel = _display displayCtrl 3911;
private _criminalID = lbData [3901, lbCurSel 3901];
lbClear _crimeList;

_btnSend ctrlSetText "Notiz senden";
_btnCancel ctrlShow false;

private _criminalIndex = CURRENT_CRIMES findIf {_x select 1 == _criminalID};
if(_criminalIndex isEqualTo -1) exitWith {};

private _config = CURRENT_CRIMES select _criminalIndex;
private _copName = _config select 3;
private _crimes = _config select 6;
private _notes = _config select 7;

{
private _crime = _x select 0;
private _amount = _x select 1;
private _crimeName = getText (missionConfigFile >> "CfgWanted" >> _crime >> "name");

_crimeList lbAdd format ["%1x %2", _amount, _crimeName];
_crimeList lbSetData [(lbSize _crimeList)-1, _crime];
}forEach _crimes;

_crimeList lbSetCurSel 0;
LAST_HEIGHT = 0;

{
private _group = ctrlParentControlsGroup _x;
if(!(isNull _group)) then {ctrlDelete _x;};
}forEach allControls _display;

{
private _pID = _x select 0;
private _pName = _x select 1;
private _pColor = _x select 2;
private _pMessage = _x select 3;
private _messageID = _x select 4;
private _yValue = 0.02 + LAST_HEIGHT;
private _control = _display ctrlCreate ["Chatbox_Text", -1, _ctrlGroup];

if(call life_coplevel >= 7 || _pID == getPlayerUID player) then {
private _deletePicture = _display ctrlCreate ["RscPicture", -1, _ctrlGroup];
private _deleteBtn = _display ctrlCreate ["Transparent_Button", -1, _ctrlGroup];
_deleteBtn ctrlSetPosition [0.535, _yValue, 0.04, 0.04];
_deleteBtn ctrlSetText "";
_deleteBtn ctrlCommit 0;
_deleteBtn buttonSetAction format ["[%1] call life_fnc_fahndungNoteRemove;", _messageID];
_deletePicture ctrlSetPosition [0.535, _yValue, 0.04, 0.04];
_deletePicture ctrlSetText "Images\Dialog\remove.paa";
_deletePicture ctrlCommit 0;
};

if(call life_coplevel >= 7 || _pID == getPlayerUID player) then {
private _editPicture = _display ctrlCreate ["RscPicture", -1, _ctrlGroup];
private _editBtn = _display ctrlCreate ["Transparent_Button", -1, _ctrlGroup];
_editBtn ctrlSetPosition [0.58, _yValue, 0.04, 0.04];
_editBtn ctrlSetText "";
_editBtn ctrlCommit 0;
_editBtn buttonSetAction format ["[%1] call life_fnc_fahndungNoteEdit;", _messageID];
_editPicture ctrlSetPosition [0.58, _yValue, 0.04, 0.04];
_editPicture ctrlSetText "Images\Dialog\note.paa";
_editPicture ctrlCommit 0;
};

_control ctrlSetStructuredText parseText format ["<t color = '%1'>%2: </t>%3", _pColor, _pName, _pMessage];
private _height = 0.04 + (floor(ctrlTextHeight _control / 0.28) * 0.04);

_control ctrlSetPosition [0, _yValue, 0.53, _height];
_control ctrlCommit 0;
LAST_HEIGHT = _yValue + _height;
}forEach _notes;