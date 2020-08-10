#include "..\script_macros.hpp"
disableSerialization;

private _display = findDisplay 100000;

private _vorname = ctrlText 100002;
private _nachname = ctrlText 100003;
private _plz = ctrlText 100004;
private _strase = ctrlText 100005;

if(lbCurSel 100006 isEqualTo -1 || lbCurSel 100007 isEqualTo -1 || lbCurSel 100008 isEqualTo -1 || lbCurSel 100009 isEqualTo -1 || _vorname == "" || (_nachname == "" && playerSide in [west, independent]) || _strase == "" || _plz == "") exitWith {MSG(localize "STR_NOT_GOOD");};

private _land = lbText [100006, lbCurSel 100006];
private _provinz = lbText [100007, lbCurSel 100007];
private _wohnort = lbText [100008, lbCurSel 100008];
private _hausnummer = lbText [100009, lbCurSel 100009];

private _goodNameChars = ["ä", "ö", "ü", "Ä", "Ö", "Ü", "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0"," ",".", "[", "]", "-"];
private _goodPlzChars = ["1","2","3","4","5","6","7","8","9","0"];
private _badChars = [];

for "_int" from 0 to ((count _vorname) - 1) step 1 do {
_currentVorname = _vorname select [_int, 1];
if(!(_currentVorname in _goodNameChars)) then {_badChars pushBack _currentVorname;};
};

for "_int" from 0 to ((count _nachname) - 1) step 1 do {
_currentNachname = _nachname select [_int, 1];
if(!(_currentNachname in _goodNameChars)) then {_badChars pushBack _currentNachname;};
};

for "_int" from 0 to ((count _strase) - 1) step 1 do {
_currentStrase = _strase select [_int, 1];
if(!(_currentStrase in _goodNameChars)) then {_badChars pushBack _currentStrase;};
};

for "_int" from 0 to ((count _plz) - 1) step 1 do {
_currentPlz = _plz select [_int, 1];
if(!(_currentPlz in _goodPlzChars)) then {_badChars pushBack _currentPlz;};
};

if(count _badChars > 0) exitWith {
_msg = format ["In deinen Angaben befinden sich Zeichen die auf diesem Server nicht erlaubt sind: %1", _badChars joinString ", "];
["", _msg] call life_fnc_message;
};

if(count _vorname > 15 || count _nachname > 15 || count _strase > 30 || !(count _plz isEqualTo 5)) exitWith {
["<t color = '#F07F06'>Vorname: </t>Max. 15 Zeichen<br/><t color = '#F07F06'>Nachname: </t>Max. 15 Zeichen<br/><t color = '#F07F06'>Straße: </t>Max. 30 Zeichen<br/><t color = '#F07F06'>PLZ: </t>Genau 5 Zeichen<br/><br/><t color = '#F07F06' size = '1.2'>ANMERKUNG:</t><br/><br/>Das Script fügt automatisch Leerzeichen ein. Für den Namen <t color = '#F07F06'>'Igor Nitro'</t> trägt man <t color = '#F07F06'>'Igor'</t> bei Vorname und <t color = '#F07F06'>'Nitro'</t> bei Nachname ein<br/><br/>Befinden sich mehrere Leerzeichen in deinem Namen verfahre wie in<br/>folgendem Beispiel:<br/><br/>Voller Name: <t color = '#F07F06'>'Igor Nitro Newman'</t><br/>Vorname: <t color = '#F07F06'>'Igor'</t><br/>Nachname: <t color = '#F07F06'>'Nitro Newman'</t>", "Ausweis Vorgaben", 20] spawn life_fnc_message;
};

private _finalPlayerName = if(_nachname != "") then {(_vorname + " " + _nachname)} else {_vorname};

private _action = [
    format[localize "STR_AUSWEIS_SURE", _finalPlayerName],
    "Namen festlegen",
    "Ja",
    "Abbrechen"
] call BIS_fnc_guiMessage;

if(!_action) exitWith {
MSG("Abgebrochen");
};

private _ausweis = [_finalPlayerName, _vorname, _nachname, _plz, _strase, _land, _provinz, _wohnort, _hausnummer];

MSG("Daten erfolgreich abgesendet");
closeDialog 0;
[player, _ausweis] remoteExec ["HC_fnc_confirmName", HC_LIFE];
