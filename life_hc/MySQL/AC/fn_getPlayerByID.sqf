private _searchOwnerID = param [0, 0, [0]];
private _return = ["-1", false];

if(_searchOwnerID isEqualTo 0) exitWith {_return};

private _unitIndex = playableUnits findIf {([getPlayerUID _x] call HC_fnc_getOwnerID) == _searchOwnerID};
if(_unitIndex isEqualTo -1) exitWith {_return};

_return = [playableUnits select _unitIndex, true];
_return;