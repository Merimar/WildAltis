private _faction = param [0, sideUnknown];
private _position = param [1, getPos player];
private _radius = param [2, 30];

private _ret = {_x != player && side _x isEqualTo _faction && alive _x && _position distance _x < _radius} count playableUnits > 0;
_ret;