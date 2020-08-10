private _unit = param [0, objNull];
private _crime = param [1, ""];
private _action = param [2, true];
private _clearAll = param [3, false];
private _pName = name _unit;
private _pID = getPlayerUID _unit;
private _pSide = side _unit;

if(_pSide in [west, independent]) exitWith {};

private _criminalIndex = CRIME_LIST findIf {_x select 1 == _pID};
if(_clearAll) exitWith {if(_criminalIndex != -1) then {(CRIME_LIST select _criminalIndex) set [6, []];};};

if(_action) then {
if(_criminalIndex isEqualTo -1) then {
CRIME_LIST pushBack [_pName, _pID, _pSide, "SYSTEM", "-1", west, [[_crime, 1]], []];
}else {
private _crIndex = (CRIME_LIST select _criminalIndex select 6) findIf {_x select 0 == _crime};
if(_crIndex isEqualTo -1) then {
(CRIME_LIST select _criminalIndex select 6) pushBack [_crime, 1];
}else {
private _newAmount = (CRIME_LIST select _criminalIndex select 6 select _crIndex select 1) + 1;
(CRIME_LIST select _criminalIndex select 6 select _crIndex) set [1, _newAmount];
};
};
}else {
if(_criminalIndex isEqualTo -1) exitWith {};
private _crIndex = (CRIME_LIST select _criminalIndex select 6) findIf {_x select 0 == _crime};
if(_crIndex isEqualTo -1) exitWith {};
(CRIME_LIST select _criminalIndex select 6) deleteAt _crIndex;
};