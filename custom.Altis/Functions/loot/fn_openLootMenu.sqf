disableSerialization;
private _cursorTarget = param [0, objNull];
private _lootInformation = _cursorTarget getVariable ["Loot_Information", []];
LOOT_INFORMATION = _lootInformation + [_cursorTarget];

if(count _lootInformation isEqualTo 0 || isNull _cursorTarget) exitWith {titleText ["Hier ist nichts mehr zu holen!", "PLAIN"];};
if(isNull findDisplay 5100) then {createDialog "Loot";};
private _display = findDisplay 5100;
private _list = _display displayCtrl 5101;
private _btnTakeItems = _display displayCtrl 5102;
private _btnTakeMoney = _display displayCtrl 5103;
private _playerUID = _lootInformation select 0;
private _playerName = _lootInformation select 1;
private _playerItems = _lootInformation select 2;
private _playerMoney = _lootInformation select 3;

_btnTakeItems ctrlEnable false;
lbClear _list;
_btnTakeMoney ctrlSetText format ["€%1 nehmen", [_playerMoney] call life_fnc_numberText];
_btnTakeMoney ctrlEnable (_playerMoney > 0);

{
private _item = _x select 0;
private _amount = _x select 1;

if(_amount > 0) then {
_itemName = getText (missionConfigFile >> "Items" >> _item >> "name");
_itemIllegal = getNumber (missionConfigFile >> "Items" >> _item >> "illegal");

_list lbAdd format ["%1 %2", _amount, _itemName];
_list lbSetData [(lbSize _list)-1, _item];
_list lbSetValue [(lbSize _list)-1, _amount];
if(_itemIllegal isEqualTo 1) then {_list lbSetColor [(lbSize _list)-1, [1,0.55,0,1]];};
};
}forEach _playerItems;

if((lbSize _list) isEqualTo 0) then {
_list lbAdd "Keine Items gefunden";
_list lbSetData [0,""];
_list lbSetValue [0,0];
};
