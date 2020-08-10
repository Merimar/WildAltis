#include "..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 5000;
private _index = lbCurSel 5001;
private _amount = lbCurSel 5003;
private _playerMoney = _display displayCtrl 5005;
if(_index isEqualTo -1) exitWith {["", localize "STR_NOT_SELECTED"] spawn life_fnc_message;};
if(_amount <= 0) exitWith {};

private _data = call compile (lbData [5001, _index]);
private _price = lbValue [5001, _index];
private _classname = _data select 0;
private _condition = _data select 1;
private _finalPrice = round (_price * _amount);

if(_finalPrice > CASH) exitWith {["", "Du hast nicht genug Geld dabei"] spawn life_fnc_message;};
if(!_condition) exitWith {["", "Du erfüllst die Anforderungen für dieses Item nicht"] spawn life_fnc_message;};
if((time - life_action_delay) < 1) exitWith {["", "Du kannst nur jede Sekunde etwas kaufen. (Tipp: Gib gleich die richtige Menge ein)"] spawn life_fnc_message;};

for "_int" from 1 to _amount step 1 do {[_classname, true] spawn life_fnc_handleItem;};

CASH = CASH - _finalPrice;
life_action_delay = time;
playSound "buy";

_playerMoney ctrlSetStructuredText parseText format ["Geld: <t color='#60F73B'>€%1</t>", [CASH] call life_fnc_numberText];
[player, _classname, _amount, _price, SHOP_CONFIG, SHOP_FILTER] remoteExec ["HC_fnc_buyWeapon", HC_LIFE];

sleep 0.5;