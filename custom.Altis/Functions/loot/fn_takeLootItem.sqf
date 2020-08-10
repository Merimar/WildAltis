disableSerialization;
private _nearUnits = (nearestObjects[player, ["Man"], 15]) arrayIntersect playableUnits;
if(count _nearUnits > 1) exitWith {["Wenn du einen Spieler lootest dürfen keine Spieler in deiner Nähe sein.", "Spieler looten"] spawn life_fnc_message;};
if(LOOT_TIMER) exitWith {["Du kannst nur alle 3 Sekunden ein Item nehmen.", "Spieler looten"] spawn life_fnc_message;};

[] spawn {LOOT_TIMER = true;sleep 3;LOOT_TIMER = false;};

private _display = findDisplay 5100;
private _list = _display displayCtrl 5101;
private _selection = lbCurSel _list;

if(_selection isEqualTo -1) exitWith {};

private _data = lbData [5101, _selection];
private _value = lbValue [5101, _selection];

if(_data == "" || _value <= 0) exitWith {};

private _playerUID = LOOT_INFORMATION select 0;
private _playerName = LOOT_INFORMATION select 1;
private _playerItems = LOOT_INFORMATION select 2;
private _playerMoney = LOOT_INFORMATION select 3;
private _corpse = LOOT_INFORMATION select 4;
private _displayName = getText (missionConfigFile >> "Items" >> _data >> "name");
private _diff = [_data, _value, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff;

if(isNull _corpse) exitWith {["", "Der Spieler ist respawnt"] spawn life_fnc_message;};
if(_diff <= 0) exitWith {["", "Du hast nicht genuegend Platz im Inventar"] spawn life_fnc_message;};

private _index = _playerItems findIf {_x select 0 == _data && _x select 1 >= _diff};
if(_index isEqualTo -1) exitWith {};
if(!([true, _data, _diff] call life_fnc_handleInv)) exitWith {};

["", format["Du hast %1 %2 gelootet", _diff, _displayName]] spawn life_fnc_message;
[player, _data, _diff, _corpse, _playerUID] remoteExec ["HC_fnc_takeLootItem", HC_LIFE];

(_playerItems select _index) set [1, _value - _diff];
private _finalList = _playerItems select {(_x select 1) > 0};
LOOT_INFORMATION = [_playerUID, _playerName, _finalList, _playerMoney, _corpse];
lbClear _list;

{
if(_amount > 0) then {
private _item = _x select 0;
private _amount = _x select 1;

_itemName = getText (missionConfigFile >> "Items" >> "name");
_itemIllegal = getNumber (missionConfigFile >> "Items" >> "illegal");

_list lbAdd format ["%1 %2", _amount, _itemName];
_list lbSetData [(lbSize _list)-1, _item];
_list lbSetValue [(lbSize _list)-1, _amount];
if(_itemIllegal isEqualTo 1) then {_list lbSetColor [(lbSize _list)-1, [1,0.55,0,1]];};
};
}forEach _finalList;

if((lbSize _list) isEqualTo 0) then {
_list lbAdd "Keine Items gefunden";
_list lbSetData [0,""];
_list lbSetValue [0,0];
};