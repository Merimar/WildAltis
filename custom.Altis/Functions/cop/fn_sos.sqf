private _unit = param [0, objNull, [objNull]];

if(isNull _unit) exitWith {};

private _marker = createMarkerLocal [format ["SOS_%1", getPlayerUID _unit], getPos _unit];
_marker setMarkerTextLocal format [" SOS: %1", name _unit];
_marker setMarkerTypeLocal "mil_warning";
_marker setMarkerColorLocal "ColorRed";

[format ["%1 hat den Notruf-Knopf gedrückt!", name _unit], "SOS"] spawn life_fnc_message;

sleep (15 * 60);

deleteMarkerLocal _marker;