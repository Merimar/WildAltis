if(call life_adminlevel < 5) exitWith {};
private _index = lbCurSel 3804;

if(_index isEqualTo -1) exitWith {};
private _backupID = lbValue [3804, _index];

[player, _backupID] remoteExec ["HC_fnc_backupServer", HC_LIFE];