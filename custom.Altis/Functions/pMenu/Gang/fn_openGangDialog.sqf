private _group = group player;
private _groupName = _group getVariable ["gang_name", ""];

if(_groupName == "") then {
[] call life_fnc_openGangCreate;
}else {
[] call life_fnc_openGang;
};