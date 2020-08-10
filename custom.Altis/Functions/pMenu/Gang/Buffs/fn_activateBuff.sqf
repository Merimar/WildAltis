private _display = findDisplay 4250;
private _list = _display displayCtrl 4251;
private _index = lbCurSel _list;
private _group = group player;

if(_index isEqualTo -1) exitWith {};
private _buff = _list lbData _index;
if([_buff] call life_fnc_isBuffOn) exitWith {};

[player, _group, _buff] remoteExec ["HC_fnc_activateBuff", HC_LIFE];
closeDialog 0;

private _msg = getText(missionConfigFile >> "CfgBuffs" >> _buff >> "description");
[_msg, "Buff Aktiviert"] spawn life_fnc_message;