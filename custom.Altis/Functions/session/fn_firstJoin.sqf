#include "..\script_macros.hpp"
disableSerialization;

if(isNull findDisplay 100000) then {createDialog "Ausweis";};
private _display = findDisplay 100000;
private _header = _display displayCtrl 100001;

_display displaySetEventHandler ["keyDown", "_this call life_fnc_displayHandler"];

private _editVorname = _display displayCtrl 100002;
private _editNachname = _display displayCtrl 100003;
private _editPlz = _display displayCtrl 100004;
private _editStrase = _display displayCtrl 100005;

private _comboLand = _display displayCtrl 100006;
private _comboProvinz = _display displayCtrl 100007;
private _comboWohnort = _display displayCtrl 100008;
private _comboHausnummer = _display displayCtrl 100009;

_header ctrlSetText "Du hast noch keinen Ausweis erstellt";

lbClear _comboLand;
lbClear _comboProvinz;
lbClear _comboWohnort;
lbClear _comboHausnummer;

private _countries = getArray (missionConfigFile >> "CfgAusweis" >> "countries");
private _provinces = getArray (missionConfigFile >> "CfgAusweis" >> "provinces");
private _cities = getArray (missionConfigFile >> "CfgAusweis" >> "cities");

{_comboLand lbAdd _x;}forEach _countries;
{_comboProvinz lbAdd _x;}forEach _provinces;
{_comboWohnort lbAdd _x;}forEach _cities;
for "_i" from 1 to 20 step 1 do {_comboHausnummer lbAdd str _i;};

["<t color = '#F07F06'>Vorname: </t>Max. 15 Zeichen<br/><t color = '#F07F06'>Nachname: </t>Max. 15 Zeichen<br/><t color = '#F07F06'>Straße: </t>Max. 30 Zeichen<br/><t color = '#F07F06'>PLZ: </t>Genau 5 Zeichen<br/><br/><t color = '#F07F06' size = '1.2'>ANMERKUNG:</t><br/><br/>Das Script fügt automatisch Leerzeichen ein. Für den Namen <t color = '#F07F06'>'Igor Nitro'</t> trägt man <t color = '#F07F06'>'Igor'</t> bei Vorname und <t color = '#F07F06'>'Nitro'</t> bei Nachname ein<br/><br/>Befinden sich mehrere Leerzeichen in deinem Namen verfahre wie in<br/>folgendem Beispiel:<br/><br/>Voller Name: <t color = '#F07F06'>'Igor Nitro Newman'</t><br/>Vorname: <t color = '#F07F06'>'Igor'</t><br/>Nachname: <t color = '#F07F06'>'Nitro Newman'</t>", "Ausweis Vorgaben", 40] spawn life_fnc_message;