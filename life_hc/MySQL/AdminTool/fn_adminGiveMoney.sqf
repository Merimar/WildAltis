private _player = param [0, objNull, [objNull]];
private _money = param [1, 0, [0]];
private _unit = param [2, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_adminGiveMoney", true] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _geheimZahl = [getPlayerUID _player, side _player] call HC_fnc_getGeheimzahl;
[getPlayerUID _player, side _player, "bank", _money, true] call HC_fnc_handleMoney;
[_player, _money, _unit, true, false, _geheimZahl] remoteExec ["life_fnc_receiveMoney",_player];

[format ["%1 hat %2 $%3 gegeben!", name _unit, name _player, [_money] call HC_fnc_numberSafe], true] call HC_fnc_adminMessage;
private _msg = format ["Der Spieler %1 (%2 - %3) hat %4 (%5 - %6) %7 gegeben", name _unit, getPlayerUID _unit, side _unit, name _player, getPlayerUID _player, side _player, [_money] call HC_fnc_numberSafe];
["AdminLog", _msg] call HC_fnc_Log;