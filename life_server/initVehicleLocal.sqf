for "_int" from 0 to 1 step 0 do {

{
if(_x isKindOf "Car" || _x isKindOf "Air" || _x isKindOf "Ship" || _x isKindOf "Tank") then {
if(count (_x getVariable ["vehicle_info_owners", []]) > 0) then {
if(local _x) then {_x setOwner HC_LIFE};
};
};
}forEach vehicles;
sleep 60;
};