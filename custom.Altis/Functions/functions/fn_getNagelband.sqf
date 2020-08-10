_side = format ["%1", playerSide];
_return = false;
{
_label = _x getVariable ["nagelband", objNull];
if(_label == profileName) exitWith {_return = true;};
if(_label == _side) exitWith {_return = true;};
}forEach (nearestObjects[getPos player,["Land_Razorwire_F"],8]);

if(player getVariable ["nagelbander", false]) then {
_return = false;
};

_return;



