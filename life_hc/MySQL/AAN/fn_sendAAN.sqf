private _unit = param [0, objNull, [objNull]];
private _message = param [1, "", [""]];
private _header = param [2, "", [""]];

private _isHacker = [[_message, _header], _unit, remoteExecutedOwner, "fn_sendAAN"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _money = [getPlayerUID _unit, side _unit, "cash"] call HC_fnc_getMoney;
if(_money < 100000) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte eine AAN News Nachricht schreiben, hat aber nicht genug Geld", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "AAN Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein AAN Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if(AAN_NEWS) exitWith {};
[getPlayerUID _unit, side _unit, "cash", 100000, false] call HC_fnc_handleMoney;
[name _unit, _message, _header] remoteExec ["life_fnc_receiveAAN", -2];

private _msg = format ["Der Spieler %1 (%2 - %3) hat eine AAN News Nachricht geschrieben: %4 - %5", name _unit, getPlayerUID _unit, side _unit, _message, _header];
["AANLog", _msg] call HC_fnc_Log;

AAN_NEWS = true;
publicVariable "AAN_NEWS";

sleep 40;

AAN_NEWS = false;
publicVariable "AAN_NEWS";