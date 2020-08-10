private _unit = param [0, objNull, [objNull]];
private _vehicle = param [1, objNull, [objNull]];
private _headPos = param [2, [0, 0, 0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_pushBoat"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _vehicle) exitWith {};

private _pos = visiblePosition _unit;
private _dir = getDir _unit;

private _distance = _unit distance _vehicle;
private _boundingBox = boundingBox _vehicle;
private _pushDistance = 2;

_pos = [(_pos select 0) + _distance * sin _dir, (_pos select 1) + _distance * cos _dir, _pos select 2];
private _model = _vehicle worldToModel _pos;
private _minSetBoxLimits = _boundingBox select 0;
private _maxSetBoxLimits = _boundingBox select 1;
private _minX = _minSetBoxLimits select 0;
private _minY = _minSetBoxLimits select 1;
private _minZ = _minSetBoxLimits select 2;
private _maxX = _maxSetBoxLimits select 0;
private _maxY = _maxSetBoxLimits select 1;
private _maxZ = _maxSetBoxLimits select 2;
private _xRPM = _model select 0;
private _yRPM = _model select 1;
private _zRPM = _model select 2;

if (((_xRPM > _minX) && (_xRPM < _maxX) && (_yRPM > _minY) && (_yRPM < _maxY) && (_zRPM > _minZ) && (_zRPM < _maxZ)) || (_distance <= 3.5)) then {
private _headDir = [(_headPos select 0) - (getPos _unit select 0), (_headPos select 1) - (getPos _unit select 1), (_headPos select 2) - (getPos _unit select 2)];
_dir = (_headDir select 0) atan2 (_headDir select 1);
private _speed = 6;
private _velocity = velocity _vehicle;
_vehicle setVelocity [(_velocity select 0) + ((sin _dir) * _speed), (_velocity select 1) + ((cos _dir) * _speed), 1];
if (_vehicle isKindOf "Ship") then {sleep 1;_vehicle setVelocity [0,0,0];};
};