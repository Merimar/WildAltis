#include "..\..\script_macros.hpp"
disableSerialization;
private _index = lbCurSel 4351;

if(_index isEqualTo -1) exitWith {["", "Du hast nichts augewählt"] spawn life_fnc_message;};
private _item = lbData [4351, _index];
private _amount = parseNumber (ctrlText 4354);

if(_item == "uranUnstableP") exitWith {["Das Item kann nur einem Fachmann übergeben werden.", "Unstable Uran"] spawn life_fnc_message;};

if(_amount <= 0) exitWith {["", "Wieviele Items möchtest du entfernen?"] spawn life_fnc_message;};
private _isIllegal = (getNumber (missionConfigFile >> "Items" >> _item >> "illegal")) isEqualTo 1;
private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");

if(_isIllegal && (([west, visiblePosition player, 100] call life_fnc_nearUnits) && playerSide != west)) exitWith {["Du kannst keine Items löschen solange sich Polizisten in deiner Nähe befinden", "Polizisten in der Nähe"] spawn life_fnc_message;};

if(!(isNull objectParent player)) exitWith {["Du kannst keine Items löschen solange du dich in einem Fahrzeug befindest", "Nicht in einem Fahrzeug"] spawn life_fnc_message;};
if(!([false, _item, _amount] call life_fnc_handleInv)) exitWith {["Du kannst nicht mehr Items löschen als du wirklich besitzt", "Zuwenig Items"] spawn life_fnc_message;};

[format ["Du hast %1 %2 aus deinem Inventar entfernt", _amount, _displayName], "Items gelöscht"] spawn life_fnc_message;
[] call life_fnc_openZInv;
[player, _item, _amount] remoteExec ["HC_fnc_removeItem", HC_LIFE];