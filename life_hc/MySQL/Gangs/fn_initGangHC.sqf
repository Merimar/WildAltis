private _gangInfoQuery = param [0, []];
private _gangPermissionsQuery = param [1, []];
private _gangBuffsQuery = param [2, []];
private _gangHouseQuery = param [3, []];
private _gangHouseUpgradeQuery = param [4, []];
private _gangHouseCryptoQuery = param [5, []];

if(_gangInfoQuery isEqualType "" || {count _gangInfoQuery isEqualTo 0}) exitWith {""};

private _gangName = _gangInfoQuery select 0;
private _gangOwnerID = _gangInfoQuery select 1;
private _maxMember = _gangInfoQuery select 2;
private _gangBank = _gangInfoQuery select 3;
private _gangID = _gangInfoQuery select 4;
private _gangBattery = _gangHouseQuery param [4, 0];

private _index = PLAYER_GANG_ARRAY findIf {(_x select 0) isEqualTo _gangID};
if(_index != -1) exitWith {""};

private _query = format ["SELECT p.name, p.player_id, g.side_id FROM player_names p INNER JOIN player_gang g ON g.gang_id = '%1' WHERE p.player_id = g.player_id AND p.side_id = g.side_id AND p.deleted_at IS NULL", _gangID];
private _members = [_query, 2, true] call HC_fnc_asyncCall;

private _query = format ["SELECT p.name FROM player_names p INNER JOIN gangs g ON g.uid = '%1' WHERE p.player_id = g.owner_id AND p.side_id = g.owner_side_id AND p.deleted_at IS NULL", _gangID];
private _ownerName = ([_query, 2] call HC_fnc_asyncCall) select 0;
	
private _infoArray = [_gangID, _gangName, _gangOwnerID, _ownerName, _maxMember, _gangBank, _members, _gangPermissionsQuery, _gangBuffsQuery, _gangHouseQuery, _gangHouseUpgradeQuery, _gangHouseCryptoQuery, _gangBattery];
PLAYER_GANG_ARRAY pushBack _infoArray;
_ownerName;