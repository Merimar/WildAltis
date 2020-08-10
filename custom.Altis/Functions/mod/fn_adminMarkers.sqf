_markers = [];
_players = [];

private _eventStart = bank_obj getVariable ["event_start", false];
private _eventMarker = bank_obj getVariable ["event_marker", false];

if(_eventStart && {_eventMarker}) then {

sleep 0.5;
if (visibleMap) then {

{
_event = _x getVariable ["event_join", false];
if(_event) then {
_players pushBack _x;
};
}foreach playableUnits;

{
_name = name _x;
_marker = createMarkerLocal [format["%1_markerG",_x],visiblePosition _x];
_marker setMarkerColorLocal "ColorPink";
_marker setMarkerTypeLocal "Mil_dot";
_marker setMarkerTextLocal format["%1", _name];
_markers pushBack [_marker,_x];
} forEach _players;

while {visibleMap} do {
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
_players = [];
};
};
