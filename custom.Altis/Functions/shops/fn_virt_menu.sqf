#include "..\script_macros.hpp"
private _configName = _this select 0;
private _npc = _this select 1;

if(_configName in ["danger_buy", "danger_sell"] && NIGHT) exitWith {["Der Unterhändler ist nachts deaktiviert.", "Unterhändler"] spawn life_fnc_message;}; 

private _shopCondition = getText (missionConfigFile >> "VirtualShops" >> _configName >> "condition");

if(!(call compile _shopCondition)) exitWith {["Du hast keine Rechte um auf diesen Shop zuzugreifen.", "Item Shop"] spawn life_fnc_message;};

life_shop_type = _configName;
life_shop_npc = _npc;

createDialog "Itemshop";
[] call life_fnc_virt_update;