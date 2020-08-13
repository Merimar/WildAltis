private _unit = param [0, objNull, [objNull]];

if(isNull _unit) exitWith {};
if(player distance (getMarkerPos "jail_marker") < 60) exitWith {};
if(player getVariable ["knast", false]) exitWith {};
if(animationState _unit == "AovrPercMrunSrasWrflDf") exitWith {};
if(animationState _unit == "amovpercmsprsnonwnondf_amovppnemstpsnonwnondnon") exitWith {};
private _velocity = velocity _unit;

if(local _unit) then {
	private _v1 = 3.82;
	private _v2 = .4;
	private _dir = direction player;
	private _vel = velocity _unit;
	_unit setVelocity [(_vel select 0)+(sin _dir*_v2),(_vel select 1)+(cos _dir*_v2),(_vel select 2)+_v1];
};

private _anim = animationState _unit;
_unit switchMove "AovrPercMrunSrasWrflDf";

if(local _unit) then {
	waitUntil{animationState _unit != "AovrPercMrunSrasWrflDf"};
	_unit switchMove _anim;
};