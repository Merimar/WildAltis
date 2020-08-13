private _unit = param [0, objNull, [objNull]];
private _curSel = param [1, 0, [0]];
private _playerPrice = param [2, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_getLoadout"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _loadout = ([_pID, _curSel] call HC_fnc_getLoadouts) select 0;
if(count _loadout isEqualTo 0) exitWith {};
private _checkPrice = [_loadout, _pSide] call life_fnc_getLoadoutPrice;
private _bankMoney = [_pID, "bank"] call HC_fnc_getMoney;
private _geheimZahl = [_pID] call HC_fnc_getGeheimzahl;

if(_playerPrice != _checkPrice) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) hat versucht ein Loadout billig zu laden (%4 < %5)", name _unit, getPlayerUID _unit, side _unit, [_checkPrice] call HC_fnc_numberSafe, [_playerPrice] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "LoadoutGet Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein LoadoutGet Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if(_bankMoney < _checkPrice) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Loadout für %4 kaufen, hat aber nur %5 auf der Bank", name _unit, getPlayerUID _unit, side _unit, [_checkPrice] call HC_fnc_numberSafe, [_bankMoney] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "LoadoutGet Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein LoadoutGet Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[_pID, "bank", _checkPrice, false] call HC_fnc_handleMoney;
[_loadout, _curSel, _geheimZahl, _checkPrice] remoteExec ["life_fnc_loadLoadout", _unit];

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Loadout geladen (POSITION: %4 PREIS: %5 LOADOUT: %6)", name _unit, getPlayerUID _unit, side _unit, mapGridPosition _unit, [_playerPrice] call HC_fnc_numberSafe, _loadout];
["LoadoutLog", _msg] call HC_fnc_Log;

sleep 2;
private _gear = [_unit] call HC_fnc_getPlayerGear;
[_pID, _gear] call HC_fnc_handleInv;