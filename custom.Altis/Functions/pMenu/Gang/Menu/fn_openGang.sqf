disableSerialization;
if(isNull findDisplay 4200) then {createDialog "Gang";};
private _display = findDisplay 4200;
private _list = _display displayCtrl 4201;
private _combo = _display displayCtrl 4202;
private _gangName = _display displayCtrl 4203;
private _gangOwner = _display displayCtrl 4204;
private _gangBank = _display displayCtrl 4205;
private _gangRang = _display displayCtrl 4206;
private _gangMax = _display displayCtrl 4207;
private _gangOnline = _display displayCtrl 4208;
private _btnOffline = _display displayCtrl 4209;
private _btnInvite = _display displayCtrl 4210;
private _btnKick = _display displayCtrl 4211;
private _btnPromote = _display displayCtrl 4212;
private _btnUpgrade = _display displayCtrl 4213;
private _btnHouse = _display displayCtrl 4214;
private _btnBuffs = _display displayCtrl 4215;
private _btnLeave = _display displayCtrl 4216;
private _btnDisband = _display displayCtrl 4217;

private _group = group player;
private _gangOnlineCount =  count (units _group);
private _owner = _group getVariable ["gang_owner", ""];
private _playerRank = [player, _group] call life_fnc_getGangRank;

GANG_CUR_ACTION = "";
_btn ctrlSetText "Offline Spieler";

_gangName ctrlSetText (_group getVariable ["gang_name", ""]);
_gangOwner ctrlSetText (_group getVariable ["gang_ownerName", ""]);
_gangBank ctrlSetText ([_group getVariable ["gang_bank", 0]] call life_fnc_numberText);
_gangMax ctrlSetText str (_group getVariable ["gang_maxMembers", 8]);
_gangOnline ctrlSetText format ["%1 / %2", _gangOnlineCount, _group getVariable ["gang_maxMembers", 8]];
_gangRang ctrlSetText str _playerRank;

lbClear _combo;
lbClear _list;
for "_int" from 0 to 6 step 1 do {_combo lbAdd str _int;};

{
private _xRank = [_x, _group] call life_fnc_getGangRank;
if(_x != player) then {
_list lbAdd format ["%1 [%2]", name _x, _xRank];
_list lbSetData [lbSize (_list)-1, str _x];
};
}forEach (units _group);

_btnInvite ctrlEnable (_playerRank >= 1);
_btnUpgrade ctrlEnable (_playerRank >= 2);
_btnBuffs ctrlEnable (_playerRank >= 3);
_btnHouse ctrlEnable (_playerRank >= 4);
_btnOffline ctrlEnable (_playerRank >= 4);
_btnKick ctrlEnable (_playerRank >= 5);
_btnPromote ctrlEnable (_playerRank >= 5);
_btnDisband ctrlEnable (_playerRank >= 6);
_btnLeave ctrlEnable (_playerRank != 6);