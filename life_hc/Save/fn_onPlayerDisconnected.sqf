private _pID = param [0, "", [""]];
private _pName = param [1, "", [""]];
private _pSide = param [2, sideUnknown, [sideUnknown]];

if(remoteExecutedOwner != 2) exitWith {
private _remInfo = [remoteExecutedOwner] call HC_fnc_getPlayerByID;
private _remSuccess = _remInfo select 1;
private _rem = _remInfo select 0;
diag_log format ["DISCONNECT HACK: %1 - %2", remoteExecutedOwner, _this];
if(!_remSuccess) exitWith {};
diag_log format ["Spieler: %1 (%2 - %3)", name _rem, getPlayerUID _rem, side _rem];
};

["ConnectionLog", format ["Der Spieler %1 (%2 - %3) hat sich ausgeloggt", _pName, _pID, _pSide]] call HC_fnc_log;
[_pID, _pSide] call HC_fnc_savePlaytime;

private _index = PAYCHECK_HANDLE findIf {_x select 0 == _pID};
if(_index >= 0) then {terminate (PAYCHECK_HANDLE select _index select 1);};

if(_pID in CURRENT_AUSWEIS_CREATE) exitWith {CURRENT_AUSWEIS_CREATE = CURRENT_AUSWEIS_CREATE - [_pID]};

{
if(_x isKindOf "Man" && !(_x isKindOf "Animal") && {!alive _x}) then {
_var = _x getVariable ["Loot_Information", []];
if(!(_var isEqualTo [])) then {
_xUID = _var select 0;
_xName = _var select 0;
if(_pID == _xUID) exitWith {
["DeathLog", format ["Die Leiche des Spielers %1 (%2) wurde geloescht, da er sich ausgeloggt hat", _xName, _xUID]] call HC_fnc_log;
deleteVehicle _x;
};
};
};
}forEach allDeadMen;

private _saveState = [_pID] call HC_fnc_getSave;
if(count _saveState isEqualTo 0) exitWith {};
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {};

private _pItems = [_pID] call HC_fnc_getVirt;

{
_item = _x select 0;
_amount = _x select 1;
if(getText (missionConfigFile >> "Items" >> _item >> "type") in ["FARM", "MARKT"]) then {[_pID, _item, _amount, false] call HC_fnc_handleVirt;};
}forEach _pItems;

[_pID] call HC_fnc_saveToDatabase;