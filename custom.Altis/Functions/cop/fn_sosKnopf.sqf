if(SOS) exitWith {};

[] spawn {
SOS = true;
sleep (15 * 60);
SOS = false;
};

[false, "sos", 1] call life_fnc_handleInv;

[player] remoteExec ["life_fnc_sos", west];