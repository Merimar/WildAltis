#include "..\script_macros.hpp"
private _unit = param [0, ""];

titleText[format[localize "STR_Civ_KnockedOut", _unit], "PLAIN"];
life_isknocked = true;
player setUnconscious true;
player setUnconscious false;
sleep 15;
player playMoveNow "AmovPercMstpSnonWnonDnon";
life_isknocked = false;
player setVariable ["robbed", false, true];