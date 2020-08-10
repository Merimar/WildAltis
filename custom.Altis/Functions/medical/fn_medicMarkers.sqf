sleep 0.25;
if (visibleMap) then {
	private _medics = playableUnits select {side _x isEqualTo independent};
	private _units = allDeadMen select {!(_x getVariable ["Revive", false])};
	private _markers = [];

    {
		_marker = createMarkerLocal [format["%1_marker",_x], visiblePosition _x];
		_marker setMarkerColorLocal "colorIndependent";
		_marker setMarkerTypeLocal "mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];
		_marker setMarkerDirLocal (getDir _x);
		_markers pushBack [_marker, _x];
    }forEach _medics;

    {
		private _lootInformation = _x getVariable ["Loot_Information", []];
		if(count _lootInformation > 0) then {
        _marker = createMarkerLocal [format["%1_dead_marker",_x], visiblePosition _x];
        _marker setMarkerColorLocal "ColorBlack";
        _marker setMarkerTypeLocal "loc_Hospital";
        _marker setMarkerTextLocal format ["%1", _lootInformation param [1, "Unbekannt"]];
        _markers pushBack [_marker, _x];
		};
    }forEach _units;

    while {visibleMap} do {
        {
			private _marker = _x select 0;
            private _unit = _x select 1;
            if (!isNull _unit) then {_marker setMarkerPosLocal (visiblePosition _unit);};
        }forEach _markers;
        if (!visibleMap) exitWith {};
        sleep 0.02;
    };
    {deleteMarkerLocal (_x select 0);}forEach _markers;
};