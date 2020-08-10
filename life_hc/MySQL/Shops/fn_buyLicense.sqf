#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _license = param [1, "", [""]];
private _money = param [2, 0, [0]];

private _isHacker = [[_license], _unit, remoteExecutedOwner, "fn_buyLicense"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _realPrice = getNumber (missionConfigFile >> "Licenses" >> _license >> "price");
private _name = localize getText (missionConfigFile >> "Licenses" >> _license >> "displayName");
private _handMoney = [getPlayerUID _unit, side _unit, "cash"] call HC_fnc_getMoney;

if(_realPrice != _money) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte eine %4 Lizenz kaufen, der Kaufpreis ist aber nicht richtig (%5 != %6)", name _unit, getPlayerUID _unit, side _unit, _license, [_money] call HC_fnc_numberSafe, [_realPrice] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "License Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein License Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if(_handMoney < _money) then {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte eine %5 Lizenz im Preis von $%6 kaufen, hat aber nur $%7 an Bargeld", name _unit, getPlayerUID _unit, side _unit, _license, [_money] call HC_fnc_numberSafe, [_handMoney] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "License Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein License Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, side _unit, "cash", _money, false] call HC_fnc_handleMoney;
[getPlayerUID _unit, side _unit, _license, true] call HC_fnc_handleLicenses;

_msg = format ["Der Spieler %1 (%2 - %3) hat eine %4 Lizenz im Preis von $%5 gekauft", name _unit, getPlayerUID _unit, side _unit, _name, [_money] call HC_fnc_numberSafe];
["LicenseLog", _msg] call HC_fnc_Log;