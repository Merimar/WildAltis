if(call life_adminlevel < 2) exitWith {};

private _state = player getVariable ["Duty", false];
player setVariable ["Duty", !_state, true];
private _text = if(_state) then {"ADMIN MODE DEAKTIVIERT"} else {"ADMIN MODE AKTIVIERT"};
[_text] spawn life_fnc_headline;