private _pID = param [0, "", [""]];
private _saveAll = param [1, false, [false]];

private _target = if(_saveAll) then {playableUnits} else {[_pID]};

{
private _curTarget = _x;
private _pID = if(_curTarget isEqualType "") then {_curTarget} else {getPlayerUID _x};
private _saveState = [_pID] call HC_fnc_getSave;

private _pSide = [_saveState select 2] call HC_fnc_getSideID;
private _groupSide = [_saveState select 2] call HC_fnc_getGroupSideID;
private _saveStatus = _saveState select SAVE_STATE_INDEX;

if(count _saveStatus > 0) then {

private _licenseInfo = _saveStatus param [5, []];
private _skillInfo = _saveStatus param [6, []];
private _aliveInfo = if((_saveStatus param [8, []]) param [0, true]) then {1} else {0};
private _moneyInfo = _saveStatus param [10, []];
private _gearInfo = [_saveStatus param [11, []]] call HC_fnc_mresArray;
private _virtInfo = _saveStatus param [12, []];
private _lockerInfo = _saveStatus param [13, []];
private _loadoutInfo = [_saveStatus param [14, []]] call HC_fnc_mresArray;

/** LICENSE **/
[_pID, _licenseInfo] spawn {
private _pID = _this select 0;
private _licenseInfo = _this select 1;

private _query = format ["DELETE FROM player_licenses WHERE player_id = '%1'", _pID];
[_query,1] call HC_fnc_asyncCall;

sleep 0.5;
private _allLicenses = [];
{
if(!(_x in _allLicenses)) then {
_query = format ["INSERT INTO player_licenses (player_id, license_id) VALUES ('%1', (SELECT id FROM life_licenses WHERE license = '%2'))", _pID, _x];
[_query, 1] call HC_fnc_asyncCall;
_allLicenses pushBack _x;
sleep 0.01;
};
}forEach _licenseInfo;
};

/** SKILL **/
[_pID, _skillInfo] spawn {
private _pID = _this select 0;
private _skillInfo = _this select 1;
_query = format ["SELECT life_skills.skill, player_skills.skill_id, player_skills.xp FROM player_skills LEFT JOIN life_skills ON life_skills.id = player_skills.skill_id WHERE player_skills.player_id = '%1'", _pID];
private _currentSkills = [_query, 2, true] call HC_fnc_asyncCall;
{
private _skillName = _x select 0;
private _skillXP = _x select 1;
private _skillIndex = _currentSkills findIf {(_x select 0) == _skillName};
if(_skillIndex != -1) then {
private _skillArray = (_currentSkills select _skillIndex);
private _skillID = _skillArray select 1;
private _skillOldXP = _skillArray select 2;
if(_skillOldXP != _skillXP) then {
_query = format ["UPDATE player_skills SET xp = '%1' WHERE player_id = '%2' AND skill_id = '%3'", _skillXP, _pID, _skillID];
[_query,1] call HC_fnc_asyncCall;
sleep 0.1;
};
};
}forEach _skillInfo;
};

/** ALIVE **/
_query = format ["UPDATE player_alive SET status = '%1' WHERE player_id = '%2' AND side_id = '%3'", _aliveInfo, _pID, _pSide];
[_query,1] call HC_fnc_asyncCall;

/** MONEY **/
[_pID, _groupSide, _moneyInfo] spawn {
private _pID = _this select 0;
private _groupSide = _this select 1;
private _moneyInfo = _this select 2;
{
_query = format ["UPDATE player_money SET amount = '%1' WHERE player_id = '%2' AND side_id = '%3' AND type = '%4'", _x select 1, _pID, _groupSide, _x select 0];
[_query,1] call HC_fnc_asyncCall;
sleep 0.1;
}forEach _moneyInfo;
};

/** GEAR **/
_query = format ["UPDATE player_gear SET gear = '%1' WHERE player_id = '%2' AND side_id = '%3'", _gearInfo, _pID, _pSide];
[_query,1] call HC_fnc_asyncCall;

/** VIRT **/
[_pID, _pSide, _virtInfo] spawn {
private _pID = _this select 0;
private _pSide = _this select 1;
private _virtInfo = _this select 2;
private _query = format ["DELETE FROM player_virtual_items WHERE player_id = '%1' AND side_id = '%2'", _pID, _pSide];
[_query,1] call HC_fnc_asyncCall;

sleep 0.1;

{
if((_x select 1) > 0) then {
_query = format ["INSERT INTO player_virtual_items (player_id, side_id, item_id, amount) VALUES ('%1', '%2', (SELECT id FROM life_virtual_items WHERE name = '%3'), '%4')", _pID, _pSide, _x select 0, _x select 1];
[_query,1] call HC_fnc_asyncCall;
sleep 0.01;
};
}forEach _virtInfo;
};

/** LOCKER **/
[_pID, _pSide, _lockerInfo] spawn {
private _pID = _this select 0;
private _pSide = _this select 1;
private _lockerInfo = _this select 2;
private _query = format ["DELETE FROM player_locker WHERE player_id = '%1' AND side_id = '%2'", _pID, _pSide];
[_query,1] call HC_fnc_asyncCall;

sleep 0.1;

{
_query = format ["INSERT INTO player_locker (player_id, side_id, classname_id, amount) VALUES ('%1', '%2', (SELECT id FROM life_classnames WHERE classname = '%3'), '%4')", _pID, _pSide, _x select 0, _x select 1];
[_query,1] call HC_fnc_asyncCall;
sleep 0.01;
}forEach _lockerInfo;
};

/** LOADOUT **/
_query = format ["UPDATE player_loadouts SET loadout = '%1' WHERE player_id = '%2' AND side_id = '%3'", _loadoutInfo, _pID, _pSide];
[_query,1] call HC_fnc_asyncCall;
}else {
diag_log format ["Savestatus empty: %1", _cur];
};
}forEach _target;