disableSerialization;
private _display = findDisplay 3900;
private _playerIndex = lbCurSel 3901;
private _crimeIndex = lbCurSel 3902;

if(_playerIndex isEqualTo -1 || _crimeIndex isEqualTo -1 || WANTED_TIMER) exitWith {["Du kannst nur alle 10 Sekunden einen Spieler auf die Fahndungsliste hinzufügen.", "Fahndungsliste"] spawn life_fnc_message;};

private _unit = call compile lbData [3901, _playerIndex];
private _crime = lbData [3902, _crimeIndex];

if(isNull _unit || _crime == "") exitWith {};

private _action = ["Möchtest du diesen Spieler wirklich auf die Fahndungsliste hinzufügen", "Verbrechen hinzufügen", "Ja", "Nein"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

private _criminalIndex = CURRENT_CRIMES findIf {_x select 1 == getPlayerUID _unit};
private _crimeName = getText (missionConfigFile >> "CfgWanted" >> _crime >> "name");

[] spawn {WANTED_TIMER = true;sleep 10;WANTED_TIMER = false;};

if(_criminalIndex isEqualTo -1) then {
CURRENT_CRIMES pushBack [name _unit, getPlayerUID _unit, side _unit, profileName, getPlayerUID player, playerSide, [[_crime, 1]], []];
}else {
private _crIndex = (CURRENT_CRIMES select _criminalIndex select 6) findIf {_x select 0 == _crime};
if(_crIndex isEqualTo -1) then {
(CURRENT_CRIMES select _criminalIndex select 6) pushBack [_crime, 1];
}else {
private _newAmount = (CURRENT_CRIMES select _criminalIndex select 6 select _crIndex select 1) + 1;
(CURRENT_CRIMES select _criminalIndex select 6 select _crIndex) set [1, _newAmount];
};
};

[format ["Du hast einen Spieler auf die Fahndungsliste hinzugefügt.<br/><br/>Spieler: %1<br/>Straftat: %2", name _unit, _crimeName], "Fahndungsliste"] spawn life_fnc_message;
[] call life_fnc_fahndungCrimeAddChange;
[player, _unit, _crime] remoteExec ["HC_fnc_fahndungAdd", HC_LIFE];