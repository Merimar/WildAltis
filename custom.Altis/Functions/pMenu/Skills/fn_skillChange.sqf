disableSerialization;
private _display = findDisplay 4100;
private _skillList = _display displayCtrl 4102;
private _levelChange = _display displayCtrl 4103;
private _pointChange = _display displayCtrl 4104;
private _pointNeededChange = _display displayCtrl 4105;
private _advantageChange = _display displayCtrl 4106;
private _advantageCurrentChange = _display displayCtrl 4107;
private _advantageNextChange = _display displayCtrl 4108;

private _skill = _skillList lbData (lbCurSel _skillList);
private _curLvl = [_skill] call life_fnc_getSkillLevel;
private _curPoints = [_skill] call life_fnc_getSkillPoints;
private _pointsNeeded = [_skill] call life_fnc_getSkillPointsNeeded;
private _maxLevel = [_skill] call life_fnc_getSkillMaxLevel;

private _maxAd = [_skill, _maxLevel, true] call life_fnc_getSkillDescription;
private _curAd = [_skill, _curLvl] call life_fnc_getSkillDescription;
private _nextAd = [_skill, _curLvl + 1] call life_fnc_getSkillDescription;

_levelChange ctrlSetText (format ["%1", _curLvl]);
_pointChange ctrlSetText ([_curPoints] call life_fnc_numberText);
_pointNeededChange ctrlSetText ([_pointsNeeded] call life_fnc_numberText);
_advantageChange ctrlSetText _maxAd;

_advantageCurrentChange ctrlSetStructuredText parseText _curAd;
_advantageNextChange ctrlSetStructuredText parseText _nextAd;