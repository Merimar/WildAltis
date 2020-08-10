if(call life_adminlevel < 2) exitWith {};

private _state = player getVariable ["invisible", false];

private _pName = profileName;
private _pID = getPlayerUID player;
private _pSide = playerSide;

private _msg = if(_state) then {format ["Der Spieler %1 (%2 - %3) ist nun nicht mehr unsichtbar", _pName, _pID, _pSide]} else {format ["Der Spieler %1 (%2 - %3) ist nun unsichtbar", _pName, _pID, _pSide]};
[player, _msg, ""] remoteExec ["HC_fnc_modLog", HC_LIFE];

[player] remoteExec ["TON_fnc_adminInvisible", 2];