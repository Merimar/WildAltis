disableSerialization;
private _item = _this select 0;
private _amount = param [1, 1];
private _niceArray = [];

if(_item isEqualType "") then {
private _index = LOCKER findIf {_x select 0 == _item};
if(_index isEqualTo -1) then {
if(_amount < 1) exitWith {};
LOCKER pushBack [_item, _amount];
}else {
private _oldAmount = LOCKER select _index select 1;
LOCKER select _index set [1, _oldAmount + _amount];
};
}else {
{
_curItem = _x;
if(_curItem != "") then {
_index = _niceArray findIf {_x select 0 == _curItem};
if(_index isEqualTo -1) then {
_niceArray pushBack [_curItem, 1];
}else {
_old = _niceArray select _index select 1;
(_niceArray select _index) set [1, _old + 1];
};
};
}forEach _item;


{
_curItem = _x select 0;
_curAmount = _x select 1;
private _index = LOCKER findIf {_x select 0 == _curItem};
if(_index isEqualTo -1) then {
if(_curAmount < 1) exitWith {};
LOCKER pushBack [_curItem, _curAmount];
}else {
private _oldAmount = LOCKER select _index select 1;
LOCKER select _index set [1, _oldAmount + _curAmount];
};
}forEach _niceArray;
};


if(_item isEqualType "") then {
[player, _item, _amount] remoteExec ["HC_fnc_lockerUpdate", HC_LIFE];
}else {
[player, _niceArray, _amount] remoteExec ["HC_fnc_lockerUpdate", HC_LIFE];
};