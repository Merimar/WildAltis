#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _givePlayer = param [1, objNull, [objNull]];
private _item = param [2, "", [""]];
private _amount = param [3, 0, [0]];
private _action = param [4, false, [false]];
private _clientRandom = param [5, -1, [0]];

private _isHacker = [[_item], _unit, remoteExecutedOwner, "fn_giveVirt"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _givePlayer || _item == "") exitWith {};

private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");

if(_action) then {
private _pItems = [getPlayerUID _unit, _item] call HC_fnc_countVirt;

if(_pItems < _amount) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte dem Spieler %4 (%5 - %6) %7 %8 geben, hat aber nicht genug Items (%9 < %7)", name _unit, getPlayerUID _unit, side _unit, name _givePlayer, getPlayerUID _givePlayer, side _givePlayer, _amount, _displayName, [_pItems] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Item Give Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Item Give Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, _item, _amount, false] call HC_fnc_handleVirt;
_geheimZahl = [getPlayerUID _givePlayer] call HC_fnc_getGeheimzahl;
private _random = 0;

for "_int" from 0 to 1 step 0 do {
_random = round (random (100000));
_info = [_unit, _givePlayer, _item, _amount];
_str = format ["SERVER_TRADE_%1", _random];
_value = missionNamespace getVariable [_str, []];
if(_value isEqualTo []) exitWith {
missionNamespace setVariable [_str, _info];
};
};

[_unit, _givePlayer, _item, _amount, _geheimZahl, _random, true] remoteExecCall ["life_fnc_receiveItem", _givePlayer];

private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) %7 %8 gegeben", name _unit, getPlayerUID _unit, side _unit, name _givePlayer, getPlayerUID _givePlayer, side _givePlayer, _amount, _displayName];
["GiveLog", _msg] call HC_fnc_Log;
}else {
_str = format ["SERVER_TRADE_%1", _clientRandom];
_value = missionNamespace getVariable [_str, []];
if(_value isEqualTo []) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte dem Spieler %4 (%5 - %6) %7 %8 zurueck geben, es existiert allerdings kein Trade", name _unit, getPlayerUID _unit, side _unit, name _givePlayer, getPlayerUID _givePlayer, side _givePlayer, _amount, _displayName];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Item Trade Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Item Trade Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _xUnit = _value select 0;
private _xGivePlayer = _value select 1;
private _xItem = _value select 2;
private _xAmount = _value select 3;

private _finalAmount = _xAmount - _amount;
private _xItemName = getText (missionConfigFile >> "Items" >> _xItem >> "name");

if(_unit != _xGivePlayer) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte dem Spieler %4 (%5 - %6) %7 %8 zurueck geben, der Spieler hat aber gar keine Items bekommen", name _unit, getPlayerUID _unit, side _unit, name _givePlayer, getPlayerUID _givePlayer, side _givePlayer, _finalAmount, _displayName];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Item Trade Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Item Trade Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if(_givePlayer != _xUnit) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte dem Spieler %4 (%5 - %6) %7 %8 zurueck geben, der Spieler hat aber gar keine Items gegeben", name _unit, getPlayerUID _unit, side _unit, name _givePlayer, getPlayerUID _givePlayer, side _givePlayer, _finalAmount, _displayName];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Item Trade Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Item Trade Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if(_item != _xItem) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte dem Spieler %4 (%5 - %6) %7 %8 zurueck geben, es handelt sich aber um die falschen items (%9 != %8)", name _unit, getPlayerUID _unit, side _unit, name _givePlayer, getPlayerUID _givePlayer, side _givePlayer, _finalAmount, _displayName, _xItemName];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Item Trade Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Item Trade Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if(_finalAmount > _xAmount) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte dem Spieler %4 (%5 - %6) %7 %8 zurueck geben, es sind aber mehr Items als er bekommen hat (%9 > %10)", name _unit, getPlayerUID _unit, side _unit, name _givePlayer, getPlayerUID _givePlayer, side _givePlayer, _amount, _displayName, _finalAmount, _xAmount];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Item Trade Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Item Trade Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

missionNamespace setVariable [_str, []];
[getPlayerUID _unit, _item, _amount, true] call HC_fnc_handleVirt;

if(_finalAmount > 0) then {
[getPlayerUID _givePlayer, _item, _finalAmount, true] call HC_fnc_handleVirt;
_geheimZahl = [getPlayerUID _givePlayer] call HC_fnc_getGeheimzahl;
[_unit, _givePlayer, _item, _finalAmount, _geheimZahl, _clientRandom, false] remoteExecCall ["life_fnc_receiveItem",_givePlayer];
_msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) %7 %8 zurueck gegeben da er nicht genug Platz im Inventar hatte", name _unit, getPlayerUID _unit, side _unit, name _givePlayer, getPlayerUID _givePlayer, side _givePlayer, _finalAmount, _displayName];
["GiveLog", _msg] call HC_fnc_Log;
};
};