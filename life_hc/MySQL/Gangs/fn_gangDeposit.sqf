private _unit = param [0, objNull, [objNull]];
private _amount = param [1, 0, [0]];
private _group = group _unit;
private _groupName = _group getVariable ["gang_name", ""];
private _groupBank = _group getVariable ["gang_bank", 0];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_gangDeposit"] call HC_fnc_checkSQLBreak;
if(_isHacker || _amount <= 0 || _groupName == "") exitWith {};

private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _groupName};
if(_gangIndex isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte $%4 auf das Gangkonto von %5 einzahlen, die Gang existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit, [_amount] call HC_fnc_numberSafe, _groupName];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangDeposit Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangDeposit Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _gangID = _gangInformation select 0;
private _gangBank = _gangInformation select 5;
private _playerMoney = [getPlayerUID _unit, side _unit, "bank"] call HC_fnc_getMoney;

if(_gangBank != _groupBank) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte $%4 auf das Gangkonto von %5 einzahlen, die Gang hat aber nicht genug Geld (%6 != %7)", name _unit, getPlayerUID _unit, side _unit, [_amount] call HC_fnc_numberSafe, _groupName, [_groupBank] call HC_fnc_numberSafe, [_gangBank] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangDeposit Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangDeposit Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if(_playerMoney < _amount) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte $%4 auf das Gangkonto von %5 einzahlen, hat aber nicht genug Geld (%6 < %5)", name _unit, getPlayerUID _unit, side _unit, [_amount] call HC_fnc_numberSafe, _groupName, [_playerMoney] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangDeposit Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangDeposit Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, side _unit, "bank", _amount, false] call HC_fnc_handleMoney;
_newAmount = _gangBank + _amount;

_group setVariable ["gang_bank", _newAmount, true];
_gangInformation set [5, _newAmount];

_query = format ["UPDATE gangs SET bank_balance = '%1' WHERE uid='%2' AND deleted_at IS NULL", _newAmount, _gangID];
[_query, 1] call HC_fnc_asyncCall;

private _msg = format ["Der Spieler %1 (%2 - %3) hat %4 auf das Gangkonto der Gang %5 eingezahlt", name _unit, getPlayerUID _unit, side _unit, [_amount] call HC_fnc_numberSafe, _groupName];
["GangLog", _msg] call HC_fnc_Log;