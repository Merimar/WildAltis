#include "..\script_macros.hpp"
private _vehicle = cursorObject;
private _owners = _vehicle getVariable ["vehicle_info_owners", []];

if(count _owners isEqualTo 0) exitWith {["Das Fahrzeug gehört niemanden, es ist ein Event Fahrzeug", "Keine Informationen"] spawn life_fnc_message;};

private _nameArray = [];
{_nameArray pushBack (_x select 1);}forEach _owners;
private _nameString = format["Folgende Personen haben einen Schlüssel für das Fahrzeug<br/><br/>%1", _nameArray joinString "<br/>"];
[_nameString, "Fahrzeug Besitzer"] spawn life_fnc_message;