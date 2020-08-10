#include "..\script_macros.hpp"
if(!(isNull (findDisplay 374000))) exitWith {};
if(isNull CUR_PLAYER_IDC) exitWith {};
if((player distance CUR_PLAYER_IDC) > 4 ) exitWith {};
if(player getVariable ["restrained", false]) exitWith {};

createDialog "Interaction_Menu";
disableSerialization;

CUR_AMOUNT_IDC = 0;

private _createElement = {
disableSerialization;
private _name = _this select 0;
private _action = _this select 1;
private _enable = _this select 2;
private _control = (findDisplay 374000) ctrlCreate ["Trans_Button", -1];
private _yValue = 0.19 + (0.044 * CUR_AMOUNT_IDC);
CUR_AMOUNT_IDC = CUR_AMOUNT_IDC + 1;
_control ctrlSetPosition [0.402031 * safezoneW + safezoneX, _yValue * safezoneH + safezoneY, 0.195937 * safezoneW, 0.033 * safezoneH];
_control ctrlCommit 0;
_control ctrlSetText _name;
_control ctrlCommit 0;
_control buttonSetAction _action;
_control ctrlEnable _enable;
};

private _alive = alive CUR_PLAYER_IDC;
private _escorting = (CUR_PLAYER_IDC getVariable ["Escorting", false]);
private _restrained = (CUR_PLAYER_IDC getVariable ["restrained", false]);
private _savezone = [CUR_PLAYER_IDC] call life_fnc_getSavezone;
private _lockPick = (ITEM_VALUE("lockpick") > 0) || (playerSide isEqualTo west || (playerSide isEqualTo independent && call life_mediclevel >= 3));
private _alcohol = (ITEM_VALUE("bier") > 0) || (ITEM_VALUE("wodka") > 0);
private _drugs = (ITEM_VALUE("kokainP") > 0) || (ITEM_VALUE("heroinP") > 0) || (ITEM_VALUE("marihuanaP") > 0);
private _jailLocations = getArray (missionConfigFile >> "Life_Settings" >> "jail_locations");
private _jail = ({(markerPos _x) distance player < 100} count _jailLocations) > 0;
private _kabelbinder = (ITEM_VALUE("kabelbinder") > 0) || (playerSide isEqualTo west || (playerSide isEqualTo independent && call life_mediclevel >= 3));
private _revive = (!_alive && !(CUR_PLAYER_IDC getVariable["Revive", false]));
private _hinsetzName = if(CUR_PLAYER_IDC getVariable ["execution", false]) then {"Aufstehen"} else {"Hinsetzen"};

//Fesseln
if(playerSide isEqualTo west) then {
if(_restrained) then {["Freilassen", "closeDialog 0; [CUR_PLAYER_IDC] spawn life_fnc_unrestrain;", _alive && _lockPick] call _createElement;}else {["Festnehmen", "closeDialog 0; [] call life_fnc_restrainAction;", _alive && _kabelbinder] call _createElement;};
}else {
if(playerSide isEqualTo independent && call life_mediclevel >= 3) exitWith {
if(_restrained) then {["Freilassen", "closeDialog 0; [CUR_PLAYER_IDC] spawn life_fnc_unrestrain;", _alive && _lockPick] call _createElement;}else {["Festnehmen", "closeDialog 0; [] call life_fnc_restrainAction;", _alive && _kabelbinder] call _createElement;};
};
if(_restrained) then {["Freilassen", "closeDialog 0; [] spawn life_fnc_lockpick;", _alive && _lockPick] call _createElement;}else {["Festnehmen", "closeDialog 0; [] call life_fnc_restrainAction;", _alive && _kabelbinder] call _createElement;};
};

//Ins Auto
["Ins Auto setzen", "closeDialog 0; [CUR_PLAYER_IDC] call life_fnc_putInCar;", _restrained && _alive] call _createElement;

//Abstellen - Eskortieren
if(_escorting) then {
["Abstellen", "closeDialog 0; [] call life_fnc_stopEscorting;", _restrained && _alive] call _createElement;
}else {
["Eskortieren", "closeDialog 0; [CUR_PLAYER_IDC] spawn life_fnc_escortAction;", _restrained && _alive] call _createElement;
};

