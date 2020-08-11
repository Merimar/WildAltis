#include "..\script_macros.hpp"
private _unit = param [0, ""];

titleText[format[localize "STR_Civ_KnockedOut", _unit], "PLAIN"];
life_isknocked = true;
player setUnconscious true;
sleep 1;
player setUnconscious false;
sleep 14;
player playMoveNow "AmovPercMstpSnonWnonDnon";
life_isknocked = false;
player setVariable ["robbed", false, true];