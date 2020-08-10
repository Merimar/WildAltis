_message = _this select 0;
_clear = _this select 1;
_id = player addAction[format["<t color='#00FF00'>%1</t>", _message],{

_unit = _this select 1;
_clearPInv = _this select 3;
_id = _unit getVariable ["event_id", 0];

_unit removeAction _id;

if(_clearPInv) then {
removeAllWeapons _unit;
{_unit removeMagazine _x;} forEach (magazines _unit);
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeGoggles _unit;
removeHeadGear _unit;

{
_unit unassignItem _x;
_unit removeItem _x;
}forEach (assignedItems _unit);

if (hmd _unit != "") then {
_unit unlinkItem (hmd _unit);
};
};

[player] remoteExec ["HC_fnc_joinEvent", HC_LIFE];
_unit setVariable ["event_join", true, true];

},_clear,2,false,false,"",'(bank_obj getVariable ["event_scroll", false]) && (!(bank_obj getVariable ["event_start", false]))'];

player setVariable ["event_id", _id, true];

