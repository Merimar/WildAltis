#include "..\script_macros.hpp"
private _geheimZahl = param [0, -1, [0]];
private _action = param [1, 0, [0]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

//Radio und GPS
if(_action isEqualTo 0) then {
if("ItemRadio" in (assignedItems player)) then {
player unassignItem "ItemRadio";
player removeItem "ItemRadio";
};

if("ItemGPS" in (assignedItems player)) then {
player unassignItem "ItemGPS";
player removeItem "ItemGPS";
};

if("ItemGPS" in (assignedItems player)) then {
player unassignItem "ItemGPS";
player removeItem "ItemGPS";
};

if("ItemMap" in (assignedItems player)) then {
player unassignItem "ItemMap";
player removeItem "ItemMap";
};

//player setVariable ["Communication", [false, false], true];
["Dir wurden deine Kommunikationsmittel weggenommen", "Kommunikationsmittel"] spawn life_fnc_message;
};

//Waffe
if(_action isEqualTo 1) then {
player removeWeapon (primaryWeapon player);
player removeWeapon (handgunWeapon player);
["Dir wurden deine Waffen weggenommen", "Waffen entfernt"] spawn life_fnc_message;
};

if(_action isEqualTo 4) then {
private _index = LICENSES find "gun";
if(_index != -1) then {LICENSES deleteAt _index;};
["Dir wurde dein Waffenschein entzogen", "Waffenschein entfernt"] spawn life_fnc_message;
};

if(_action isEqualTo 5) then {
private _index = LICENSES find "driver";
if(_index != -1) then {LICENSES deleteAt _index;};
["Dir wurde dein Führerschein entzogen", "Führerschein entfernt"] spawn life_fnc_message;
};