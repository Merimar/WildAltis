private _vehicle = param [0, objNull, [objNull]];

if(isNull _vehicle) exitWith {};
if(player distance _vehicle > 2500) exitWith {};

for "_i" from 0 to 1 step 0 do {
    if(isNull _vehicle || !alive _vehicle) exitWith {};
    if(!(_vehicle getVariable ["mining", false])) exitWith {};
    _vehicle say3D "Device_disassembled_loop";
    sleep 28.6;
};