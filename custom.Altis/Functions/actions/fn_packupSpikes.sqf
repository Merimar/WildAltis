{
private _label = _x getVariable ["nagelband", ""];
if(_label in [playerSide, profileName]) exitWith {
if(!([true, "spikeStrip", 1] call life_fnc_handleInv)) exitWith {["Du hast nicht genug Platz im Inventar um dieses Nagelband aufzuheben.", "Nagelband"] spawn life_fnc_message;};
[player, "spikeStrip", [true]] remoteExec ["HC_fnc_useItem", HC_LIFE];
deleteVehicle _x;
["Du hast ein Nagelband vom Boden aufgehoben. Es wurde deinem Inventar hinzugefügt!", "Nagelband"] spawn life_fnc_message;
};
}forEach (nearestObjects [player, ["Land_Razorwire_F"], 8]);