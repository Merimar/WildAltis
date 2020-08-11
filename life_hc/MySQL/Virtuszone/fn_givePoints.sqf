private _units = playableUnits select {_x inArea "VirtusZone"};

{
private _group = group _x;
private _groupName = _group getVariable ["gang_name", ""];
if(_groupName != "") then {
private _virtusIndex = VIRTUS_KILL_ARRAY findIf {_x select 0 == _groupName};
if(_virtusIndex isEqualTo -1) then {
VIRTUS_KILL_ARRAY pushBack [_groupName, 3];
}else {
private _old = VIRTUS_KILL_ARRAY select _virtusIndex select 1;
(VIRTUS_KILL_ARRAY select _virtusIndex) set [1, _old + 3];
};
};
}forEach _units;