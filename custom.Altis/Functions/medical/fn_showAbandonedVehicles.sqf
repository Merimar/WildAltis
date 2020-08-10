if((time - ABANDONED_TIMER) < (10 * 60)) exitWith {["Du kannst dir nur alle 10min die Fahrzeuge anzeigen lassen", "Medic System"] spawn life_fnc_message;};
ABANDONED_TIMER = time;

["Makiere dir selbst die zerstörten Fahrzeuge auf der Map! Du kannst diese Funktion nur alle 10min benutzen!", "Medic System"] spawn life_fnc_message;
closeDialog 0;

private _markers = [];
openMap true;

{
_vehicle = _x;
if(count (crew _vehicle) isEqualTo 0 && alive _vehicle && ({_x distance _vehicle < 500} count playableUnits) isEqualTo 0 && (_vehicle isKindOf "LandVehicle" || _vehicle isKindOf "Ship" || _vehicle isKindOf "Air")) then {
_marker = createMarkerLocal [format["vehicle_marker_%1", _vehicle], visiblePosition _vehicle];
_marker setMarkerColorLocal "ColorBlack";
_marker setMarkerTypeLocal "hd_end";
_marker setMarkerTextLocal "Verlassenes Fahrzeug";
_markers pushBack _marker;
};
}forEach vehicles;

waitUntil {!visibleMap}; 

{deleteMarkerLocal _x;}forEach _markers;

["Du kannst die Funktion in 10min erneut nutzen!", "Medic System"] spawn life_fnc_message;