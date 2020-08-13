private _pID = param [0, objNull, [objNull]];

private _index = playableUnits findIf {getPlayerUID _x == _pID};
if(_index isEqualTo -1) exitWith {objNull};

private _return = playableUnits select _index;
_return;