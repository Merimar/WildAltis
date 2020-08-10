disableSerialization;
private _criminal = param [0, objNull];
private _display = findDisplay 2000;

if(isNull _criminal || isNull _display || playerSide != west || {_criminal distance player > 10 || (side _criminal) in [west, independent]}) exitWith {};
private _jailLocations = getArray (missionConfigFile >> "Life_Settings" >> "jail_locations");
private _countCheck = _jailLocations select {(markerPos _x) distance player < 100};
if(count _countCheck <= 0) exitWith {["Du bist nicht in der Nähe eines HQ's", "Gefängnis"] spawn life_fnc_message;};
private _time = parseNumber (ctrlText 2002);

if(_time < 10 || _time > 60) exitWith {["Du kannst einen Spieler min. 10 Minuten und max. 60 Minuten in Gefängnis stecken", "Gefängnis"] spawn life_fnc_message;};

_criminal setVariable ["restrained", false, true];
[player, _criminal, _time] remoteExec ["HC_fnc_jailPlayer", HC_LIFE];