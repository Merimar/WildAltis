if(call life_adminlevel < 2) exitWith {};

private _index = lbCurSel 3801;

if(_index isEqualTo -1) exitWith {};
private _unit = call compile format ["%1", lbData [3801, _index]];
if(isNull _unit || {_unit isEqualTo player}) exitWith {};

_unit switchCamera "EXTERNAL";
[player, _unit, true, true] remoteExec ["HC_fnc_copSepctate", HC_LIFE];

if(player getVariable ["Spectating", false]) exitWith {};

player allowDamage false;
[format["Du beobachtest nun %1. Mit F10 kannst du dieses Menu wieder verlassen", name _unit], "Spectate"] spawn life_fnc_message;

SPECTATE_EH = (findDisplay 46) displayAddEventHandler ["KeyDown", {
private _key = _this select 1;
if(_key != 68) exitWith {};

player allowDamage true;
[player, objNull, false, true] remoteExec ["HC_fnc_copSpectate", HC_LIFE];
player switchCamera "EXTERNAL";
(findDisplay 46) displayRemoveEventHandler ['KeyDown', SPECTATE_EH];
false;
}];