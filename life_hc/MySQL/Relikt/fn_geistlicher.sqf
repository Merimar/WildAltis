private _unit = param [0, objNull, [objNull]];
private _relikt = param [1, "", [""]];

private _isHacker = [[_relikt], _unit, remoteExecutedOwner, "fn_geistlicher"] call HC_fnc_checkSQLBreak;
if(_isHacker || _relikt == "") exitWith {};

private _reliktCount = [getPlayerUID _unit, _relikt] call HC_fnc_countVirt;

if(_reliktCount <= 0) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte einen Knochen verkaufen, hat aber keinen Knochen", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Grabräuber Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Grabräuber Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _geheimZahl = [getPlayerUID _unit] call HC_fnc_getGeheimzahl;
private _random = round (random (100)); 
private _multiplier = 1;

if(_random > 0) then {_multiplier = 0;};
if(_random > 30) then {_multiplier = 1;};
if(_random > 40) then {_multiplier = 2;};
if(_random > 60) then {_multiplier = 3;};
if(_random > 70) then {_multiplier = 4;};
if(_random > 80) then {_multiplier = 5;};
if(_random > 85) then {_multiplier = 6;};
if(_random > 90) then {_multiplier = 7;};
if(_random > 96) then {_multiplier = 8;};
if(_random > 98) then {_multiplier = 9;};

private _randomMoney = _multiplier * 100000;
_randomMoney = round (_randomMoney + random [0, 50000, 100000]);

[getPlayerUID _unit, "cash", _randomMoney, true] call HC_fnc_handleMoney;
[getPlayerUID _unit, _relikt, 1, false] call HC_fnc_handleVirt;
[_randomMoney, _geheimZahl] remoteExec ["life_fnc_receiveGeistlicher", _unit];
private _reliktName = getText (missionConfigFile >> "Items" >> _relikt >> "name");

private _msg = format ["Der Spieler %1 (%2 - %3) hat einen Knochen verkauft (KNOCHEN: %4 WERT: %5)", name _unit, getPlayerUID _unit, side _unit, _reliktName, [_randomMoney] call HC_fnc_numberSafe];
["KnochenLog", _msg] call HC_fnc_Log;