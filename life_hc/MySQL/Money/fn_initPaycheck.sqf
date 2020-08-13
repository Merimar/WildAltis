private _unit = param [0, objNull];
private _pID = getPlayerUID _unit;

private _handle = [_unit] spawn HC_fnc_paycheck;
private _index = PAYCHECK_HANDLE findIf {_x select 0 == _pID};

if(_index isEqualTo -1) then {
PAYCHECK_HANDLE pushBack [_pID, _handle];
}else {
(PAYCHECK_HANDLE select _index) set [1, _handle];
};