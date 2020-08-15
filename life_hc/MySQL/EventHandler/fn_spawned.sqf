private _unit = param [0, objNull, [objNull]];
private _spawnName = param [1, "", [""]];
private _position = param [2, [], [[]]];

private _isHacker = [[_spawnName], _unit, remoteExecutedOwner, "fn_spawned"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _jailTime = [getPlayerUID _unit] call HC_fnc_getArrested;
if(_jailTime isEqualType 0 && {_jailTime > 0}) then {_position = markerPos "jail_marker"; _spawnName = "Gefängnis";};

_msg = format ["Der Spieler %1 (%2 - %3) ist gespawnt (SPAWNPUNKT: %4)", name _unit, getPlayerUID _unit, side _unit, _spawnName];
["SpawnLog", _msg] call HC_fnc_Log;

private _randomSpawns = getArray (missionConfigFile >> "Life_Settings" >> "random_spawn_locations");

if(_spawnName in _randomSpawns) then {
private _housePositions = nearestObjects [_position, ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F","Land_House_Small_01_F"], 500];
if(count _housePositions > 0) then {
private _house = selectRandom _housePositions;
private _bPos = [_house] call life_fnc_getBuildingPositions;
if(!(_bPos isEqualTo [])) then {
{_bPos = _bPos - [(_house buildingPos _x)];}forEach (_house getVariable ["slots",[]]);
_position = selectRandom _bPos;
};
};
};

if(_spawnName == "Flugzeugträger") then {_position set [2, 23]; _unit setPos _position;} else {_unit setPosAtl _position;};