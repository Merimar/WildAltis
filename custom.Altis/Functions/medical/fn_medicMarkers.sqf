private _markers = [];
private _text = "";
private _inVehicle = [];
private _crew = "";

uiSleep 0.3;

if(visibleMap) then {
	
	private _emergencyArray = bank_obj getVariable ["Emergency_Calls", []];
	private _deademergency =  _emergencyArray select {_x select 8 && !(_x select 5)};
	{
		if(!(_x getVariable["restrained",false]) && (alive _x) && !(_x in _inVehicle)) then {
			_vehicle = vehicle _x;
			if(_vehicle != _x && {!(_vehicle isKindOf "ParachuteBase")}) then {
				_count = count(crew _vehicle);
				{
					if(alive _x && _x != (driver _vehicle) && _x in units(group player) && !(_x in _inVehicle)) then {
						_crew = _crew + format ["%1%2", name _x, if(_forEachIndex == _count-1) then {""} else {", "}];
						_inVehicle pushBack _x;
					};
				} forEach (crew _vehicle);
				_text = format["[%1] %2 %3",getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "DisplayName"),
					if(!isNull (driver _vehicle) && {(driver _vehicle in units (group player))}) then {
						if(_count == 1) then {
							format["%1",name (driver _vehicle)]
						}else{
							format["%1%2",name (driver _vehicle), ","]
						};
					}else{""}, _crew];
				_crew = "";
			} else {
				_text = format["%1",name _x];
			};
            _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorIndependent";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format["%1", _text];
			_markers pushBack [_marker,_x];
			_text = "";
		};
	}forEach units (group player);
	
	{
		_marker = createMarkerLocal [format["%1_dead_marker", _x select 0], _x select 7];
		_marker setMarkerColorLocal "ColorBlack";
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerTextLocal format ["%1", _x select 0];
		_markers pushBack [_marker, objNull];
	}forEach _deademergency;
	
	while {visibleMap} do {
		{
			private _marker = _x select 0;
			private _unit = _x select 1;
			if(!isNull _unit) then {_marker setMarkerPosLocal (visiblePosition _unit);};
		}forEach _markers;
		
		if(!visibleMap) exitWith {};
		uiSleep 0.02;
	};
	
	{deleteMarkerLocal (_x select 0);}forEach _markers;
	_markers = [];
	_inVehicle = [];
};