private _unit = _this select 0;
private _pID = _this select 1;

private _handle = [_unit] spawn HC_fnc_paycheck;
private _index = PAYCHECK_HANDLE findIf {_x select 0 == _pID};

if(_index isEqualTo -1) then {
PAYCHECK_HANDLE pushBack [_pID, _handle];
}else {
(PAYCHECK_HANDLE select _index) set [1, _handle];
};