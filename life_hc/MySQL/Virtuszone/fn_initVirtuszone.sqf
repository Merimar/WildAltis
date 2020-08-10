private _random = round (random(3600));
VIRTUS_KILL_ARRAY = [];
sleep (3600 + _random);
if(count playableUnits < 40) exitWith {};
private _virtusConfig = "true" configClasses (missionConfigFile >> "CfgVirtus");
private _virtusZone = selectRandom _virtusConfig;

private _virtusPos = markerPos (getText (_virtusZone >> "marker"));
private _objects = getArray (_virtusZone >> "objects");
private _crates = getArray (_virtusZone >> "crates");
private _time = getNumber (_virtusZone >> "time");

private _virtusObjects = [];

{
private _veh = (_x select 0) createVehicle (ASLToAGL (_x select 1));
_veh setVectorDirAndUp (_x select 2);
_veh setPosASL (_x select 1);
_veh setVariable ["Virtus_Object", true];
_virtusObjects pushBack _veh;
}forEach _objects;

_markerZone = createMarker ["VirtusZone", _virtusPos];
_markerZone setMarkerColor "colorRed";
_markerZone setMarkerShape "ELLIPSE";
_markerZone setMarkerSize [1200, 1200];
_markerZone setMarkerText "";
_markerZone setMarkerBrush "Horizontal";

_markerZoneText = createMarker ["VirtusZoneText", _virtusPos];
_markerZoneText setMarkerColor "ColorKhaki";
_markerZoneText setMarkerType "mil_unknown";
_markerZoneText setMarkerText "   ? Unbekannte Struktur ?";

["Wissenschaftler haben eine uns unbekannte Struktur gefunden. Es wird aktuell untersucht, ob es sich hierbei um eine ausserirdische Anomalie handelt, oder von Menschen geschaffen wurde. Ersten Berichten zufolge wurden Kisten mit Waffen und Munition gefunden. Andere Augenzeugen berichten von Rebellen, welche die Fundstätte für sich erobern wollen und einen Gangbuff am Ende gewinnen wollen. Die Regierung bestätigt keine dieser Aussagen und hat angekündigt eine Pressekonferenz zu einem späteren Zeitpunkt zu geben. Offiziellen Angaben nach ist es verboten sich dem Gebiet zu nähern!", "Unbekannte Struktur gefunden!", 30] remoteExec ["life_fnc_message", -2];

_time = floor ((_time / 5) * 60);

for "_int" from 1 to 5 step 1 do {
[] call HC_fnc_givePoints;
_players = playableUnits select {_x inArea "VirtusZone"};
if(count _players > 0) then {["", "Die Zone schrumpft!"] remoteExec ["life_fnc_message", _players];};
bank_obj setVariable ["Virtuszone", time + _time, true];
_markerZone setMarkerSize [1200 - (_int * 200), 1200 - (_int * 200)];

if(_int isEqualTo 2) then {
if(count _players > 0) then {["", "Die Kisten sind gespawnt!"] remoteExec ["life_fnc_message", _players];};
{
private _veh = (_x select 0) createVehicle (ASLToAGL (_x select 1));
_veh setVectorDirAndUp (_x select 2);
_veh setPosASL (_x select 1);
_veh allowDamage false;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearItemCargoGlobal _veh;
_virtusObjects pushBack _veh;
[_veh] call HC_fnc_fillWeaponCrate;
}forEach _crates;
};
sleep _time;
};

deleteMarker _markerZone;
deleteMarker _markerZoneText;

private _gewinner = "";
private _curPoints = 0;

{
private _gang = _x select 0;
private _points = _x select 1;
if(_points > _curPoints) then {_gewinner = _gang;_curPoints = _points;};
}forEach VIRTUS_KILL_ARRAY;

{deleteVehicle _x;}forEach _virtusObjects;

if(_gewinner == "") exitWith {["Die Regierung verkündet, dass die unbekannte Struktur einfach verschwunden sei. Erste Experten geben an an, sie konnten Ihren Augen nicht trauen, als ein Gebäude nach dem anderen verschwunden ist. Die Regierung bedankt sich bei der Bevölkerung für ihr Fernbleiben!", "Unbekannte Struktur verschwunden", 30] remoteExec ["life_fnc_message", -2];};
[format["Die unbekannte Struktur ist Augenzeugen zufolge einfach verschwunden. Menschen starren fasziniert auf die Stelle wo sich vor wenigen Momenten noch unbekannte Gebäude befunden haben. Forscher welche am Anfang von Rebellen vertrieben worden waren, schließen die Interaktion mit anderen Lebensformen nicht aus. Die Rebellengruppierung %1 welche das Gebiet unter Ihre Kontrolle bringen konnte (%2 Punkte) hat in den Strukturen einen Gangbuff gefunden. Die Regierung kündigt ein hartes Vorgehen gegen besagte Rebellen an und prangert die Attacke als 'Schlag gegen die Wissenschaft' an!", _gewinner, _curPoints], "Unbekannte Struktur verschwunden", 30] remoteExec ["life_fnc_message", -2];

{
private _xName = _x getVariable ["gang_name", ""];
if(_xName == _gewinner) exitWith {[_x] call HC_fnc_giveRandomBuff;};
}forEach allGroups;