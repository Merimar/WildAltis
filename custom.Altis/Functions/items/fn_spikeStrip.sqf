#include "..\script_macros.hpp"
if(player getVariable ["nagelbander", false]) exitWith {["Du kannst nur 1 Nagelband gleichzeitig tragen.", "Nagelband"] spawn life_fnc_message;};

_spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,5.5,0]];
_spikeStrip setDir 90;

private _tag = if(playerSide isEqualTo west) then {"WEST"} else {profileName};
_spikeStrip setVariable["nagelband", _tag, true];
player setVariable ["nagelbander", true, true];

waitUntil {(!(player getVariable ["nagelbander", false]) || life_isDead)};
if(isNull _spikeStrip) exitWith {};

detach _spikeStrip;
_spikeStrip setPos [(getPos _spikeStrip select 0), (getPos _spikeStrip select 1), 0];
_spikeStrip setDamage 1;

private _units = if(playerSide isEqualTo west) then {west} else {group player};
[_spikeStrip] remoteExec ["life_fnc_spikeStripMarker", _units];
[_spikeStrip] remoteExec ["HC_fnc_spikeStrip", HC_Life];