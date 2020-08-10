private _vuid = param [0, -1];
private _ownerID = param [1, ""];
private _side = param [2, sideUnknown];
private _deleted = param [3, false];
private _sideID = [_side] call HC_fnc_getGroupSideID;
private _return = [];

if(_deleted) then {
if(_vuid isEqualTo -1) then {
private _query = format["SELECT v.vuid, l.classname, o.type, v.active, c.color, m.material, v.insurance, v.impounded FROM vehicles v LEFT JOIN life_classnames l ON v.classname_id = l.id LEFT JOIN life_object_types o ON l.type_id = o.id LEFT JOIN life_vehicle_materials m ON v.material_id = m.id LEFT JOIN life_vehicle_colors c ON v.color_id = c.id WHERE v.owner_id = '%1' AND v.side_id = '%2' AND deleted_at IS NOT NULL", _ownerID, _sideID];
_return = [_query,2,true] call HC_fnc_asyncCall;
}else {
private _query = format["SELECT v.vuid, l.classname, o.type, v.active, c.color, m.material, v.insurance, v.impounded FROM vehicles v LEFT JOIN life_classnames l ON v.classname_id = l.id LEFT JOIN life_object_types o ON l.type_id = o.id LEFT JOIN life_vehicle_materials m ON v.material_id = m.id LEFT JOIN life_vehicle_colors c ON v.color_id = c.id WHERE v.owner_id = '%1' AND v.side_id = '%2' AND v.vuid = '%3' AND deleted_at IS NOT NULL", _ownerID, _sideID, _vuid];
_return = [_query,2] call HC_fnc_asyncCall;
};
}else {
if(_vuid isEqualTo -1) then {
private _query = format["SELECT v.vuid, l.classname, o.type, v.active, c.color, m.material, v.insurance, v.impounded FROM vehicles v LEFT JOIN life_classnames l ON v.classname_id = l.id LEFT JOIN life_object_types o ON l.type_id = o.id LEFT JOIN life_vehicle_materials m ON v.material_id = m.id LEFT JOIN life_vehicle_colors c ON v.color_id = c.id WHERE v.owner_id = '%1' AND v.side_id = '%2' AND v.deleted_at IS NULL", _ownerID, _sideID];
_return = [_query,2,true] call HC_fnc_asyncCall;
}else {
private _query = format["SELECT v.vuid, l.classname, o.type, v.active, c.color, m.material, v.insurance, v.impounded FROM vehicles v LEFT JOIN life_classnames l ON v.classname_id = l.id LEFT JOIN life_object_types o ON l.type_id = o.id LEFT JOIN life_vehicle_materials m ON v.material_id = m.id LEFT JOIN life_vehicle_colors c ON v.color_id = c.id WHERE v.owner_id = '%1' AND v.side_id = '%2' AND v.vuid = '%3' AND v.deleted_at IS NULL", _ownerID, _sideID, _vuid];
_return = [_query,2] call HC_fnc_asyncCall;
};
};

_return;