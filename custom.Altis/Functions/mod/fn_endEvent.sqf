#include "..\script_macros.hpp"

private _message = ctrlText 120004;
[_message, "Neue Eventnachricht"] remoteExec ["life_fnc_message", -2];
bank_obj setVariable ["event_start", false, true];

[] call life_fnc_disableScrollrad;

{_x setVariable ["event_join", false, true];}foreach playableUnits;