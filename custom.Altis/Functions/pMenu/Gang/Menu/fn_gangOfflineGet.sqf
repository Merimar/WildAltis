disableSerialization;
private _group = group player;
private _display = findDisplay 4200;
private _list = _display displayCtrl 4201;
private _members = _this select 0;

GANG_CUR_ACTION = "OFFLINE";

lbClear _list;

{
private _xName = _x select 0;
private _xID = _x select 1;
private _xSideID = _x select 2;
private _xRank = [objNull, _group, _xID, _xSideID] call life_fnc_getGangRank;
private _index = playableUnits findIf {getPlayerUID _x == _xID};
if(_index isEqualTo -1) then {
_list lbAdd format ["%1 [%2]", _xName, _xRank];
_list lbSetData [lbSize (_list)-1, str(_x)];
};
}forEach _members;