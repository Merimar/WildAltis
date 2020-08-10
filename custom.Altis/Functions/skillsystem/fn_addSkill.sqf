#include "..\script_macros.hpp"
private _skill = param [0, ""];
private _extra = param [1, 1];
private _skillIndex = SKILL_SYSTEM findIf {_x select 0 == _skill};
private _skillBefore = [_skill] call life_fnc_getSkillLevel;
_extra = if(["xp"] call life_fnc_isBuffOn) then {_extra * 2} else {_extra};

if(_skillIndex isEqualTo -1) then {
SKILL_SYSTEM pushBack [_skill, _extra];
}else {
private _skill = SKILL_SYSTEM select _skillIndex select 1;
(SKILL_SYSTEM select _skillIndex) set [1, _skill + _extra];
};

private _skillAfter = [_skill] call life_fnc_getSkillLevel;

if(_skillBefore != _skillAfter) then {
[format["<t size='0.75' color='#F0B603' align='left'>%1 Levelaufstieg!</t><br/><t size='0.60' color='#FFFFFF' align='left'>Neues Level: %2</t>", [_skill] call life_fnc_getSkillName, [_skillAfter] call life_fnc_numberText], [safeZoneX + safeZoneW - 0.8, 0.50],[safeZoneY + safeZoneH - 0.8, 0.7], 3, 0.25] spawn BIS_fnc_dynamicText;
playSound "level";
}else {
[format["<t size='0.75' color='#F0B603' align='left'>%1 Skillstufe %2</t><br/><t size='0.60' color='#FFFFFF' align='left'>Fortschritt: %3/%4</t>", [_skill] call life_fnc_getSkillName, [_skillAfter] call life_fnc_numberText, [_skill] call life_fnc_getSkillPoints, [_skill] call life_fnc_getSkillPointsNeeded], [safeZoneX + safeZoneW - 0.8, 0.50],[safeZoneY + safeZoneH - 0.8, 0.7], 3, 0.25] spawn BIS_fnc_dynamicText;
};