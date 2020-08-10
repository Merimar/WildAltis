disableSerialization;
if(isNull findDisplay 120000) then {createDialog "life_eventsetup_menu";};
private _display = findDisplay 120000;
private _checkBox = _display displayCtrl 120005;
private _markerBox = bank_obj getVariable ["event_marker", false];

_checkBox cbSetChecked _markerBox;