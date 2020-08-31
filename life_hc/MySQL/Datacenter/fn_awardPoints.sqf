{
private _group = (group _x) getVariable ["gang_name", ""];
if(_x inArea "Datacenter" && alive _x && _group != "") then {
private _index = DATA_POINTS findIf {_x select 0 == _group};

if(_index isEqualTo -1) then {
DATA_POINTS pushBack [_group, 1];
}else {
(DATA_POINTS select _index) set [1, (DATA_POINTS select _index select 1) + 1];
};
};
}forEach playableUnits;

publicVariable "DATA_POINTS";