for "_i" from 0 to 1 step 0 do {
    sleep (30 * 60);
    {
		_thing = _x;
		_units = {(_x distance _thing < 50)} count allPlayers;
		if(_units isEqualTo 0) then {deleteVehicle _thing;};
    }forEach (allMissionObjects "GroundWeaponHolder");
};