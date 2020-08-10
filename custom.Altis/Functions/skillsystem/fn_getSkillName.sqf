#include "..\script_macros.hpp"
private _skill = param [0, ""];
private _skillName = localize (format ["STR_Skill_%1", toLower (_skill)]);
_skillName;