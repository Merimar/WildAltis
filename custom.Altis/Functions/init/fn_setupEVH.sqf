/*
    File: fn_setupEVH.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master eventhandler file
*/
player addEventHandler["Killed", life_fnc_onPlayerKilled];
player addEventHandler["handleDamage", life_fnc_handleDamage];
player addEventHandler["Respawn", life_fnc_onPlayerRespawn];
player addEventHandler["Take", life_fnc_onTakeItem];
player addEventHandler["Put", life_fnc_onPutItem];
player addEventHandler["Fired", life_fnc_onFired];
player addEventHandler["InventoryClosed", life_fnc_inventoryClosed];
player addEventHandler["InventoryOpened", life_fnc_inventoryOpened];
player addEventHandler["Reloaded", life_fnc_weaponReloaded];
player addEventHandler["GetInMan", life_fnc_getInMan];
player addEventHandler["GetOutMan", life_fnc_getOutMan];

[ missionNamespace, "arsenalClosed", {
["Dein Gear wurde automatisch mit dem Server synchronisiert", false, "slow"] call life_fnc_showNotification;
player setVariable ["Arsenal", false, true];
[player] remoteExec ["HC_fnc_saveArsenal", HC_LIFE];
[] call life_fnc_updateCom;
}] call BIS_fnc_addScriptedEventHandler;