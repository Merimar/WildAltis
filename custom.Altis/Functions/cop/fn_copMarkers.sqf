private _markers = [];
private _cops = [];

sleep 0.5;
if (visibleMap) then {
	_cops = playableUnits select {(side _x) isEqualTo west && !(_x getVariable ["restrained", false]) && !(_x getVariable ["isDead", false])};
	_markers = [];
    {
        
			_prefix = _x getVariable ["squad", "Nicht eingeloggt"];
            _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
            _marker setMarkerColorLocal "colorBLUFOR";
            _marker setMarkerTypeLocal "mil_dot";
            _marker setMarkerTextLocal format["[%2] %1", name _x, _prefix];
			_marker setMarkerDirLocal (getDir _x);
            _markers pushBack [_marker,_x];
    }forEach _cops;
    while {visibleMap} do {
        {
			private _marker = _x select 0;
            private _unit = _x select 1;
            if (!isNull _unit && {!(_unit getVariable ["restrained", false])}) then {_marker setMarkerPosLocal (visiblePosition _unit);};
        }forEach _markers;
        if (!visibleMap) exitWith {};
        sleep 0.02;
    };
    {deleteMarkerLocal (_x select 0);}forEach _markers;
};