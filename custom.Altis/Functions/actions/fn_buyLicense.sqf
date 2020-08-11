#include "..\script_macros.hpp"
private _type = param [0, ""];

if(!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {};
private _displayName = M_CONFIG(getText,"Licenses", _type, "displayName");
private _price = M_CONFIG(getNumber,"Licenses", _type, "price");

if (CASH < _price) exitWith {[format["Du hast nicht genug Geld um dir diese Lizenz kaufen zu können. Die Lizenz kostet €%1", [_price] call life_fnc_numberText], "Zu wenig Geld"] spawn life_fnc_message;};
if(life_playtime < 360 && _type == "rebel") exitWith {["Du kannst dir die Rebellenlizenz erst ab einer Spielzeit von 6 Stunden kaufen", "Lizenz"] spawn life_fnc_message;};

CASH = CASH - _price;
LICENSES pushBack _type;
[format["Du hast dir eine %1 Lizenz für €%2 gekauft", localize _displayName, [_price] call life_fnc_numberText], "Lizenz gekauft"] spawn life_fnc_message;
[player, _type, _price] remoteExec ["HC_fnc_buyLicense", HC_LIFE];
closeDialog 0;

if(_type == "rebel") then {[format ["Aktuell bist du als Zivilist eingeloggt, wenn du alle Funktionen der Rebellenausbildung nutzen möchtest, musst du dich als Rebell einloggen."], "Rebellenausbildung", 20] spawn life_fnc_message;};