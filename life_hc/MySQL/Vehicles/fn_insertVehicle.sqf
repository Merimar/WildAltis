private _pID = param [0, ""];
private _pSide = param [1, civilian];
private _vehicle = param [2, objNull];
private _color = param [3, "-1"];
private _material = param [4, "-1"];
private _insurance = param [5, false];
private _vUID = round(random(100000000));
private _sideID = [_pSide] call HC_fnc_getGroupSideID;

_insurance = if(_insurance) then {1} else {0};

private _query = format ["INSERT INTO vehicles (vuid, owner_id, side_id, classname_id, color_id, material_id, insurance) VALUES ('%1', '%2', '%3', (SELECT id FROM life_classnames WHERE classname = '%4'), (SELECT id FROM life_vehicle_colors WHERE color = '%5'), (SELECT id FROM life_vehicle_materials WHERE material = '%6'), '%7')", _vUID, _pID, _sideID, typeOf _vehicle, _color, _material, _insurance];
[_query,1] call HC_fnc_asyncCall;

_vehicle setVariable ["dbInfo", [_pID, _pSide, _vUID, ""], true];

private _vehInvID = format ["VEHICLE_INV_%1", _vUID];
missionNamespace setVariable [_vehInvID, [[], 0]];