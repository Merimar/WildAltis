#include "..\script_macros.hpp"
/*
    File: fn_showHacks.sqf
    Author: Merimar

    Description:
    Displays Description of selected Hack.
*/

_splitString = lbData[108001,lbCurSel (108001)];

_array = _splitString splitString ":";

_name = _array param [0, ""];
_display = _array param [1, ""];
_onLoad = _array param [2, ""];
_onUnload = _array param [3, ""];
_serverOnLoad = _array param [4, ""];
_serverOnUnload = _array param [5, ""];

_display = findDisplay 108000;
_text = _display displayCtrl 108002;

_msg = format ["Spieler: %1 <br/><br/>Display: %2 <br/>onLoad (CLIENT): %3 <br/>onUnload (CLIENT): %4 <br/>onLoad (SERVER): %5 <br/>onUnload (SERVER): %6", _name, _display, _onLoad, _onUnload, _serverOnLoad, _serverOnUnload];
_text ctrlSetStructuredText parseText _msg;