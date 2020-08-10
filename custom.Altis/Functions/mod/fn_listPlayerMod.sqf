private _unit = call compile format["%1", lbData [100022, lbCurSel 100022]];
if(isNull _unit) exitWith {};

private _state = _unit getVariable ["isListed", false];
_unit setVariable ["isListed", !_state, true];

[format ["Du hast den Spieler %1 freigeschaltet. Er kann nur auf alle Funktionen des Tools zugreifen", name _unit], "Mod Tool"] spawn life_fnc_message;