private _unit = param [0, objNull, [objNull]];
private _anim = param [1, "", [""]];
private _stop = param [2, false, [false]];
if(_stop) then {
	_unit switchMove "";
} else {
	_unit playMoveNow _anim;
};
