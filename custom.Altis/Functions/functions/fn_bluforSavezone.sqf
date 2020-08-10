private _uids = profileNamespace getVariable ["Savezone_Blufor_X", []];
private _index = _uids findIf {(_x select 0) != (getPlayerUID player)};

if(_index isEqualTo -1) exitWith {
profileNamespace setVariable ["Savezone_Blufor_X", [[getPlayerUID player, profileName]]];
saveProfileNamespace;
};

private _savezone = _uids select _index;
[player, _savezone] remoteExec ["HC_fnc_bluforSavezone", HC_LIFE];