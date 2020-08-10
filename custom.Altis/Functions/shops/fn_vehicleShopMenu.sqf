disableSerialization;
private _shop = param [0, ""];
private _spawnPoints = param [1, ""];

createDialog "VehicleShop";
life_preview_3D_vehicle_object = objNull;
[] call life_fnc_vehicleShopInit3DPreview;

life_veh_shop = [_shop, playerSide, _spawnPoints, "", 1];
life_veh_sel = [["", 0], ["", 0], ["", 0], [false, 0], [false, 0]];
life_veh_money = [0, 1, 1, 1, 1];
[1] call life_fnc_vehicleSteps;

((findDisplay 4450) displayCtrl 4451) lbSetCurSel 0;
showChat false;