private _uID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _pSkill = param [2, ""];
private _pExtra = param [3, 1];
private _resultIndex = 6;

if("" in [_uID,_pSkill] || _pSide isEqualTo sideUnknown) exitWith {};

private _pIndex = [_uID, _pSide] call HC_fnc_searchArray;
if(_pIndex isEqualTo -1) exitWith {};

private _skillArray = SAVE_ARRAY select _pIndex select SAVE_STATE_INDEX select _resultIndex;
private _skillIndex = _skillArray findIf {_x select 0 == _pSkill};

private _pGroup = allGroups findIf {_uID in (_x getVariable ["gang_members", []])};
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