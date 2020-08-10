#include "..\script_macros.hpp"
disableSerialization;
private _stationen = [["Kavala", "Spawn_uBahn_Kavala", civilian], ["Athira", "Spawn_uBahn_Athira", civilian], ["Pyrgos", "civ_spawn_2", civilian], ["Sofia", "Spawn_uBahn_Sofia", civilian], ["Syrta", "Spawn_uBahn_Syrta", civilian], ["Rebelen HQ", "Spawn_uBahn_RebHQ", civilian], ["Rebellen Außenposten", "Spawn_uBahn_RebA", civilian], ["Flugzeugtraeger", "Spawn_uBahn_Carrier", civilian], ["Kavala HQ", "Spawn_uBahn_Kavala_Cop", west], ["Athira HQ", "Spawn_uBahn_Athira_Cop", west], ["Pyrgos HQ", "Spawn_uBahn_Pyrgos_Cop", west], ["Highway patrol", "Spawn_uBahn_HWP_Cop", west], ["Gefängnis", "Spawn_uBahn_Jail_Cop", west], ["Syrta HQ", "Spawn_uBahn_Syrta_Cop", west], ["Telos HQ", "Spawn_uBahn_Telos", west], ["Kavala HQ", "Spawn_uBahn_Kavala_KGJ", east], ["Kavala", "Spawn_uBahn_Kavala", east], ["Athira", "Spawn_uBahn_Athira", east], ["Pyrgos", "Spawn_uBahn_Pyrgos", east], ["Sofia", "Spawn_uBahn_Sofia", east], ["Syrta", "Spawn_uBahn_Syrta", east], ["Kavala HQ", "Spawn_uBahn_Kavala_Medic", independent], ["Panagia HQ", "Spawn_uBahn_Panagia_Medic", independent], ["Flughafen", "Spawn_uBahn_Flughafen_Medic", independent]];

if(isNull findDisplay 3600) then {createDialog "Ubahn";};
private _display = findDisplay 3600;
private _spawnList = _display displayCtrl 3601;
lbClear _spawnList;

{
private _faction = _x select 0;
private _spawns = _x select 1;

if(_faction isEqualTo playerSide) then {
{
private _displayName = getText (missionConfigFile >> "CfgSpawnPoints" >> _x >> "displayName");
private _icon = getText (missionConfigFile >> "CfgSpawnPoints" >> _x >> "icon");
private _marker = getText (missionConfigFile >> "CfgSpawnPoints" >> _x >> "spawnMarker");

_spawnList lbAdd _displayName;
_spawnList lbSetData [(lbSize _spawnList)-1, _marker];
_spawnList lbSetPicture [(lbSize _spawnList)-1, _icon];
}forEach _spawns;
};
}forEach 
[[civilian, ["Kavala", "Athira", "Pyrgos", "Sofia", "Neochori", "Syrta", "Flugzeugtraeger", "HQ", "Aussenposten"]],
[east, ["Kavala", "Athira", "Pyrgos", "Sofia", "Neochori", "Syrta", "Flugzeugtraeger", "HQ", "Aussenposten"]],
[west, ["copTelos", "copKavala", "copPyrgos", "copSagonisi", "copAthira", "copSyrta", "copHWP", "copJail", "copCheckpoint", "copMarktHQ"]],
[independent, ["medKavala", "medAir", "medPanagia", "medAgios", "medKavalaOutpost", "medHafen"]]];