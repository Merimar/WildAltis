private _pID = _this select 0;
private _pSide = _this select 1;

private _index = PLAYTIME findIf {(_x select 0) == _pID && (_x select 1) isEqualTo _pSide};

if(_index isEqualTo -1) exitWith {};

private _joinTime = PLAYTIME select _index select 2;
private _playtime = floor((time - _joinTime) / 60);
private _sideID = [_pSide] call HC_fnc_getSideID;

private _query = format ["SELECT time FROM player_playtimes WHERE player_id = '%1' AND side_id = '%2'", _pID, _sideID];
private _currentTime = ([_query, 2] call HC_fnc_asyncCall) select 0;
private _resultTime = _currentTime + _playTime;

_query = format ["UPDATE player_playtimes SET time = '%1' WHERE player_id = '%2' AND side_id = '%3'", _resultTime, _pID, _sideID];
[_query, 1] call HC_fnc_asyncCall;

PLAYTIME deleteAt _index;