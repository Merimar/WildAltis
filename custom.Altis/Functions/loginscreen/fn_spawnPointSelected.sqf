disableSerialization;
private _display = findDisplay 38500;
private _spawnList = _display displayCtrl 38501;
private _map = _display displayCtrl 38502;
private _info = _display displayCtrl 38503;
private _index = lbCurSel 38501;

if(_index isEqualTo -1) exitWith {};

private _data = _spawnList lbData _index;
private _position = [0, 0, 0];
private _name = "";

if(_data == "") then {
private _value = _spawnList lbValue _index;
private _house = life_houses select _value;
_position = getPos _house;
_name = "Dein Haus";
}else {
private _marker = getText(missionConfigFile >> "CfgSpawnPoints" >> _data >> "spawnMarker");
_position = markerPos _marker;
_name = getText(missionConfigFile >> "CfgSpawnPoints" >> _data >> "displayName")
};

_info ctrlSetText format ["Aktueller Spawnpunkt: %1", _name];

_map ctrlMapAnimAdd [1,0.1,_position];
ctrlMapAnimCommit _map;