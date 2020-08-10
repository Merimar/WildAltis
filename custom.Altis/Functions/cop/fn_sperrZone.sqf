#include "..\script_macros.hpp"
if(call life_coplevel < 4) exitWith {["Du kannst Sperrzonen erst platzieren wenn du Coplevel 4 bist", "Keine Rechte"] spawn life_fnc_message;};
if(SPERRZONEN_TIMER) exitWith {["Du hast schon eine Sperrzone platziert!", "Sperrzone"] spawn life_fnc_message;};
closeDialog 0;

SPERRZONE_CLICK = false;
SPERRZONE_POS = [0, 0, 0];
openMap true;

["Markiere eine Stelle auf der Map, wo die Sperrzone erstellt werden soll", "Neue Sperrzone"] spawn life_fnc_message;

onMapSingleClick "SPERRZONE_POS = _pos; SPERRZONE_CLICK = true; true;";

waitUntil {SPERRZONE_CLICK or !(visiblemap)};
onMapSingleClick "";
openMap false;

if (!visibleMap) exitwith {["", "Platzierung abgebrochen"] spawn life_fnc_message;};

SPERRZONEN_TIMER = true;

_markerX = createMarker [format["%1_markerX",getPlayerUID player],visiblePosition player];
_markerX setMarkerColor "ColorBlack";
_markerX setMarkerType "mil_warning";
_markerX setMarkerText "Polizei Sperrzone";
_markerX setMarkerPos SPERRZONE_POS;

_markerY = createMarker [format["%1_markerY",getPlayerUID player],visiblePosition player];
_markerY setMarkerColor "ColorYellow";
_markerY setMarkerType "Empty";
_markerY setMarkerShape "ELLIPSE";
_markerY setMarkerSize [500,500];
_markerY setMarkerPos SPERRZONE_POS;

["Du hast eine Sperrzone auf der Map platziert. In 5 Minuten verschwindet die Sperrzone automatisch wieder von der Map, du kannst dann eine neue setzen", "Neue Sperrzone"] spawn life_fnc_message;
[_markerX, _markerY, player] remoteExec ["HC_fnc_sperrzone", HC_LIFE];

sleep 300;
SPERRZONEN_TIMER = false;