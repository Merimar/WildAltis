disableSerialization;
private _display = findDisplay 4100;
private _groupList = _display displayCtrl 4101;
private _skillList = _display displayCtrl 4102;
private _index = lbCurSel _groupList;
lbClear _skillList;

{
private _xSide = _x param [2, [sideUnknown]];
if((_x select 1) isEqualTo _index && (playerSide in _xSide || sideUnknown in _xSide)) then {
_skillList lbAdd (localize (_x select 0));
private _array = (_x select 0) splitString "_";
private _skill = _array select 2;
_skillList lbSetData [(lbSize _skillList)-1, _skill];
};
}forEach [["STR_Skill_stamina", 0], ["STR_Skill_boltcutter", 0], ["STR_Skill_lockpick", 0], ["STR_Skill_heal", 0], ["STR_Skill_repair", 0], ["STR_Skill_search", 0, [west]], ["STR_Skill_impound", 0, [west, independent]], ["STR_Skill_revive", 0], ["STR_Skill_farmFruit", 1], ["STR_Skill_farmGrapes", 1], ["STR_Skill_farmPost", 1], ["STR_Skill_farmSand", 1], ["STR_Skill_farmOre", 1], ["STR_Skill_farmFossil", 1], ["STR_Skill_farmStone", 1], ["STR_Skill_farmDrugs", 1], ["STR_Skill_processGrapes", 2], ["STR_Skill_processSand", 2], ["STR_Skill_processOre", 2], ["STR_Skill_processFossil", 2], ["STR_Skill_processRock", 2], ["STR_Skill_processDrugs", 2]];

_skillList lbSetCurSel 0;