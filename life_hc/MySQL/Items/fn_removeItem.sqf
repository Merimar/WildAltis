#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _item = param [1, "", [""]];
private _amount = param [2, 0, [0]];

private _isHacker = [[_item], _unit, remoteExecutedOwner, "fn_removeItem"] call HC_fnc_checkSQLBreak;
if(_isHacker || _item == "") exitWith {};

private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");
private _pItems = [getPlayerUID _unit, side _unit, _item] call HC_fnc_countVirt;

if(_pItems < _amount) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item (%4 %5) löschen, hat aber nicht genug Items (%6 < %4)", name _unit, getPlayerUID _unit, side _unit, _amount, _displayName, [_pItems] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Item Remove Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Item Remove Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, side _unit, _item, _amount, false] call HC_fnc_handleVirt;

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Item gelöscht (%4 %5)", name _unit, getPlayerUID _unit, side _unit, _amount, _displayName];
["RemoveLog", _msg] call HC_fnc_Log;