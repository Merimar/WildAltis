private _msg = param [0, ""];
private _action = param [1, false];

if(_action) then {[] call life_fnc_useDrugs;}else {[] call life_fnc_useAlcohol;};

[_msg, "Substanz zugeführt"] spawn life_fnc_message;