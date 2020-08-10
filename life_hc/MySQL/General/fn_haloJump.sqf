private _unit = param [0, objNull, [objNull]];
private _pos = param [1, [0, 0, 0], [[]]];
private _haloPrice = getNumber (missionConfigFile >> "Life_Settings" >> "halo_jump_price");
private _haloJumpHeight = getNumber (missionConfigFile >> "Life_Settings" >> "halo_jump_height");

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_haloJump"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _money = [getPlayerUID _unit, side _unit, "bank"] call HC_fnc_getMoney;

if(_money < _haloPrice) exitWith {
private _reason1 = format ["Der Spieler %1 (%2 - %3) wollte halojumpen hat aber keine $100.000", name _unit, getPlayerUID _unit, side _unit];
private _reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Halojump Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Halojump Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

_pos set [2, _haloJumpHeight];

[getPlayerUID _unit, side _unit, "bank", _haloPrice, false] call HC_fnc_handleMoney;

private _msg = format ["Der Spieler %1 (%2 - %3) hat einen Halojump nach: %4 gemacht", name _unit, getPlayerUID _unit, side _unit, _pos];
["HaloLog", _msg] call HC_fnc_Log;

_unit setPos _pos;