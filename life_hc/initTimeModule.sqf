#include "\life_hc\hc_macros.hpp"
while {true} do {
private _key = call compile (EXTDB "9:LOCAL_TIME");
private _result = _key select 1;
private _stunden = _result select 3;
private _minuten = _result select 4;
private _sekunden = _result select 5;
if(_minuten >= 59 && _stunden in [0, 12, 16, 20]) exitWith {};
sleep 45;
};



while {true} do {
private _key = call compile (EXTDB "9:LOCAL_TIME");
private _result = _key select 1;
private _sekunden = _result select 5;
if(_sekunden > 50) exitWith {["", true] call HC_fnc_saveToDatabase;};
sleep 1;
};