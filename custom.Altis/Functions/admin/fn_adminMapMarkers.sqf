_markers = [];
_text = "";
_inVehicle = [];
_crew = "";
uiSleep 0.3;
if(visibleMap) then {
	{
		if((alive _x) && !(_x in _inVehicle)) then {
			_vehicle = vehicle _x;
			_sidetext = switch (side _x) do {case civilian:{"Zivilist"};case east:{"Rebelle"};case west:{"Polizist"};case independent:{"Feuerwehrmann"}};
			if(_vehicle != _x && {!(_vehicle isKindOf "ParachuteBase")}) then {
				_count = count(crew _vehicle);
				{
					if(alive _x && _x != (driver _vehicle) && !(_x in _inVehicle)) then {
						_crew = _crew + format ["[%3] %1%2", name _x, if(_forEachIndex == _count-1) then {""} else {", "}, _sidetext];
						_inVehicle pushBack _x;
					};
				} forEach (crew _vehicle);
				_text = format["[%4][%1] %2 %3",getText(configFile>>"CfgVehicles">>typeOf _vehicle>>"DisplayName"),
					if(!isNull (driver _vehicle)) then {
						if(_count == 1) then {
							format["%1",name (driver _vehicle)]
						}else{
							format["%1%2",name (driver _vehicle), ","]
						};
					}else{""}, _crew, side (driver _vehicle)];
				_crew = "";
			} else {
				_text = format["[%2] %1",name _x, _sidetext];
			};
            _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerDirLocal getDir _x;
			_marker setMarkerColorLocal "ColorPink";
			_marker setMarkerTypeLocal "mil_arrow";
			_marker setMarkerTextLocal format["%1", _text];
			_markers pushBack [_marker,_x];
			_text = "";
		};
	} forEach allPlayers;
	while {visibleMap} do {
		{
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then {
				if(!isNull _unit) then {
					_marker setMarkerPosLocal (visiblePosition _unit);
					_marker setMarkerDirLocal getDir _unit;
				};
			};
		} forEach _markers;
		if(!visibleMap) exitWith {};
		uiSleep 0.02;
	};
	{deleteMarkerLocal (_x select 0);} forEach _markers;
	_markers = [];
	_inVehicle = [];
};