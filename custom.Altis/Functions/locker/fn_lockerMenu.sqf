disableSerialization;
private _refresh = param [0, false, [false]];
if(!("haus" in LICENSES)) exitWith {["", "Du brauchst eine Hauseigentümer Lizenz"] spawn life_fnc_message;};
if(LOCKER_TIMER && !_refresh) exitWith {["Du kannst nur alle 30 Sekunden in dein Schliesfach schauen", "Schliesfach"] spawn life_fnc_message};

if(!_refresh) then {
[] spawn {
LOCKER_TIMER = true;
sleep 30;
LOCKER_TIMER = false;
};
};

if(isNull findDisplay 398000) then {createDialog "Locker";};
private _display = findDisplay 398000;
private _listLocker = _display displayCtrl 398039;
private _listPlayer = _display displayCtrl 398040;

lbClear _listLocker;
lbClear _listPlayer;

private _playerItems = [];
private _uniform = uniform player;
private _vest = vest player;
private _backpack = backpack player;
private _headgear = headgear player;
private _glasses = goggles player;
private _binocular = binocular player;
private _uniformItems = uniformItems player;
private _vestItems = vestItems player;
private _backpackItems = backpackItems player;
private _assignedItems = assignedItems player;
private _primaryWeapon = assignedItems player;
private _secondaryWeapon = assignedItems player;
private _handgunWeapon = assignedItems player;
private _primary = primaryWeapon  player;
private _secondary = secondaryWeapon player;
private _handgun = handgunWeapon player;
private _primaryA = primaryWeaponItems  player;
private _secondaryA = secondaryWeaponItems player;
private _handgunA = handgunItems player;

private _allItems = [_uniform] + [_vest] + [_backpack] + [_headgear] + [_glasses] + [_binocular] + [_primary] + [_secondary] + [_handgun] + _uniformItems + _vestItems + _backpackItems + _assignedItems + _primaryA + _secondaryA + _handgunA;

{
private _classname = _x select 0;
private _amount = _x select 1;
if(_amount > 0) then {
private _itemInfo = [_classname] call life_fnc_fetchCfgDetails;
private _displayName = _itemInfo select 1;
private _picture = _itemInfo select 2;
_itemType = [_classname] call life_fnc_getItemType;
_listLocker lbAdd format ["%1 (%2)", _displayName, _amount];
_listLocker lbSetPicture [(lbSize _listLocker)-1, _picture];
_listLocker lbSetData [(lbSize _listLocker)-1, _classname];
_listLocker lbSetValue [(lbSize _listLocker)-1, _amount];
};
}forEach LOCKER;

{
private _classname = _x;
private _index = _playerItems findIf {_x select 0 == _classname};
if(_classname != "") then {
if(_index isEqualTo -1) then {
_playerItems pushBack [_classname, 1];
}else {
private _old = (_playerItems select _index) select 1;
(_playerItems select _index) set [1, _old + 1];
};
};
}forEach _allItems;

{
private _classname = _x select 0;
private _amount = _x select 1;
if(_amount > 0) then {
private _itemInfo = [_classname] call life_fnc_fetchCfgDetails;
private _displayName = _itemInfo select 1;
private _picture = _itemInfo select 2;
_listPlayer lbAdd format ["%1 (%2)", _displayName, _amount];
_listPlayer lbSetPicture [lbSize (_listPlayer)-1, _picture];
_listPlayer lbSetData [lbSize (_listPlayer)-1, _classname];
_listPlayer lbSetValue [lbSize (_listPlayer)-1, _amount];
};
}forEach _playerItems;

if(lbSize _listLocker isEqualTo 0) then {_listLocker lbAdd "Keine Items verfügbar";_listLocker lbSetData [0, ""];};
if(lbSize _listPlayer isEqualTo 0) then {_listPlayer lbAdd "Keine Items verfügbar";_listPlayer lbSetData [0, ""];};

lbSort _listPlayer;
lbSort _listLocker;