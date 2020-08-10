disableSerialization;
private _list = uiNamespace getVariable ["CUR_TRUNK_LB", ""];

if(_list isEqualType "") exitWith {["Du hast kein Item ausgewählt.", ""] spawn life_fnc_message;};
if((ctrlIDC _list) isEqualTo 3501) then {[false] call life_fnc_vehTakeItem;}else {[false] call life_fnc_vehStoreItem;};