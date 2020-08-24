private _pID = param [0, "", [""]];

private _allPaycheckRewards = "getText (_x >> 'type') == 'PACHECK'" configClasses (missionConfigFile >> "CfgRewards");

private _amount = 0;

{
private _isEnabled = [_pID, configName _x] call HC_fnc_getReward;
if(_isEnabled) then {
private _value = (getArray (_x >> "value")) select 0;
_amount = _amount + _value;
};
}forEach _allPaycheckRewards;

_amount;