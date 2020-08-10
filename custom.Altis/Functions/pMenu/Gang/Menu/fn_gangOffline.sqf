disableSerialization;
private _display = findDisplay 4200;
private _group = group player;
private _btn = _display displayCtrl 4209;

if(GANG_TIMER) exitWith {["", "Nicht so schnell"] spawn life_fnc_message};
[] spawn {
GANG_TIMER = true;
sleep 10;
GANG_TIMER = false;
};

if(GANG_CUR_ACTION == "OFFLINE") then {
[] call life_fnc_openGang;
}else {
GANG_CUR_ACTION = "OFFLINE";
_btn ctrlSetText "Online Spieler";
["", "Lade offline Spieler ..."] spawn life_fnc_message;
[player, _group] remoteExec ["HC_fnc_gangOffline", HC_LIFE];
};