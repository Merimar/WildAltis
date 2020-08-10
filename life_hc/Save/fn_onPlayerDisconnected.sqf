private _pID = _this select 0;
private _pName = _this select 1;
private _pSide = _this select 2;

["ConnectionLog", format ["Der Spieler %1 (%2 - %3) hat sich ausgeloggt", _pName, _pID, _pSide]] call HC_fnc_log;
[_pID, _pSide, false] call HC_fnc_savePlaytime;

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

private _saveArrayIndex = [_pID, _pSide] call HC_fnc_searchArray;
if(_saveArrayIndex isEqualTo -1) exitWith {DEBUG_ARRAY pushBack format ["Not in SAVE_ARRAY [onPlayerDisconnected]: %1", _this];};
if(count (SAVE_ARRAY select _saveArrayIndex select SAVE_STATE_INDEX) isEqualTo 0) exitWith {DEBUG_ARRAY pushBack format ["Count is zero [onPlayerDisconnected]: %1", _this];};

private _pItems = [_pID, _pSide] call HC_fnc_getVirt;

{
_item = _x select 0;
_amount = _x select 1;
if(getText (missionConfigFile >> "Items" >> _item >> "type") in ["FARM", "MARKT"]) then {[_pID, _pSide, _item, _amount, false] call HC_fnc_handleVirt;};
}forEach _pItems;

[_saveArrayIndex] call HC_fnc_saveToDatabase;