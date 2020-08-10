private _houseClassname = param [0, ""];
private _housePosition = param [1, [0,0,0]];
private _remove = param [2, false];

private _houseName = getText (configFile >> "CfgVehicles" >> _houseClassname >> "displayName");
private _house = nearestObject [_housePosition, _houseClassname];
private _houseID = _house getVariable ["house_id", -1];
private _markerName = format ["house_%1", _houseID];

if(!_remove) then {
private _marker = createMarkerLocal [_markerName, _housePosition];
_marker setMarkerTextLocal _houseName;
_marker setMarkerColorLocal "ColorBlue";
_marker setMarkerTypeLocal "loc_Lighthouse";
}else {
deleteMarkerLocal _markerName;
};