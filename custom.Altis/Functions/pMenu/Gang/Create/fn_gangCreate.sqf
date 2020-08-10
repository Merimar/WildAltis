#include "..\..\..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 4150;
if(((group player) getVariable ["gang_name", ""]) != "") exitWith {["", "Du bist schon in einer Gang"] spawn life_fnc_message;};
if(!isNil "life_action_gangInUse") exitWith {["", "Du erstellt gerade eine Gang"] spawn life_fnc_message;};

_gangName = ctrlText 4151;
_length = count _gangName;
_allowed = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
_allowed append ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
_allowed append ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", "-", "_", "*", "#", ",", "."];

if (_length > 30) exitWith {["Der Gangname darf nicht mehr als 30 Zeichen besitzen", "Name zu lang"] spawn life_fnc_message;};
if(BANK < 100000) exitWith {["Eine Gang zu erstellen kostet €100.000", "Zu wenig Geld"] spawn life_fnc_message;};

_badCharList = [];
for "_int" from 0 to (_length - 1) step 1 do {
_cur = _gangName select [_int,1];
if(!(_cur in _allowed)) exitWith {_badCharList pushBack _cur};
};

_badChars = _badCharList joinString ", ";

if(count _badCharList > 0) exitWith {[format["Es befinden sich unerlaubte Zeichen in deinem Gangnamen: %1", _badChars], "Unerlaubte Zeichen"] spawn life_fnc_message};

[player, _gangName] remoteExec ["HC_fnc_gangCreate", HC_Life];
life_action_gangInUse = true;

waitUntil {!isNil "gang_money"};
life_action_gangInUse = nil;
closeDialog 0;
if(gang_money) then {BANK = BANK - 100000;};