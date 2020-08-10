private _pSide = param [0, sideUnknown];

if(_pSide isEqualTo sideUnknown) then {_pSide = playerSide;};

private _multiplier = switch (_pSide) do {
	case civilian: {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_CIVILIAN")};
	case east: {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_OPFOR")};
	case west: {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_COP")};
	case independent: {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_MEDIC")};
};

_multiplier;