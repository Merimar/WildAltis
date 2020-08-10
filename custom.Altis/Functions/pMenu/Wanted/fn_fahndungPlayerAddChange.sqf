disableSerialization;
private _display = findDisplay 3900;
private _crimeList = _display displayCtrl 3902;
private _index = lbCurSel 3901;
if(_index isEqualTo -1) exitWith {};
private _criminal = call compile lbData [3901, _index];

if(isNull _criminal) exitWith {};

private _criminalIndex = CURRENT_CRIMES findIf {_x select 1 == getPlayerUID _criminal};
private _crimes = if(_criminalIndex isEqualTo -1) then {[]} else {CURRENT_CRIMES select _criminalIndex select 6};
private _allCrimes = "true" configClasses (missionConfigFile >> "CfgWanted");
lbClear _crimeList;

if(count _crimes > 0) then {
_crimeList lbAdd "--------Spieler Verbrechen--------";
_crimeList lbSetData [(lbSize _crimeList)-1, ""];
_crimeList lbSetColor [(lbSize _crimeList)-1, [1,0.83,0.247,1]];

{
private _crime = _x select 0;
private _amount = _x select 1;
private _crimeName = getText (missionConfigFile >> "CfgWanted" >> _crime >> "name");

_crimeList lbAdd format ["%1x %2", _amount, _crimeName];
_crimeList lbSetData [(lbSize _crimeList)-1, _crime];
_crimeList lbSetColor [(lbSize _crimeList)-1, [0.75, 1, 0, 1]];
}forEach _crimes;

_crimeList lbAdd "----------------------------------";
_crimeList lbSetData [(lbSize _crimeList)-1, ""];
_crimeList lbSetColor [(lbSize _crimeList)-1, [1,0.83,0.247,1]];
};

{
private _crimeName = getText (_x >> "name");
_crimeList lbAdd _crimeName;
_crimeList lbSetData [(lbSize _crimeList)-1, configName _x];
}forEach _allCrimes;

_crimeList lbSetCurSel 0;

