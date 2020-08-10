private _msg = param [0, "", [""]];
private _important = param [1, true, [true]];
private _list = [] call HC_fnc_getAdmins;

if(_important) then {
[_msg, "Admin Information"] remoteExec ["life_fnc_message", _list];
}else {
[_msg, false, "slow"] remoteExec ["life_fnc_notification_system", _list];
};