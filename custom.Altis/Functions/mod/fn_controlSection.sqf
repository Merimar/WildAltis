#include "..\script_macros.hpp"
/*
    File: fn_openModTool.sqf
    Author: Merimar

    Description:
    Open up the Mod Tool.
*/
_index = _this select 0;

_accessP = bank_obj getVariable ["mod_access_player", false];
_accessE = bank_obj getVariable ["mod_access_event", false];
_accessEC = bank_obj getVariable ["mod_access_eventc", false];
_accessV = bank_obj getVariable ["mod_access_vehicle", false];

if(_index isEqualTo 1) then {
if(_accessP) then {
bank_obj setVariable ["mod_access_player", false, true];
[format ["%1 hat Player Actions gesperrt!", name player], true] call life_fnc_adminMessage;
_name = profileName;
_msg = format ["Der Spieler %1 (%2) hat Player Actions gesperrt!", _name, getPlayerUID player];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];
}else {
bank_obj setVariable ["mod_access_player", true, true];
[format ["%1 hat Player Actions freigegeben!", name player], true] call life_fnc_adminMessage;
_name = profileName;
_msg = format ["Der Spieler %1 (%2) hat Player Actions freigegeben!", _name, getPlayerUID player];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];
};
};

if(_index isEqualTo 2) then {
if(_accessE) then {
bank_obj setVariable ["mod_access_event", false, true];
[format ["%1 hat Event Actions gesperrt!", name player], true] call life_fnc_adminMessage;
_name = profileName;
_msg = format ["Der Spieler %1 (%2) hat Event Actions gesperrt!", _name, getPlayerUID player];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];
}else {
bank_obj setVariable ["mod_access_event", true, true];
[format ["%1 hat Event Actions freigegeben!", name player], true] call life_fnc_adminMessage;
_name = profileName;
_msg = format ["Der Spieler %1 (%2) hat Event Actions freigegeben!", _name, getPlayerUID player];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];
};
};

if(_index isEqualTo 3) then {
if(_accessV) then {
bank_obj setVariable ["mod_access_vehicle", false, true];
[format ["%1 hat Vehicle Actions gesperrt!", name player], true] call life_fnc_adminMessage;
_name = profileName;
_msg = format ["Der Spieler %1 (%2) hat Vehicle Actions gesperrt!", _name, getPlayerUID player];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];
}else {
bank_obj setVariable ["mod_access_vehicle", true, true];
[format ["%1 hat Vehicle Actions freigegeben!", name player], true] call life_fnc_adminMessage;
_name = profileName;
_msg = format ["Der Spieler %1 (%2) hat Vehicle Actions freigegeben!", _name, getPlayerUID player];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];
};
};

if(_index isEqualTo 4) then {
if(_accessEC) then {
bank_obj setVariable ["mod_access_eventc", false, true];
[format ["%1 hat Event Control gesperrt!", name player], true] call life_fnc_adminMessage;
_name = profileName;
_msg = format ["Der Spieler %1 (%2) hat Event Control gesperrt!", _name, getPlayerUID player];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];
}else {
bank_obj setVariable ["mod_access_eventc", true, true];
[format ["%1 hat Event Control freigegeben!", name player], true] call life_fnc_adminMessage;
_name = profileName;
_msg = format ["Der Spieler %1 (%2) hat Event Control freigegeben!", _name, getPlayerUID player];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];
};
};