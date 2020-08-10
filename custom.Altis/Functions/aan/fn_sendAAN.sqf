disableSerialization;
if(!dialog) exitWith {};
private _display = findDisplay 3700;
private _header = ctrlText 3701;
private _message = ctrlText 3702;
private _sendBtn = _display displayCtrl 3703;

if(AAN_NEWS) exitWith {["Es hat schon jemand eine Nachricht geschickt, warte kurz!", "AAN News"] spawn life_fnc_message;};
if(CASH < 100000) exitWith {["Du brauchst €100.000 um eine Rundfunknachricht zu schicken.", "AAN News"] spawn life_fnc_message;};
if(count _message < 10 || count _header < 5 || count _message > 100 || count _header > 30) exitWith {["Deine Nachricht ist zu kurz", "AAN News"] spawn life_fnc_message;};

private _allowed = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0"," ",".", "[", "]", ",", "!", "?", "$", "%", "&", "/", "(", ")", "=", "{", "}", "-", ";", ":", "_", "<", ">", "^"];
private _exit = false;

for "_int" from 0 to ((count _message) - 1) step 1 do {
_currentMessage = _message select [_int, 1];
if(!(_currentMessage in _allowed)) then {_exit = true;};
};

for "_int" from 0 to ((count _header) - 1) step 1 do {
_currentMessage = _header select [_int, 1];
if(!(_currentMessage in _allowed)) then {_exit = true;};
};

if(_exit) exitWith {["Es befinden sich ungültige Zeichen in deiner Nachricht.", "AAN News"] spawn life_fnc_message;};

_sendBtn ctrlEnable false;
[player, _message, _header] remoteExec ["HC_fnc_sendAAN", HC_LIFE];
CASH = CASH - 100000;