MAP_MARKER_SLIDER = param [0, 0, [0]];

{
{
if(markerShape _x != "ELLIPSE") then {
_x setMarkerSizeLocal [MAP_MARKER_SLIDER, MAP_MARKER_SLIDER];
};
}forEach _x;
}forEach [MAP_MARKER_GENERELL_MARKER, MAP_MARKER_POLIZEI_MARKER, MAP_MARKER_MEDIC_MARKER, MAP_MARKER_REBELL_MARKER, MAP_MARKER_SHOPS_MARKER, MAP_MARKER_LEGAL_MARKER, MAP_MARKER_ILLEGAL_MARKER, MAP_MARKER_DP_MARKER];