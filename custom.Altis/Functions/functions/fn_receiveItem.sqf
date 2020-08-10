private _unit = param [0, objNull];
private _givePlayer = param [1, objNull];
private _item = param [2, ""];
private _amount = param [3, 0];
private _geheimZahl = param [4, -1, [0]];
private _random = param [5, -1];
private _isGiven = param [6, false];

if(isNull _unit || isNull _givePlayer || _item == "" || _amount isEqualTo 0) exitWith {};
if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

private _diff = [_item ,_amount, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff;
private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");

if(_isGiven) then {
[true, _item, _diff] call life_fnc_handleInv;
if(_diff isEqualTo _amount) then {
[format["%1 hat dir %2 %3 gegeben", name _unit, _diff, _displayName], "Items erhalten"] spawn life_fnc_message;
}else {
[format["%1 hat dir %2 %3 gegeben, da du nicht genug Platz im Inventar hast, hast du %4 Items zurueck gegeben", name _unit, _amount, _displayName, _amount - _diff], "Items zurückgegeben"] spawn life_fnc_message;
};
[player, _unit, _item, _diff, false, _random] remoteExec ["HC_fnc_giveVirt", HC_LIFE];
}else {
[true, _item, _amount] call life_fnc_handleInv;
[format["%1 hat dir %2x %3 zurueck gegeben, da er nicht genug Platz im Inventar hatte", name _unit, _amount, _displayName], "Items zurückbekommen"] spawn life_fnc_message;
};