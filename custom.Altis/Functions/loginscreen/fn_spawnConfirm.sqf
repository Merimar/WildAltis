disableSerialization;
private _display = findDisplay 38500;
private _spawnList = _display displayCtrl 38501;
private _map = _display displayCtrl 38502;
private _index = lbCurSel 38501;

if(_index isEqualTo -1) exitWith {["Du musst einen Spawnpunkt auswählen", "Keine Auswahl"] spawn life_fnc_message;};

private _data = _spawnList lbData _index;
private _position = [0, 0, 0];
private _spawnName = "";

if(_data == "") then {
private _value = _spawnList lbValue _index;
private _house = life_houses select _value;
private _bPos = [_house] call life_fnc_getBuildingPositions;
if(_bPos isEqualTo []) then {
_position = getPos _house;
}else {
{_bPos = _bPos - [(_house buildingPos _x)];}forEach (_house getVariable ["slots",[]]);
_position = selectRandom _bPos;
};
_spawnName = format ["Haus: %1", getText (configFile >> "CfgVehicles" >> typeOf _house >> "displayName")];
}else {
_position = markerPos (getText(missionConfigFile >> "CfgSpawnPoints" >> _data >> "spawnMarker"));
_spawnName = getText (missionConfigFile >> "CfgSpawnPoints" >> _data >> "displayName");
};

[player, _spawnName, _position] remoteExec ["HC_fnc_spawned", HC_LIFE];
titleText [format["Du bist in %1 gespawnt", _spawnName], "PLAIN"];
player allowDamage true;
0 fadeSound 1;

//VARIABLES
life_isDead = false;
player setVariable ["notruf_medic", "", true];

[] call life_fnc_disableChannel;
[] call life_fnc_hudSetup;
[] call life_fnc_updateCom;

if(LOGIN_SCREEN_STATUS isEqualTo 1) then {
[
	[
		["Willkommen auf Wild-Altis", "<t align = 'center' shadow = '1' size = '0.7' font = 'PuristaBold'>%1</t><br/>", 1],
		["Wir wünschen dir viel Spaß beim Spielen", "<t align = 'center' shadow = '1' size = '0.7' font = 'PuristaBold'>%1</t><br/>", 1],
		["Bei Fragen besuch doch gerne unseren Teamspeak", "<t align = 'center' shadow = '1' size = '0.7' font = 'PuristaBold'>%1</t><br/>", 1],
		["ts.Wild-Altis.de",format["<t align = 'center' shadow = '1' size = '0.7' font = 'PuristaBold' color = '%1'>%2</t>","#3294F0","%1"],1],
		["",""],
		["",""]
	], 0.5, 0.5
] spawn BIS_fnc_typeText;
LOGIN_SCREEN_STATUS = 2;
};

if(call life_donorlevel > 0) then {["Vielen Dank, dass du unseren Server unterstützt!", format ["VIP Level %1", call life_donorlevel], 10] spawn life_fnc_message;};

[] spawn {
sleep 0.5;
closeDialog 0;
if(JAIL_TIME > 0) exitWith {[objNull, JAIL_TIME, life_geheimZahl, true] spawn life_fnc_jailMe;};
sleep 2.5;
_isGe = (group player) getVariable ["gangeroberung", false];
if(_isGe && !ZONEN_TIMER_THREAD) then {[] call life_fnc_zonenTimer;};
};