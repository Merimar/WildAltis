_rewardarray = param [0, [], [[]]];
_rewardclass = param [1, "", [""]];

_box = "CargoNet_01_box_F" createVehicleLocal [0,0,0]; 
hideObject _box; 
_box setPos (position player);
_box setVariable ["rewardbox", true];
_box setVariable ["rewardbox_class", _rewardclass];
_box addItemCargo _rewardarray;
player action ["GEAR",_box];