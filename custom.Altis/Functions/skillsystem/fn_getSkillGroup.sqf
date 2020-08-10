#include "..\script_macros.hpp"
private _skill = param [0, ""];
private _return = "character";

if("farm" in _skill) then {_return = "farm"};
if("process" in _skill) then {_return = "process"};
if("craft" in _skill) then {_return = "crafting"};

_return;