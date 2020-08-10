private _unit = param [0, objNull];
private _group = param [1, grpNull];

private _xID = param [2, ""];
private _xSideID = param [3, -1];

private _pID = if(_xID == "") then {getPlayerUID _unit} else {_xID};
private _sideID = if(_xSideID isEqualTo -1) then {[side _unit] call life_fnc_getSideID} else {_xSideID};

private _permissions = _group getVariable ["gang_permissions", []];
private _owner = _group getVariable ["gang_owner", ""];
private _rangIndex = _permissions findIf {_x select 0 == _pID && (_x select 1) isEqualTo _sideID};
private _rang = if(_rangIndex isEqualTo -1) then {0} else {_permissions select _rangIndex select 2};
if(_owner == _pID) then {_rang = 6;};
_rang;