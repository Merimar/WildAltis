private _className = param [0, ""];
if(isNil "life_preview_3D_vehicle_cam") then {[] call life_fnc_vehicleShopInit3DPreview;};
if(_className == "" || !(isClass (configFile >> "CfgVehicles" >> _className))) exitWith {};
if(!isNull life_preview_3D_vehicle_object && {typeOf life_preview_3D_vehicle_object == _className}) exitWith {};
if(!isNull life_preview_3D_vehicle_object) then {deleteVehicle life_preview_3D_vehicle_object;};

if(!life_pos_exist) then {
	life_pos_attach = [11150, 22708, 0];
	life_pos_exist = true;
	life_preview_light = "#lightpoint" createVehicleLocal life_pos_attach;
	life_preview_light setLightBrightness 0.5;
	life_preview_light setLightColor [1,1,1];
	life_preview_light setLightAmbient [1,1,1];
};

private _vehicle = _className createVehicleLocal life_pos_attach;
_vehicle setDir 128.452;
_vehicle allowDamage false;
_vehicle enableSimulation false;
life_preview_3D_vehicle_object = _vehicle;