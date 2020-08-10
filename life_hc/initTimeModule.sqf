#include "\life_hc\hc_macros.hpp"
while {true} do {
private _key = call compile (EXTDB "9:LOCAL_TIME");
private _result = _key select 1;
private _minuten = _result select 4;
if(_minuten > 58) then {[0, true] call HC_fnc_saveToDatabase;};
sleep 60;
};