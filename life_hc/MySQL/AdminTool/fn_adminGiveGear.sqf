private _unit = param [0, objNull, [objNull]];
private _stripPlayer = param [1, objNull, [objNull, []]];
private _loadOut = param [2, [], [[]]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_adminGiveGear", true] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

if(_stripPlayer isEqualType []) then {
_pls = [];
{
_x setUnitLoadout _loadOut;
_curPlayerGear = [_x] call HC_fnc_getPlayerGear;
[getPlayerUID _x, _curPlayerGear] call HC_fnc_handleInv;
_msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) ein Loadout gegeben (LOADOUT: %7)", name _unit, getPlayerUID _unit, side _unit, name _x, getPlayerUID _x, side _x, str _loadOut];
["AdminLog", _msg] call HC_fnc_Log;
_pls pushBack (name _x);
}forEach _stripPlayer;
[format ["%1 hat mehreren Spielern ein Loadout gegeben (%2)", name _unit, str _pls], false] call HC_fnc_adminMessage;
}else {
_stripPlayer setUnitLoadout _loadOut;
sleep 0.5;
_curPlayerGear = [_stripPlayer] call HC_fnc_getPlayerGear;
[getPlayerUID _stripPlayer, _curPlayerGear] call HC_fnc_handleInv;
_msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) ein Loadout gegeben (LOADOUT: %7)", name _unit, getPlayerUID _unit, side _unit, name _stripPlayer, getPlayerUID _stripPlayer, side _stripPlayer, str _loadOut];
["AdminLog", _msg] call HC_fnc_Log;
[format ["%1 hat %2 ein Loadout gegeben!", name _unit, name _stripPlayer], true] call HC_fnc_adminMessage;
};