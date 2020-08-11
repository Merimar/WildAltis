private _markers = [];
private _cops = [];

sleep 0.5;
if (visibleMap) then {
	private _cops = playableUnits select {isNull (attachedTo _x) && (side _x) isEqualTo west && !(_x getVariable ["restrained", false]) && !(_x getVariable ["isDead", false]) && isNull objectParent _x};
	private _copsVehicle = playableUnits select {isNull (attachedTo _x) && (side _x) isEqualTo west && !(_x getVariable ["restrained", false]) && !(_x getVariable ["isDead", false]) && !(isNull objectParent _x)};
	private _vehicleList = [];
	private _markers = [];
	private _markersVehicles = [];
	
	{
		private _vehicle = objectParent _x;
		if(!(_vehicle in _vehicleList)) then {
			private _crewList = (crew _vehicle) select {side _x == west && !(_x getVariable ["restrained", false]) && !(_x getVariable ["isDead", false])};
			private _crewNameArray = [];
			{_crewNameArray pushBack (name _x);}forEach _crewList;
			private _prefix = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
			private _marker = createMarkerLocal [format ["%1_marker",_x], visiblePosition _x];
			_marker setMarkerColorLocal "colorBLUFOR";
			_marker setMarkerTypeLocal "mil_dot";
			_marker setMarkerTextLocal format["[%1] %2", _prefix, _crewNameArray joinString ", "];
			_marker setMarkerDirLocal (getDir _x);
			_markersVehicles pushBack [_marker, _crewList, _vehicle, _prefix, _crewNameArray];
			_vehicleList pushBack _vehicle;
		};
	}forEach _copsVehicle;
	
    {
		private _prefix = _x getVariable ["squad", "Nicht eingeloggt"];
		private _marker = createMarkerLocal [format ["%1_marker",_x], visiblePosition _x];
		_marker setMarkerColorLocal "colorBLUFOR";
		_marker setMarkerTypeLocal "mil_dot";
		_marker setMarkerTextLocal format["[%1] %2", _prefix, name _x];
		_marker setMarkerDirLocal (getDir _x);
		_markers pushBack [_marker,_x];
    }forEach _cops;
	
    while {visibleMap} do {
        {
			private _marker = _x select 0;
            private _unit = _x select 1;
            if(!isNull _unit && {!(_unit getVariable ["restrained", false]) && !(_unit getVariable ["isDead", false])}) then {_marker setMarkerPosLocal (visiblePosition _unit);};
        }forEach _markers;
		
		private _newVehArray = +_markersVehicles;
		
		{
			private _marker = _x select 0;
            private _units = _x select 1;
			private _vehicle = _x select 2;
			private _prefix = _x select 3;
			private _crewNameArray = _x select 4;
			private _unitsNot = _units select {isNull _x || _x getVariable ["restrained", false] && {_x getVariable ["isDead", false]}};
			private _change = false;
			private _remove = false;
			if(count _unitsNot > 0) then {(_markersVehicles select _forEachIndex) set [1, _units - _unitsNot]; _change = true;};
			if(isNull _vehicle || count (crew _vehicle) isEqualTo 0) then {_markersVehicles deleteAt _forEachIndex; _remove = true;};
			if(_change) then {
			_crewNameArray = [];
			{_crewNameArray pushBack (name _x);}forEach (_units - _unitsNot);
			_marker setMarkerTextLocal format["[%1] %2", _prefix, _crewNameArray joinString ", "];
			};
            if(!_remove) then {deleteMarkerLocal _marker;} else {_marker setMarkerPosLocal (visiblePosition _vehicle);};
        }forEach _newVehArray;
        if(!visibleMap) exitWith {};
        sleep 0.02;
    };
	
    {deleteMarkerLocal (_x select 0);}forEach _markers;
};

