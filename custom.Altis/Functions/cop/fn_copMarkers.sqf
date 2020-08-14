private _markerplyobjects = [];
private _markervehobjects = [];

sleep 0.2;
if (visibleMap) then {
    while {visibleMap} do {
		private _cops = playableUnits select {isNull (attachedTo _x) && (side _x) isEqualTo west && !(_x getVariable ["restrained", false]) && !(_x getVariable ["isDead", false]) && (isNull objectParent _x) && (alive _x)};
		private _copsVehicle = vehicles select {alive _x && !(isNull (driver _x)) && (side (driver _x)) isEqualTo west && ((count (crew _x)) > 0)};

		{
			private _remove = false;
			if(isNull(_x)) then {
				_remove = true;
			} else {
				if(!(alive _x)) then {
					_remove = true;
				};
				if(!(isNull objectParent _x)) then {
					_remove = true;
				};
			};
			if(_remove) then {
				_markerplyobjects = _markerplyobjects - [_x];
				deleteMarkerLocal format ["marker_%1", _x];
			};
		} forEach _markerplyobjects;

		{
			private _remove = false;
			if(isNull(_x)) then {
				_remove = true;
			} else {
				if(!(alive _x)) then {
					_remove = true;
				};
				if((count (crew _x)) <= 0) then {
					_remove = true;
				};
			};
			if(_remove) then {
				_markervehobjects = _markervehobjects - [_x];
				deleteMarkerLocal format ["marker_%1", _x];
			};
		} forEach _markervehobjects;

		{
			if(!(_x in _markerplyobjects)) then {
				_markerplyobjects pushBack _x;
				private _prefix = _x getVariable ["squad", "Nicht eingeloggt"];
				private _marker = createMarkerLocal [format ["marker_%1", _x], visiblePosition _x];
				_marker setMarkerColorLocal "colorBLUFOR";
				_marker setMarkerTypeLocal "mil_dot";
				_marker setMarkerTextLocal format["[%1] %2", _prefix, name _x];
				_marker setMarkerDirLocal (getDir _x);
			};
		} forEach _cops;

		{
			if(!(_x in _markervehobjects)) then {
				_markervehobjects pushBack _x;
				private _crewList = (crew _x) select {side _x == west && !(_x getVariable ["restrained", false]) && !(_x getVariable ["isDead", false])};
				private _crewNameArray = [];
				{_crewNameArray pushBack (name _x);}forEach _crewList;
				private _prefix = getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
				private _marker = createMarkerLocal [format ["marker_%1", _x], visiblePosition _x];
				private _squad = (_crewList param [0, objNull]) getVariable ["squad", "Nicht eingeloggt"];
				_marker setMarkerColorLocal "colorBLUFOR";
				_marker setMarkerTypeLocal "mil_dot";
				_marker setMarkerTextLocal format["[%3] [%1] %2", _prefix, _crewNameArray joinString ", ", _squad];
				_marker setMarkerDirLocal (getDir _x);
			};
		} forEach _copsVehicle;

		{
			private _markername = format ["marker_%1", _x];
			if(markerText _markername != "") then {
				private _prefix = _x getVariable ["squad", "Nicht eingeloggt"];
				_markername setMarkerTextLocal format["[%1] %2", _prefix, name _x];
				_markername setMarkerPosLocal (visiblePosition _x);
				_markername setMarkerDirLocal (getDir _x);
			};
		} forEach _markerplyobjects;

		{
			private _markername = format ["marker_%1", _x];
			if(markerText _markername != "") then {
				private _crewList = (crew _x) select {side _x == west && !(_x getVariable ["restrained", false]) && !(_x getVariable ["isDead", false])};
				private _crewNameArray = [];
				{_crewNameArray pushBack (name _x);}forEach _crewList;
				private _prefix = getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
				private _squad = (_crewList param [0, objNull]) getVariable ["squad", "Nicht eingeloggt"];
				_markername setMarkerTextLocal format["[%3] [%1] %2", _prefix, _crewNameArray joinString ", ", _squad];
				_markername setMarkerPosLocal (visiblePosition _x);
				_markername setMarkerDirLocal (getDir _x);
			};
		} forEach _markervehobjects;

        if(!visibleMap) exitWith {};
        sleep 0.02;
    };
	

};