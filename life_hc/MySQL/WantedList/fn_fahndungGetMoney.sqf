private _criminalID = param [0, ""];

private _criminalIndex = CRIME_LIST findIf {_x select 1 == _criminalID};
if(_criminalIndex isEqualTo -1) exitWith {0;};

private _crimes = CRIME_LIST select _criminalIndex select 6;
private _value = 0;

{
private _crime = _x select 0;
private _amount = _x select 1;
private _fine = (getNumber (missionConfigFile >> "CfgWanted" >> _crime >> "charge")) * _amount;
_value = _value + _fine;
}forEach _crimes;

_value;