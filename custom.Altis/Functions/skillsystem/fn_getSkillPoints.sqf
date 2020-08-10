#include "..\script_macros.hpp"
private _skill = param [0, ""];
private _skillIndex = SKILL_SYSTEM findIf {_x select 0 == _skill};
if(_skillIndex isEqualTo -1) exitWith {0;};
private _skillPoints = SKILL_SYSTEM select _skillIndex select 1;
_skillPoints;