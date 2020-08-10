#include "..\script_macros.hpp"
waitUntil { !isNull player };

["Klicke auf die Map um dich zu teleportieren!", false, "slow"] call life_fnc_showNotification;
openMap true;
closeDialog 0;

Mapclick = false;
Mappos = [0, 0, 0];
onMapSingleClick "Mappos = _pos; Mapclick = true; onMapSingleClick ''; true;";
waitUntil {Mapclick or !(visiblemap)};
if (!visibleMap) exitwith {
	systemChat "Teleport abgebrochen";
	breakOut "main";
	onMapSingleClick "";
	Mapclick = false;
	Mappos = [0, 0, 0];
};
openMap false;

[player, [Mappos select 0, Mappos select 1, 0], 2] remoteExec ["HC_fnc_adminTeleportPlayer", HC_LIFE];