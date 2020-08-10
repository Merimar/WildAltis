#include "..\script_macros.hpp"
closeDialog 0;
Event_Click = false;
Event_Pos = [0, 0, 0];
_xr = bank_obj getVariable ["savezone", false];

if(!_xr) then {
openMap true;
["Markiere eine Stelle auf der Map wo die Savezone platziert werden soll", false, "slow"] call life_fnc_showNotification;

onMapSingleClick "Event_Pos = _pos; Event_Click = true; onMapSingleClick ''; true;";

	waitUntil {Event_Click or !(visiblemap)};
	if (!visibleMap) exitwith {
		systemChat "Savezone Platzierung abgebrochen";
		breakOut "main";
		onMapSingleClick "";
	};
_pos = Event_Pos;

_name = profileName;
_logMsg = format ["Der Spieler %1 (%2) hat eine Event Savezone erstellt", _name, getPlayerUID player];
_adminMessage = format ["%1 hat eine Event Savezone erstellt", _name];
[player, _logMsg, _adminMessage] remoteExec ["HC_fnc_modLog", HC_LIFE];

_markerX = createMarker ["savezone_4",visiblePosition player];
_markerX setMarkerColor "ColorBlue";
_markerX setMarkerType "hd_flag";
_markerX setMarkerText "Event Savezone";
_markerX setMarkerPos _pos;

_markerY = createMarker ["savezone_5",visiblePosition player];
_markerY setMarkerColor "ColorGreen";
_markerY setMarkerType "Empty";
_markerY setMarkerShape "ELLIPSE";
_markerY setMarkerSize [200,200];
_markerY setMarkerPos _pos;

["Du hast die Event Savezone platziert", false, "slow"] call life_fnc_showNotification;
bank_obj setVariable ["savezone", true, true];
}else {
["Du hast die Event Savezone entfernt", false, "slow"] call life_fnc_showNotification;
deleteMarker "savezone_4";
deleteMarker "savezone_5";
bank_obj setVariable ["savezone", false, true];
};