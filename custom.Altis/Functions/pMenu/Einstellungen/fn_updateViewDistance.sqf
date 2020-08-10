switch (true) do {
    case ((vehicle player) isKindOf "Man"): {setViewDistance DISTANCE_FOOT};
    case ((vehicle player) isKindOf "LandVehicle"): {setViewDistance DISTANCE_CAR};
    case ((vehicle player) isKindOf "Ship"): {setViewDistance DISTANCE_CAR};
    case ((vehicle player) isKindOf "Air"): {setViewDistance DISTANCE_AIR};
};