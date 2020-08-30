//sleep (3 * 3600);
sleep 60;

DATA_POINTS = [];

private _rebs = playableUnits select {side _x in [civilian, east]};

["Das Rechenzentrum öffnet seine Pforten. Ab nun haben alle Rebellen die Möglichkeit das Rechenzentrum einzunehmen. Alles was Ihr dafür tun müsst, ist in der orange-farbenen Zone im Rechenzentrum zu bleiben. In eurem Z-INV Könnt ihr sehen welche Gang gerade führt. Wir wünschen euch viel Glück.", "Rechenzentrum", 25] remoteExec ["life_fnc_message", _rebs];

private _random = round (random 21) + 1;

private _marker = createMarker ["Datacenter", markerPos format ["DATA_MOVE_%1", _random]];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerColor "ColorOrange";
_marker setMarkerBrush "SOLID";
_marker setMarkerSize [20, 20];

private _markerIcon = createMarker ["Datacenter_Icon", markerPos format ["DATA_MOVE_%1", _random]];
_markerIcon setMarkerColor "ColorGrey";
_markerIcon setMarkerText "Einnehmen";
_markerIcon setMarkerType "loc_defend";

for "_int" from 1 to 7 step 1 do {
private _markerEntry = createMarker [format ["Datacenter_Entry_%1", _int], markerPos format ["DATA_ENTRY_%1", _int]];
_markerEntry setMarkerColor "ColorIndependent";
_markerEntry setMarkerText format ["Eingang %1", _int];
_markerEntry setMarkerType "loc_move";
};

private _markerMap = createMarker ["Datacenter_Map", markerPos "DATA_MAP"];
_markerMap setMarkerColor "ColorBlack";
_markerMap setMarkerText "Rechenzentrum";
_markerMap setMarkerType "loc_Frame";

private _moveSpeed = 0.01;
private _moveSleep = 0.01;
private _movePrescision = 0.3;
private _start = true;

DATA_TIMER = servertime + (45 * 60);
publicVariable "DATA_TIMER";

[] spawn {
while {round (DATA_TIMER - servertime) >= 1} do {
bank_obj setVariable ["DataTime", servertime + 17, true];
[] call HC_fnc_awardPoints;
sleep 17;
};
};

while {round (DATA_TIMER - servertime) >= 1} do {

for "_int" from 1 to 21 step 1 do {
if(round (DATA_TIMER - servertime) < 1) exitWith {};
if(!_start || _int >= _random) then {
_start = false;
private _markerPos2 = markerPos format ["DATA_MOVE_%1", _int];

private _markerPos2X = _markerPos2 select 0;
private _markerPos2Y = _markerPos2 select 1;

private _stopX = false;
private _stopY = false;

while {!_stopX || !_stopY} do {
private _markerPos3 = markerPos _marker;

private _newX = _markerPos3 select 0;
private _newY = _markerPos3 select 1;

if(_markerPos2X > _newX && !_stopX) then {_newX = _newX + _moveSpeed;};
if(_markerPos2X < _newX && !_stopX) then {_newX = _newX - _moveSpeed;};

if(_markerPos2Y > _newY && !_stopY) then {_newY = _newY + _moveSpeed;};
if(_markerPos2Y < _newY && !_stopY) then {_newY = _newY - _moveSpeed;};

if(abs (_markerPos2X - _newX) < _movePrescision) then {_stopX = true;};
if(abs (_markerPos2Y - _newY) < _movePrescision) then {_stopY = true;};

if(round (DATA_TIMER - servertime) < 1) exitWith {};

_marker setMarkerPos [_newX, _newY, 0];
_markerIcon setMarkerPos [_newX, _newY, 0];
sleep _moveSleep;
};
};
};
};

deleteMarker _markerIcon;
deleteMarker _marker;
for "_int" from 1 to 7 step 1 do {deleteMarker format ["Datacenter_Entry_%1", _int];};

private _gewinner = "";
private _curPoints = 0;

{
private _gang = _x select 0;
private _points = _x select 1;
if(_points > _curPoints) then {_gewinner = _gang;_curPoints = _points;};
}forEach DATA_POINTS;

[format ["Die Gruppierung %1 hat mit %2 Punkten die Kontrolle über das Rechenzentrum erlangt.", _gewinner, _curPoints], "Rechenzentrum"] remoteExec ["life_fnc_message", -2];

{
private _xName = _x getVariable ["gang_name", ""];
if(_xName == _gewinner) exitWith {[_x] call HC_fnc_giveRandomBuff;};
}forEach allGroups;