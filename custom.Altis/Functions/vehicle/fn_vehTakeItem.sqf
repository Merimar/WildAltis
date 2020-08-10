#include "..\script_macros.hpp"
disableSerialization;
private _takeAll = param [0, false];
private _usedPlayer = life_trunk_vehicle getVariable ["trunkPlayer", objNull];
private _index = lbCurSel 3501;

if(_usedPlayer != player) exitWith {closeDialog 0;};
if(_index isEqualTo -1) exitWith {["", "Du musst etwas auswählen"] spawn life_fnc_message;};

private _className = lbData [3501, _index];
private _vehData = life_trunk_vehicle getVariable ["Trunk", [[], 0]];
private _inv = _vehData select 0;
private _vehicleItemIndex = _inv findIf {_x select 0 == _className};
private _vehicleAmount = if(_vehicleItemIndex isEqualTo -1) then {0} else {_inv select _vehicleItemIndex select 1};
private _amount = if(_takeAll) then {_vehicleAmount} else {parseNumber (ctrlText 3503)};
if(_amount > _vehicleAmount) then {_amount = _vehicleAmount;};
if(_amount <= 0) exitWith {["", "Das Fahrzeug hat nicht genug Items"] spawn life_fnc_message;};

private _vehicleWeightInfo = [life_trunk_vehicle] call life_fnc_vehicleWeight;
private _itemWeight = [_className] call life_fnc_itemWeight;
private _vehicleCurrentWeight = _vehicleWeightInfo select 1;
private _diff = floor ((life_maxWeight - life_carryWeight) / _itemWeight);

if(_diff <= 0) exitWith {["", "Dein Inventar ist voll"] spawn life_fnc_message;};
if(_amount > _diff) then {_amount = _diff;};

if(time - life_action_delay < 1) exitWith {["", "Du kannst nur jede Sekunden etwas auslagern"] spawn life_fnc_message;};
life_action_delay = time;

if(!([true, _className, _amount] call life_fnc_handleInv)) exitWith {["", "Du hast nicht genug Platz"] spawn life_fnc_message;};

private _newAmount = if(_vehicleAmount - _amount <= 0) then {0} else {_vehicleAmount - _amount};
(_inv select _vehicleItemIndex) set [1, _newAmount];

private _newTrunk = [_inv, _vehicleCurrentWeight - (_itemWeight * _amount)];

life_trunk_vehicle setVariable ["Trunk", _newTrunk, true];
[life_trunk_vehicle] call life_fnc_vehInventory;

[player, _className, _amount, life_trunk_vehicle] remoteExec ["HC_fnc_takeItemVehicle", HC_LIFE];