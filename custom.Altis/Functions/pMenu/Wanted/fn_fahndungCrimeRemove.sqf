disableSerialization;
private _display = findDisplay 3900;
private _playerIndex = lbCurSel 3901;
private _crimeIndex = lbCurSel 3902;

if(_playerIndex isEqualTo -1 || _crimeIndex isEqualTo -1 || WANTED_TIMER) exitWith {["Du kannst nur alle 10 Sekunden einen Eintrag löschen.", "Fahndungsliste"] spawn life_fnc_message;};

private _unit = call compile lbData [3901, _playerIndex];
private _crime = lbData [3902, _crimeIndex];
private _crimeColor = (lbColor [3902, _crimeIndex]) param [0, 0];
if(isNull _unit || _crime == "" || abs (_crimeColor - 0.75) > 0.5) exitWith {};

private _action = ["Möchtest du dieses Vergehen wirklich löschen?", "Verbrechen löschen", "Ja", "Nein"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

private _crimeName = getText (missionConfigFile >> "CfgWanted" >> _crime >> "name");
private _criminalIndex = CURRENT_CRIMES findIf {_x select 1 == getPlayerUID _unit};
if(_criminalIndex isEqualTo -1) exitWith {};

private _crIndex = (CURRENT_CRIMES select _criminalIndex select 6) findIf {_x select 0 == _crime};
if(_crIndex isEqualTo -1) exitWith {};

[] spawn {WANTED_TIMER = true;sleep 10;WANTED_TIMER = false;};
(CURRENT_CRIMES select _criminalIndex select 6) deleteAt _crIndex;

[format ["Du hast einen Eintrag auf der Fahndungsliste gelöscht.<br/><br/>Spieler: %1<br/>Straftat: %2", name _unit, _crimeName], "Fahndungsliste"] spawn life_fnc_message;
[] call life_fnc_fahndungCrimeAddChange;
[player, _unit, _crime] remoteExec ["HC_fnc_fahndungRemove", HC_LIFE];