#include "..\..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 1200;
private _indexVehicles = lbCurSel 1201;
private _indexPlayers = lbCurSel 1202;

if(_indexVehicles isEqualTo -1 || _indexPlayers isEqualTo -1) exitWith {["Du hast keinen Spieler oder Fahrzeug ausgewählt.", "Schlüsselbund"] spawn life_fnc_message;};

private _vehicle = life_vehicles param [lbValue [1201, _indexVehicles], objNull];
if(isNull _vehicle) exitWith {["Das Fahrzeug das du ausgewählt hast existiert nicht mehr.", "Schlüsselbund"] spawn life_fnc_message;};
if((time - life_action_delay) < 1) exitWith {playSound "error";};
life_action_delay = time;

private _displayName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

if((lbText [1202, _indexPlayers]) == "Schlüssel an Gangmitglieder in der Nähe geben") exitWith {
if(((group player) getVariable ["gang_name", ""]) == "") exitWith {["Du musst in einer Gang sein, um den Schlüssel an deine Gangmitglieder geben zu können", "Schlüsselbund"] spawn life_fnc_message;};
[player, _vehicle, objNull, true] remoteExec ["HC_fnc_giveKey", HC_LIFE];
[format ["Du hast den Schlüssel für deinen %1 an alle Gangmitglieder in deiner Umgebung gegeben", _displayName], "Schlüsselbund"] spawn life_fnc_message;
};

private _unit = call compile format["%1", lbData [1202, _indexPlayers]];
if(isNull _unit || {_unit distance player > 15}) exitWith {["Der Spieler hat sich zu weit entfernt.", "Schlüsselbund"] spawn life_fnc_message;};
if(((_vehicle getVariable ["vehicle_info_owners", []]) findIf {_x select 0 == getPlayerUID _unit}) >= 0) exitWith {["Der Spieler hat bereits den Schlüssel für dieses Fahrzeug.", "Schlüsselbund"] spawn life_fnc_message;};

[player, _vehicle, _unit] remoteExec ["HC_fnc_giveKey", HC_LIFE];
[format ["Du hast %1 den Schlüssel für deinen %2 gegeben", name _unit, _displayName], "Schlüsselbund"] spawn life_fnc_message;