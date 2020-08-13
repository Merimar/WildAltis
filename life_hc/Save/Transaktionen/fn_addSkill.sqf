private _pID = param [0, ""];
private _pSkill = param [1, ""];
private _pExtra = param [2, 1];
private _resultIndex = 6;

if(_pID == "" || _pSkill == "") exitWith {};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {};

private _skillArray = _saveState select SAVE_STATE_INDEX select _resultIndex;
private _skillIndex = _skillArray findIf {_x select 0 == _pSkill};

private _pGroup = allGroups findIf {_pID in (_x getVariable ["gang_members", []])};
if(_pGroup != -1) then {
_pGroup = allGroups select _pGroup;
private _activeBuffs = _pGroup getVariable ["gang_active_buffs", []];
if((_activeBuffs findIf {_x select 0 == "xp"}) != -1) then {_pExtra = _pExtra * 2;};
};

if(_skillIndex isEqualTo -1) then {
_skillArray pushBack [_pSkill, _pExtra];
}else {
private _skill = _skillArray select _skillIndex select 1;
(_skillArray select _skillIndex) set [1, _skill + _pExtra];
};