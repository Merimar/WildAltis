disableSerialization;
if(!(isNull findDisplay 160000)) exitWith {};
createDialog "life_eventcountdown_menu";
private _display = findDisplay 160000;
private _checkBox = _display displayCtrl 160002;
private _countdown = bank_obj getVariable ["event_countdown", false];

_checkBox cbSetChecked _countdown;