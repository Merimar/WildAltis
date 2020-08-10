while {true} do {
sleep (5 * 60);
for "_indexX" from 0 to ((count VEHICLE_LIST)-1) step 1 do {
_vehicleX = VEHICLE_LIST param [_indexX, objNull];
if(isNull _vehicleX) then {
VEHICLE_LIST deleteAt _indexX;
}else {
if(!(alive _vehicleX)) then {
[_vehicleX] spawn HC_fnc_vehicleDestroy;
VEHICLE_LIST deleteAt _indexX;
};
};
};
};