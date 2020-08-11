private _vehicle = param [0, objNull, [objNull]];

if(playerSide != independent) exitWith {};
if(MEDIC_ABANDONED_TIMER) exitWith {["", "Du kannst diese Funktion nur alle 15 Sekunden nutzen"] spawn life_fnc_message;};
if(_vehicle getVariable ["event_vehicle", false]) exitWith {["", "Diese Funktion geht bei Event Fahrzeugen nicht!"] spawn life_fnc_message;};
private _vehicleOwner = (_vehicle getVariable ["dbInfo", []]) param [0, ""];

[] spawn {
MEDIC_ABANDONED_TIMER = true;
sleep 15;
MEDIC_ABANDONED_TIMER = false;
};

private _owner = (playableUnits select {getPlayerUID _x == _vehicleOwner}) param [0, objNull];
if(isNull _owner) exitWith {["Der Besitzer dieses Fahrzeuges befindet sich aktuell nicht auf der Insel.", "Verlassenes Fahrzeug"] spawn life_fnc_message;};

["Der Besitzer des Fahrzeugs hat eine Meldung über sein Fahrzeug bekommen. Sollte der Spieler innerhalb von 1 Minute nicht antworten kannst du sein Fahrzeug beschlagnahmen!", "Verlasenes Fahrzeug"] spawn life_fnc_message;
[format ["Wir haben dein/en %1 an der Position %2 gefunden. Da Sie gerade nicht in der Nähe waren, wollten wir fragen ob wir Ihr Fahrzeug abschleppen dürfen!"], "Feuerwehr Nachricht"] remoteExec ["life_fnc_message", _owner];