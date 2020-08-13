private _unit = param [0, objNull, [objNull]];
private _price = param [1, 0, [0]];
private _location = param [2, "", [""]];
private _marker = param [3, "", [""]];
private _finished = (param [4, 0, [0]]) isEqualTo 31;

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_ubahn"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _handMoney = [getPlayerUID _unit, "cash"] call HC_fnc_getMoney;

if(!(_price isEqualTo 10000)) then {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte die Ubahn nach %4 benutzen, hat allerdings einen anderen Preis angegeben (%5)", name _unit, getPlayerUID _unit, side _unit, _location, _price];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Ubahn Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Ubahn Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, "cash", _price, false] call HC_fnc_handleMoney;

if(_finished) exitWith {
player setDamage 1;
private _msg = format ["Der Spieler %1 (%2 - %3) hat die Ubahn nach %4 benutzt, leider hatte die Ubahn einen Unfall und der Spieler ist gestorben", name _unit, getPlayerUID _unit, side _unit, _location];
["UbahnLog", _msg] call HC_fnc_Log;
};

private _position = (getMarkerPos _marker);
if(_marker == "Flugzeugtraeger_1") then {_position set [2, 23];};

_unit setPos _position;
private _msg = format ["Der Spieler %1 (%2 - %3) hat die Ubahn nach %4 benutzt", name _unit, getPlayerUID _unit, side _unit, _location];
["UbahnLog", _msg] call HC_fnc_Log;