private _vehicle = param [0, objNull, [objNull]];

if(_vehicle distance player > 20 || FLIP_TIMER) exitWith {};

[] spawn {
FLIP_TIMER = true;
sleep 10;
FLIP_TIMER = false;
};

[player, _vehicle] remoteExec ["HC_fnc_flipVehicle", HC_LIFE];