private _house = param [0, objNull];
if(isNull _house || {!(_house isKindOf "House_F")}) exitWith {0};

private _door = 0;
private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");

for "_i" from 1 to _doors do {
    private _selectionPos = _house selectionPosition format["Door_%1_trigger",_i];
    private _worldSpace = _house modelToWorld _selectionPos;
    if (player distance _worldSpace < 2.4) exitWith {_door = _i};
};

_door;