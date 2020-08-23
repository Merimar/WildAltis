#include "..\script_macros.hpp"
private _loadout = _this select 0;
private _curSel = _this select 1;
private _geheimZahl = _this select 2;
private _price = _this select 3;

if(count _loadout isEqualTo 0) exitWith {};
if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};
if(_price > BANK) exitWith {["Du hast nicht genug Geld auf dem Konto", true, "slow"] call life_fnc_showNotification;};
BANK = BANK - _price;

private _handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player setUnitLoadout _loadout;

[format ["Loadout Nr. %1 geladen.", _curSel], "Loadout geladen"] spawn life_fnc_message;
[] call life_fnc_updateCom;