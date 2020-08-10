disableSerialization;
private _type = param [0, 0];
private _display = findDisplay 1150;
private _map = _display displayCtrl 1152;
private _index = lbCurSel 1151;
private _item = lbData [1151, _index];

private _markerArray = getArray (missionConfigFile >> "CfgFarmRoutes" >> _item >> _type);
if(count _markerArray isEqualTo 0) exitWith {["Diese Farmroute hat kein Feld oder Verarbeiter", "Farmrouten"] spawn life_fnc_message;};
if(CUR_MARKER_ROUTE >= count _markerArray) then {CUR_MARKER_ROUTE = 0;};

private _markerPos = markerPos (_markerArray select CUR_MARKER_ROUTE);
if((_markerPos select 0) isEqualTo 0 && (_markerPos select 1) isEqualTo 0) exitWith {["Diese Farmroute hat kein Feld oder Verarbeiter", "Farmrouten"] spawn life_fnc_message;};
_map ctrlMapAnimAdd [1, 0.1, _markerPos];
ctrlMapAnimCommit _map;

CUR_MARKER_ROUTE = CUR_MARKER_ROUTE + 1;