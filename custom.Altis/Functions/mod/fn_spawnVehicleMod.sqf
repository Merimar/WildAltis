disableSerialization;
private _list = player getVariable ["Event_Vehicle", -1];
if(_list isEqualTo -1) exitWith {["", "Du hast kein Fahrzeug ausgewählt"] spawn life_fnc_message;};
private _idc = 140001 + _list;
private _index = lbCurSel _idc;

if(_index isEqualTo -1) exitWith {};
private _className = lbData [_idc, _index];
private _vehicleName = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");

[format ["%1 gespawnt", _vehicleName], "Fahrzeug gespawnt"] spawn life_fnc_message;
[player, _classname] remoteExec ["HC_fnc_spawnVehicleMod", HC_LIFE];