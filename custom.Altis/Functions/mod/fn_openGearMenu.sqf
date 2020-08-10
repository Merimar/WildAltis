#include "..\script_macros.hpp"
disableSerialization;
if(isNull findDisplay 150000) then {createDialog "life_eventgear_menu";};

private _display = findDisplay 150000;
private _btn = _display displayCtrl 150008;
private _color = if(player getVariable ["Event_F", false]) then {[0.1, 1, 0, 0.8]} else {[1, 0.1, 0, 0.8]};

_btn ctrlSetBackgroundColor _color;