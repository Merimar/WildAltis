disableSerialization;
private _criminal = param [0, objNull];

if(isNull _criminal || !(isNull findDisplay 2000)) exitWith {};

createDialog "Jail";
private _display = findDisplay 2000;
private _editPlayer = _display displayCtrl 2001;

_editPlayer ctrlSetText (name _criminal);