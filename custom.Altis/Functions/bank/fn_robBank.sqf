private _object = _this select 0;
private _minCops = _this select 1;

if(!(playerSide in [civilian, east])) exitWith {["Nur als Zivilist oder Rebell möglich", "Kleine Bank"] spawn life_fnc_message;};
if(BANK_SMALL_TIMER) exitWith {["Du kannst nur alle 30 Sekunden versuchen die Bank auszurauben", true, "slow"] call life_fnc_showNotification;};

[] spawn {
BANK_SMALL_TIMER = true;
sleep 30;
BANK_SMALL_TIMER = false;
};

[_object, _minCops, player] remoteExec ["HC_fnc_smallbank", HC_LIFE];