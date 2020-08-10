private _unit = param [0, objNull, [objNull]];
private _criminal = param [1, objNull, [objNull]];
private _crime = param [2, "", [""]];

private _isHacker = [[_crime], _unit, remoteExecutedOwner, "fn_fahndungRemove"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _criminal || _crime == "") exitWith {};

private _crimeName = getText (missionConfigFile >> "CfgWanted" >> _crime >> "name");
private _criminalIndex = CRIME_LIST findIf {_x select 1 == getPlayerUID _criminal};
if(_criminalIndex isEqualTo -1) exitWith {};

private _crIndex = (CRIME_LIST select _criminalIndex select 6) findIf {_x select 0 == _crime};
if(_crIndex isEqualTo -1) exitWith {};

(CRIME_LIST select _criminalIndex select 6) deleteAt _crIndex;

private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) einen Eintrag auf der Fahndungsliste gelöscht (STRAFTAT: %7)", name _unit, getPlayerUID _unit, side _unit, name _criminal, getPlayerUID _criminal, side _criminal, _crimeName];
["WantedLog", _msg] call HC_fnc_Log;