//Hinsetzten
[_hinsetzName, "closeDialog 0; [CUR_PLAYER_IDC] call life_fnc_executionAction;", (_restrained || {CUR_PLAYER_IDC getVariable ["execution", false]}) && _alive && {!_escorting}] call _createElement;

//Maske aufsetzen
["Maske aufsetzen", "closeDialog 0; [CUR_PLAYER_IDC] call life_fnc_mask;", _restrained && _alive && {!_escorting}] call _createElement;

//Essen und Trinken
["Essen und Trinken geben", "closeDialog 0; [player] remoteExec [""life_fnc_giveFood"", CUR_PLAYER_IDC];", _restrained && _alive && {!_escorting}] call _createElement;

//Kommunikationsmittel entfernen
if(playerSide != independent) then {
["Kommunikationsmittel entfernen", "closeDialog 0; [CUR_PLAYER_IDC] call life_fnc_removeHandy;", _restrained && _alive && {!_escorting}] call _createElement;
};

if(playerSide in [civilian, east]) then {
["Alkoholisieren", "closeDialog 0; [CUR_PLAYER_IDC] call life_fnc_giveAlcohol;", _restrained && _alive && _alcohol && {!_escorting}] call _createElement;
["Auf Drogen setzen", "closeDialog 0; [CUR_PLAYER_IDC] call life_fnc_giveDrugs;", _restrained && _alive && _drugs && {!_escorting}] call _createElement;
};

if(playerSide isEqualTo west) then {
["Waffenschein entfernen", "closeDialog 0; [CUR_PLAYER_IDC, 4] call life_fnc_removeWeapon;", _restrained && _alive && {!_escorting}] call _createElement;
["Führerschein entfernen", "closeDialog 0; [CUR_PLAYER_IDC, 5] call life_fnc_removeWeapon;", _restrained && _alive && {!_escorting}] call _createElement;
["Waffe entfernen", "closeDialog 0; [CUR_PLAYER_IDC, 1] call life_fnc_removeWeapon;", _restrained && _alive && {!_escorting}] call _createElement;
["Weste entfernen", "closeDialog 0; [CUR_PLAYER_IDC, 2] call life_fnc_removeWeapon;", _restrained && _alive && {!_escorting}] call _createElement;
["Kleidung entfernen", "closeDialog 0; [CUR_PLAYER_IDC, 3] call life_fnc_removeWeapon;", _restrained && _alive && {!_escorting}] call _createElement;
["Durchsuchen", "closeDialog 0; [CUR_PLAYER_IDC] spawn life_fnc_searchAction;", _restrained && _alive && {!_escorting}] call _createElement;
["Ins Gefängnis", "closeDialog 0; [CUR_PLAYER_IDC] call life_fnc_jailMenu;", _alive && _jail && {!_escorting}] call _createElement;
["Strafzettel geben", "closeDialog 0; [CUR_PLAYER_IDC] call life_fnc_ticketPlayer;", _alive && {!_escorting}] call _createElement;
["Drogentest", "closeDialog 0; [CUR_PLAYER_IDC] call life_fnc_drugTest;", _alive && {!_escorting}] call _createElement;
["Lizenzen überprüfen", "[player] remoteExecCall [""life_fnc_licenseCheck"", CUR_PLAYER_IDC]; closeDialog 0;", _alive && {!_escorting}] call _createElement;
};

if(playerSide isEqualTo independent) then {
["Drogentest", "closeDialog 0; [CUR_PLAYER_IDC] call life_fnc_drugTest;", _alive && {!_escorting}] call _createElement;
["Drogen verabreichen", "closeDialog 0; [player] remoteExec [""life_fnc_useDrugs"", CUR_PLAYER_IDC];", _alive && {!_escorting}] call _createElement;
["Wiederbeleben", "[CUR_PLAYER_IDC] spawn life_fnc_revivePlayer; closeDialog 0;", _revive] call _createElement;
};