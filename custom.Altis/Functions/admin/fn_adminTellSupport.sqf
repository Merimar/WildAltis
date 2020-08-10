if(call life_adminlevel < 2) exitWith {};
private _index = lbCurSel 3801;

if(_index isEqualTo -1) exitWith {};
private _unit = call compile format ["%1", lbData [3801, _index]];
if(isNull _unit) exitWith {};

["", format ["Du hast den Spieler %1 in den Support gerufen", name _unit]] spawn life_fnc_message;
[] remoteExec ["life_fnc_getSupport", _unit];