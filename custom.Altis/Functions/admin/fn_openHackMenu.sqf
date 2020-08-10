#include "..\script_macros.hpp"
/*
    File: fn_openModTool.sqf
    Author: Merimar

    Description:
    Open up the Mod Tool.
*/

_adminLvl = FETCH_CONST(life_adminlevel);

if(_adminLvl < 1) exitWith {};

if(isNull findDisplay 108000) then {
createDialog "life_display_check";
};

disableSerialization;
_display = findDisplay 108000;
_hackList = _display displayCtrl 108001;
lbClear _hackList;
_list = bank_obj getVariable ["hack_list", []];

{
_name =  _x select 0;
_display = _x select 1;
_onLoad = _x select 2;
_onUnload = _x select 3;
_serverOnLoad = _x select 4;
_serverOnUnload = _x select 5;

_show = format ["%1 - %2", _name, _display];
_data = format ["%1:%2:%3:%4:%5:%6", _name, _display, _onLoad, _onUnload, _serverOnLoad, _serverOnUnload];

_hackList lbAdd _show;
_hackList lbSetdata [(lbSize _hackList)-1, _data];
}foreach _list;