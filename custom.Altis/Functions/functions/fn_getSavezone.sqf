_return = false;
_unit = _this select 0;

if(((getMarkerPos "savezone_1") distance _unit) < 350) then {
_return = true;
};

if(((getMarkerPos "savezone_spawn") distance _unit) < 350) then {
_return = true;
};

if(((getMarkerPos "savezone_5") distance _unit) < 300) then {
_return = true;
};

if(((getMarkerPos "savezone_7") distance _unit) < 300) then {
_return = true;
};

_return;