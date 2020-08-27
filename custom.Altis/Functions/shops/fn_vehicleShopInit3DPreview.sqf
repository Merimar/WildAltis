setViewDistance 300;

life_preview_3D_vehicle_cam = "camera" camCreate [11141, 22704, 0];
life_preview_3D_vehicle_cam cameraEffect ["Internal", "BACK"];
life_preview_3D_vehicle_cam camSetFocus [-1, -1];
showCinemaBorder false;
life_preview_3D_vehicle_cam camCommit 0;

[] spawn {
    for "_i" from 0 to 1 step 0 do {
        if(isNull life_preview_3D_vehicle_cam) exitWith {};
        waitUntil {!isNull life_preview_3D_vehicle_object};

        private _vehicle = life_preview_3D_vehicle_object;
        private _distanceCam = 2.25 * ([boundingBoxReal _vehicle select 0 select 0, boundingBoxReal _vehicle select 0 select 2] distance [boundingBoxReal _vehicle select 1 select 0, boundingBoxReal _vehicle select 1 select 2]);
        private _azimuthCam = 0;

        life_preview_3D_vehicle_cam camSetTarget _vehicle;
        life_preview_3D_vehicle_cam camSetPos (_vehicle modelToWorld [_distanceCam * sin _azimuthCam, _distanceCam * cos _azimuthCam, _distanceCam * 0.33]);
        life_preview_3D_vehicle_cam camCommit 0;

        for "_i" from 0 to 1 step 0 do {
            if(!(life_preview_3D_vehicle_object isEqualTo _vehicle)) exitWith {};
            _azimuthCam = _azimuthCam + 1.00;
            life_preview_3D_vehicle_cam camSetPos (_vehicle modelToWorld [_distanceCam * sin _azimuthCam, _distanceCam * cos _azimuthCam, _distanceCam * 0.33]);
            life_preview_3D_vehicle_cam camCommit 0.05;
            sleep 0.05;
        };
    };
};
