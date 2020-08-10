private _object = _this select 0;
private _minCops = _this select 1;

if(!(playerSide in [civilian, east])) exitWith {[["Nicht als Polizist oder Feuerwehrmann möglich"] call life_fnc_getCleanString, true, "slow"] call life_fnc_showNotification;};
if(BANK_SMALL_TIMER) exitWith {["Du kannst nur alle 30 Sekunden versuchen die Bank auszurauben", true, "slow"] call life_fnc_showNotification;};

BANK_SMALL_TIMER = true;

[] spawn {
sleep 30;
BANK_SMALL_TIMER = false;
};

[_object, _minCops, player] remoteExec ["HC_fnc_smallbank", HC_LIFE];