#include "..\script_macros.hpp"
private _unit = param [0, objNull];
private _val = param [1, 0];
private _from = param [2, objNull];
private _admin = param [3, false];
private _script = param [4, false];
private _geheimZahl = param [5, -1, [0]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

if(_admin && {_script}) exitWith {
[format ["Das Ticket wurde bezahlt. Du hast €%1 bekommen", [_val] call life_fnc_numberText], "Ticket bezahlt"] spawn life_fnc_message;
BANK = BANK + _val;
};

if(_admin) exitWith {
[format ["Name: %1<br/>Geld: €%2<br/>Supporter: %3", profileName, [_val] call life_fnc_numberText, name _from], "Du hast Geld erhalten"] spawn life_fnc_message;
BANK = BANK + _val;
};

if(_script) exitWith {
[format ["Du bekommst €%1", [_val] call life_fnc_numberText], "Du hast Geld erhalten"] spawn life_fnc_message;
BANK = BANK + _val;
};

if (isNull _unit || isNull _from || _val isEqualTo 0) exitWith {};
if (_unit == _from) exitWith {};

[format ["Der Spieler %1 hat dir €%2 gegeben.", name _from, [_val] call life_fnc_numberText], "Du hast Geld erhalten"] spawn life_fnc_message;
CASH = CASH + _val;
