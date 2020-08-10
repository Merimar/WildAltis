disableSerialization;
private _display = findDisplay 3900;
private _crimeList = _display displayCtrl 3902;
private _crimeFine = _display displayCtrl 3903;
private _crimePercentage = _display displayCtrl 3904;
private _crimeJailTime = _display displayCtrl 3905;
private _crimeForceTicket = _display displayCtrl 3907;
private _index = lbCurSel _crimeList;
private _crime = _crimeList lbData _index;

private _crimeEuro = getNumber (missionConfigFile >> "CfgWanted" >> _crime >> "charge");
private _crimePerc = getNumber (missionConfigFile >> "CfgWanted" >> _crime >> "percentage");
private _crimeJail = getNumber (missionConfigFile >> "CfgWanted" >> _crime >> "jail");
private _crimeForce = if(getNumber (missionConfigFile >> "CfgWanted" >> _crime >> "force") isEqualTo 1) then {"Ja"} else {"Nein"};

_crimeFine ctrlSetText str _crimeEuro;
_crimePercentage ctrlSetText str _crimePerc;
_crimeJailTime ctrlSetText str _crimeJail;
_crimeForceTicket ctrlSetText _crimeForce;