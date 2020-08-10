private _nearObj = nearestObjects [player, ["Land_BarGate_F", "Land_ConcreteWall_01_l_gate_F"], 40];
private _array = [0, 1];

{
if(typeOf _x == "Land_BarGate_F") then {
	private _state = (_x animationPhase "Door_1_rot") isEqualTo 0;
	_x animate ["Door_1_rot", _array select _state];
}else {
	private _state = (_x animationPhase "Door_1_move") isEqualTo 0;
	_x animate ["Door_1_move", _array select _state];
};
}forEach _nearObj;
