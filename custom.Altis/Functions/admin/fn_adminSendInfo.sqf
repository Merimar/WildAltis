private _unit = param [0, objNull, [objNull]];

if(isNull _unit) exitWith {};

private _pSide = switch (playerSide) do {case civilian : {"Zivilist"};case east : {"Rebell"};case west : {"Polizist"};case independent : {"Feuerwehr"};};
private _gangName = (group player) getVariable ["gang_name", "In keiner Gang"];

private _bank = [BANK] call life_fnc_numberText;
private _cash = [CASH] call life_fnc_numberText;
private _firstJoinDate = format ["%1.%2.%3", life_first_join_date select 2, life_first_join_date select 1, life_first_join_date select 0];
private _playtime = format["%1 Stunden", [life_playtime, "MM:SS"] call BIS_fnc_secondsToString];

private _waffe = if((primaryWeapon player) != "") then {getText(configFile >> "CfgWeapons" >> (primaryWeapon player) >> "displayName")} else {"Keine Waffe"};
private _helm = if((headgear player) != "") then {getText(configFile >> "CfgWeapons" >> (headgear player) >> "displayName")} else {"Kein Helm"};
private _uniform = if((uniform player) != "") then {getText(configFile >> "CfgWeapons" >> (uniform player) >> "displayName")} else {"Keine Uniform"};
private _vest = if((vest player) != "") then {getText(configFile >> "CfgWeapons" >> (vest player) >> "displayName")} else {"Keine Weste"};
private _backpack = if((backpack player) != "") then {getText(configFile >> "CfgVehicles" >> (backpack player) >> "displayName")} else {"Kein Rucksack"};

private _licenses = [];
{
_licenses pushBack (localize getText (missionConfigFile >> "Licenses" >> _x >> "displayName"));
}forEach LICENSES;

private _vehicle = if(isNull objectParent player) then {"Kein Fahrzeug"} else {getText (configFile >> "CfgVehicles" >> typeOf objectParent player >> "displayName")};
private _information = [["Name", profileName, false], ["Player ID", getPlayerUID player, true], ["Fraktion", _pSide, false], ["Gang", _gangName, false], ["Bank", _bank, true], ["Cash", _cash, true], ["Joindate", _firstJoinDate, true], ["Playtime", _playtime, true], ["UID", life_uid, true], ["Admin Level", call life_adminlevel, true], ["Medic Level", call life_mediclevel, true], ["Cop Level", call life_coplevel, true], ["Donator Level", call life_donorlevel, true], ["Waffe", _waffe, false], ["Helm", _helm, false], ["Uniform", _uniform, false], ["Rucksack", _backpack, false], ["Weste", _vest, false], ["Fahrzeug", _vehicle, false], ["Lizenzen", _licenses joinString ", ", false]] call life_fnc_getVehicleDescription;

[_information, "Spieler Information", 15] remoteExec ["life_fnc_message", _unit];