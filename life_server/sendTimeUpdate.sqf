#include "script_macros.hpp"
/*
    File: fn_sendTimeUpdate.sqf
    Author: Merimar

    Description:
    Syncs time with mission file.
*/
for "_i" from 0 to 1 step 0 do {
_key = call compile (EXTDB "9:LOCAL_TIME");
_result = _key select 1;
bank_obj setVariable ["time", _result, true];
sleep 60;
};
