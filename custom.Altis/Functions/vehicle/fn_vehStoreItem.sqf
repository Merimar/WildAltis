#include "..\script_macros.hpp"
disableSerialization;
private _storeAll = param [0, false];
private _usedPlayer = life_trunk_vehicle getVariable ["trunkPlayer", objNull];
private _index = lbCurSel 3502;

if(_usedPlayer != player) exitWith {closeDialog 0;};
if(_index isEqualTo -1) exitWith {["", "Du musst etwas auswählen"] spawn life_fnc_message;};

private _className = lbData [3502, _index];
private _itemAmount = [_className] call life_fnc_getItemValue;
private _amount = if(_storeAll) then {_itemAmount} else {parseNumber (ctrlText 3503)};
if(_amount > _itemAmount) then {_amount = _itemAmount;};
if(_amount <= 0) exitWith {["", "Du hast nicht genug Items"] spawn life_fnc_message;};

private _vehicleWeightInfo = [life_trunk_vehicle] call life_fnc_vehicleWeight;
private _itemWeight = [_className] call life_fnc_itemWeight;
private _vehicleMaxWeight = _vehicleWeightInfo select 0;
private _vehicleCurrentWeight = _vehicleWeightInfo select 1;
private _diff = floor ((_vehicleMaxWeight - _vehicleCurrentWeight) / _itemWeight);

if(_diff <= 0) exitWith {["", "Das Fahrzeug ist voll"] spawn life_fnc_message;};
if(_amount > _diff) then {_amount = _diff;};

private _vehData = life_trunk_vehicle getVariable ["Trunk", [[], 0]];
private _inv = _vehData select 0;

if(time - life_vehicle_delay < 1) exitWith {["", "Du kannst nur jede Sekunde etwas einlagern"] spawn life_fnc_message;};
life_vehicle_delay = time;

if(!([false, _className, _amount] call life_fnc_handleInv)) exitWith {["", "Du hast nicht genug Items"] spawn life_fnc_message;};
private _itemIndex = _inv findIf {_x select 0 == _className};

if(_itemIndex isEqualTo -1) then {
	_inv pushBack [_className, _amount];
}else {
	private _oldAmount = _inv select _itemIndex select 1;
	(_inv select _itemIndex) set [1, _oldAmount + _amount];
};

private _newTrunk = [_inv, _vehicleCurrentWeight + (_itemWeight * _amount)];

life_trunk_vehicle setVariable ["Trunk", _newTrunk, true];
[life_trunk_vehicle] call life_fnc_vehInventory;

[player, _className, _amount, life_trunk_vehicle] remoteExec ["HC_fnc_storeItemVehicle", HC_LIFE];