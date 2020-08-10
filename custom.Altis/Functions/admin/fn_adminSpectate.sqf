if(call life_adminlevel < 2) exitWith {};

private _index = lbCurSel 3801;

if(_index isEqualTo -1) exitWith {};
private _unit = call compile format ["%1", lbData [3801, _index]];
if(isNull _unit || {_unit isEqualTo player}) exitWith {};

_unit switchCamera "INTERNAL";
[player, _unit, true] remoteExec ["HC_fnc_adminSpectate", HC_LIFE];
player allowDamage false;

[format["Du beobachtest nun %1. Mit F10 kannst du dieses Menu wieder verlassen", name _unit], "Spectate"] spawn life_fnc_message;

SPECTATE_EH = (findDisplay 46) displayAddEventHandler ["KeyDown",{
private _key = _this select 1;
if(_key != 68) exitWith {};

player allowDamage true;
player switchCamera "INTERNAL";
[player, objNull, false] remoteExec ["HC_fnc_adminSpectate", HC_LIFE];
(findDisplay 46) displayRemoveEventHandler ['KeyDown', SPECTATE_EH];

false;
}];