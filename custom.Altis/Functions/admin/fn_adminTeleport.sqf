if(call life_adminlevel < 3) exitWith {};

private _index = lbCurSel 3801;

if(_index isEqualTo -1) exitWith {};
private _unit = call compile format ["%1", lbData [3801, _index]];
if(isNull _unit || {_unit isEqualTo player}) exitWith {};

[player, _unit] remoteExec ["HC_fnc_adminTeleportPlayer", HC_LIFE];