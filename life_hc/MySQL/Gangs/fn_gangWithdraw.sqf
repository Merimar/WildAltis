private _unit = param [0, objNull, [objNull]];
private _amount = param [1, 0, [0]];
private _group = group _unit;
private _groupName = _group getVariable ["gang_name", ""];
private _groupBank = _group getVariable ["gang_bank", 0];

private _isHacker = [[_groupName], _unit, remoteExecutedOwner, "fn_gangWithdraw"] call HC_fnc_checkSQLBreak;
if(_isHacker || _amount <= 0 || _groupName == "") exitWith {};

private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _groupName};

if(_gangIndex isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte $%4 von dem Gangkonto von %5 abheben, die Gang existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit, [_amount] call HC_fnc_numberSafe, _groupName];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangWithdraw Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangWithdraw Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _gangID = _gangInformation select 0;
private _gangBank = _gangInformation select 5;

if(_gangBank != _groupBank || _gangBank < _amount) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte $%4 von dem Gangkonto von %5 abheben, die Gang hat aber nicht genug Geld (%6 != %7)", name _unit, getPlayerUID _unit, side _unit, [_amount] call HC_fnc_numberSafe, _groupName, [_groupBank] call HC_fnc_numberSafe, [_gangBank] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangWithdraw Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangWithdraw Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, "bank", _amount, true] call HC_fnc_handleMoney;
private _newAmount = _gangBank - _amount;

_group setVariable ["gang_bank", _newAmount, true];
_gangInformation set [5, _newAmount];

_query = format ["UPDATE gangs SET bank_balance = '%1' WHERE uid='%2'", _newAmount, _gangID];
[_query, 1] call HC_fnc_asyncCall;

private _msg = format ["Der Spieler %1 (%2 - %3) hat sich %4 vom Gangkonto der Gang %5 ausgezahlt", name _unit, getPlayerUID _unit, side _unit, [_amount] call HC_fnc_numberSafe, _groupName];
["GangLog", _msg] call HC_fnc_Log;