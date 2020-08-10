if(call life_adminlevel < 5) exitWith {};

private _index = lbCurSel 3801;
private _money = parseNumber (ctrlText 3803);

if(_index isEqualTo -1) exitWith {};
private _unit = call compile format ["%1", lbData [3801, _index]];
if(isNull _unit || _money <= 0) exitWith {};

[_unit, _money, player] remoteExec ["HC_fnc_adminGiveMoney", HC_LIFE];