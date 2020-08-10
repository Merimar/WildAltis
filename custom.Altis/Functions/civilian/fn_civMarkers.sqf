private["_markers","_members"];
_markers = [];
_members = [];

for "_i" from 0 to 1 step 0 do {
    sleep 0.5;
    if (visibleMap) then
    {
		_members = (units (group player)) select {!(_x getVariable ["restrained", false])};
        {
                _marker = createMarkerLocal [format["%1_marker",_x], visiblePosition _x];
				_marker setMarkerColorLocal "colorYellow";
				_marker setMarkerTypeLocal "mil_dot";
				_marker setMarkerTextLocal format["%1", name _x];
				_marker setMarkerDirLocal (getDir _x);
				_markers pushBack [_marker,_x];
        } forEach _members;

        while {visibleMap} do
        {
            {
                private["_unit"];
                _unit = _x select 1;
                if (!isNil "_unit" && !isNull _unit) then {
                      (_x select 0) setMarkerPosLocal (visiblePosition _unit);
                };
            } forEach _markers;
            if (!visibleMap) exitWith {};
            sleep 0.02;
        };

        {deleteMarkerLocal (_x select 0);} forEach _markers;
        _markers = [];
        _members = [];
    };
};
