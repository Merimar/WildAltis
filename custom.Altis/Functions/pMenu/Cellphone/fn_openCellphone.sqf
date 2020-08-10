disableSerialization;
if(isNull findDisplay 1000) then {createDialog "Cellphone";};
private _display = findDisplay 1000;
private _listUnits = _display displayCtrl 1001;
private _listMessages = _display displayCtrl 1002;
private _comboSelection = _display displayCtrl 1005;
private _currentMessage = _display displayCtrl 1006;

lbClear _listUnits;
lbClear _listMessages;
lbClear _comboSelection;
_currentMessage ctrlSetStructuredText parseText localize "STR_ChooseMessage";

{
private _sender = _x select 0;
private _message = _x select 1;
private _time = _x select 2;
private _timeCompile = [time - _time, "MM:SS.MS"] call BIS_fnc_secondsToString;
_listMessages lbAdd format ["%1 (vor %2): %3", _sender, _timeCompile, _message];
_listMessages lbSetData [(lbSize _listMessages)-1, _message];
}forEach LIFE_MESSAGE_SAVE;

{
_listUnits lbAdd (name _x);
_listUnits lbSetData [(lbSize _listUnits)-1, str _x];
}forEach (playableUnits - [player]);

{
if(_x select 1) then {
_comboSelection lbAdd (localize (_x select 0));
_comboSelection lbSetValue [(lbSize _comboSelection)-1, _forEachIndex];
};
}forEach [["STR_CELL_SelPlayer", true], ["STR_CELL_TextPolice", true], ["STR_CELL_EMSRequest", true], ["STR_CELL_TextGang", true], ["STR_CELL_TextAdmins", true], ["STR_CELL_PoliceMSGAll", call life_coplevel > 3 || call life_adminlevel > 0], ["STR_CELL_EMSAll", call life_mediclevel > 3 || call life_adminlevel > 0], ["STR_CELL_GE", playerSide in [civilian, east]], ["STR_CELL_AdminMSGAll", call life_adminlevel > 0], ["STR_CELL_AdminMSGPlayer", call life_adminlevel > 0]];

_listUnits lbSetCurSel -1;
_listMessages lbSetCurSel -1;
_comboSelection lbSetCurSel 0;