disableSerialization;
private _display = findDisplay 398000;
private _lockerEdit = _display displayCtrl 398005;
private _playerEdit = _display displayCtrl 398006;
private _list = _this select 0;
private _ListIDC = ctrlIDC _list;
private _index = lbCurSel _list;
private _className = _list lbData _index;
private _curAmount = _list lbValue _index;
private _amount = switch (_ListIDC) do {
case 398022 : {ctrlText 398005};
case 398026 : {ctrlText 398006};
case 398039 : {"1"};
case 398040 : {"1"};
};

_amount = parseNumber _amount;
if(_amount isEqualTo 0) exitWith {};
if(_amount > _curAmount) exitWith {["", "So viel hast du nicht!"] spawn life_fnc_message;};

if(_ListIDC in [398022, 398039]) then {
if(([_className] call life_fnc_hasSpace) < _amount) exitWith {["", "Du hast zu wenig Platz!"] spawn life_fnc_message;};
[_className, 0 - _amount] call life_fnc_lockerManage;
[_className, _amount, true] call life_fnc_addItem;
}else {
[_className, _amount] call life_fnc_lockerManage;
if(_ListIDC isEqualTo 398026) exitWith {for "_int" from 1 to _amount step 1 do {player removeMagazine _className;};};
for "_int" from 1 to _amount step 1 do {
if(_className in assignedItems player) then {player removeWeapon _className} else {player removeItem _className};
};
};

[CURRENT_TAB] call life_fnc_lockerTab;


