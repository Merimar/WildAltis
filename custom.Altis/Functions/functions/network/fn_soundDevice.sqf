if(isNull _this) exitWith {};
if(player distance _this > 2500) exitWith {};

for "_i" from 0 to 1 step 0 do {
    if(isNull _this || !alive _this) exitWith {};
    if(!(_this getVariable ["mining", false])) exitWith {};
    _this say3D "Device_disassembled_loop";
    sleep 28.6;
};