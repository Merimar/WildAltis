private _houseType = param [0, false];
private _group = group player;
private _gangName = _group getVariable ["gang_name", ""];
private _leader = (_group getVariable ["gang_owner", ""]) == getPlayerUID player;

if(_houseType && !_leader) exitWith {["Nur der Gangleader kann das Haus verkaufen.", "Haus kaufen"] spawn life_fnc_message;};

private _action = ["Möchtest du dieses Haus wirklich verkaufen? Du bekommst kein Geld für den Verkauf!", "Haus kaufen", "Ja", "Abbrechen"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

private _houseID = CURRENT_HOUSE_TARGET getVariable ["house_id", -1];
private _markerName = format ["house_%1", _houseID];
deleteMarkerLocal _markerName;
life_houses = life_houses - [CURRENT_HOUSE_TARGET];
if(!_houseType) then {PLAYER_HOUSE_COUNT = PLAYER_HOUSE_COUNT - 1;};
[player, CURRENT_HOUSE_TARGET, _houseType] remoteExec ["HC_fnc_houseSell", HC_LIFE];
closeDialog 0;

NO_INTERACTION = true;