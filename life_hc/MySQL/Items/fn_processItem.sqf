#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _type = param [1, "", [""]];
private _vendor = param [2, objNull, [objNull]];
private _relikt = param [3, "", [""]];

private _isHacker = [[_type, _relikt], _unit, remoteExecutedOwner, "fn_processItem"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _vendor || _type == "") exitWith {};

private _config = missionConfigFile >> "CfgFarmRoutes" >> _type;
private _processInput = getArray (_config >> "processInput");
private _processOutput = getArray (_config >> "processOutput");
private _processText = getText (_config >> "processText");
private _processSkill = getText (_config >> "processSkill"); 
private _hasLicense = if(isClass (missionConfigFile >> "Licenses" >> _type)) then {[getPlayerUID _unit, _type] call HC_fnc_hasLicense} else {true};
private _licenseCost = if(!_hasLicense) then {getNumber (missionConfigFile >> "Licenses" >> _type >> "noLicenseCost")} else {0};
private _processAmount = 0;
private _distance = _vendor distance _unit;

if(_distance > 10) then {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item verarbeiten, ist aber zu weit vom Schild entfernt (%4m > 10m)", name _unit, getPlayerUID _unit, side _unit, _distance];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Process Item Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Process Item Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _playerCash = [getPlayerUID _unit, "cash"] call HC_fnc_getMoney;

if(_playerCash < _licenseCost) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item ohne Lizenz verarbeiten, hat aber nicht genug Geld um die Verarbeitungskosten zu zahlen ($%4 < $%5)", name _unit, getPlayerUID _unit, side _unit, [_playerCash] call HC_fnc_numberText, [_licenseCost] call HC_fnc_numberText];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Process Item Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Process Item Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

{
private _inputItem = _x select 0;
private _inputAmount = _x select 1;
private _unitAmount = [getPlayerUID _unit, _inputItem] call HC_fnc_countVirt;
private _couldAmount = floor (_unitAmount / _inputAmount);

if(_couldAmount < _processAmount || _forEachIndex <= 0) then {_processAmount = _couldAmount;};
if(_processAmount <= 0) exitWith {};
}forEach _processInput;

if(_processAmount <= 0) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item verarbeiten, hat aber keine Items zum verarbeiten", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Process Item Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Process Item Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _itemArrayInput = [];
private _itemArrayOutput = [];

{
[getPlayerUID _unit, _x select 0, (_x select 1) * _processAmount, false] call HC_fnc_handleVirt;
private _displayName = getText (missionConfigFile >> "Items" >> _x select 0 >> "name");
_itemArrayInput pushBack (format ["%1 %2", (_x select 1) * _processAmount, _displayName]);
}forEach _processInput;

if(_type != "Relikt") then {
{
[getPlayerUID _unit, _x select 0, (_x select 1) * _processAmount, true] call HC_fnc_handleVirt;
private _displayName = getText (missionConfigFile >> "Items" >> _x select 0 >> "name");
_itemArrayOutput pushBack (format ["%1 %2", (_x select 1) * _processAmount, _displayName]);
}forEach _processOutput;
}else {
[getPlayerUID _unit, _relikt, 1, true] call HC_fnc_handleVirt;
private _displayName = getText (missionConfigFile >> "Items" >> _relikt >> "name");
_itemArrayOutput pushBack (format ["%1 %2", 1, _displayName]);
};

private _msg = format ["Der Spieler %1 (%2 - %3) hat Items verarbeitet (%4 zu %5)", name _unit, getPlayerUID _unit, side _unit, _itemArrayInput joinString ", ", _itemArrayOutput joinString ", "];
["ProcessLog", _msg] call HC_fnc_log;

if(_type == "UranUnstable") then {[_unit] spawn HC_fnc_playerUran;};

if(_type in ["Helium", "Dunkle", "Relikt"]) exitWith {};
[getPlayerUID _unit, _processSkill] call HC_fnc_addSkill;