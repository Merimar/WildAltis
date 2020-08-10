private _amount = param [0, 0];
private _acc = (player getVariable ["promille", 0]) + _amount;
player setVariable ["promille", _acc, true];

sleep 600;

_acc = ((player getVariable ["promille", 0]) - _amount);
player setVariable ["promille", _acc, true];