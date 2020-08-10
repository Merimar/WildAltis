disableSerialization;
if(isNull findDisplay 4100) then {createDialog "Skills";};

private _display = findDisplay 4100;
private _groupList = _display displayCtrl 4101;
lbClear _groupList;

{_groupList lbAdd _x;}forEach ["Charakter Skills", "Farming Skills", "Verarbeitungs Skills"];
_groupList lbSetCurSel 0;