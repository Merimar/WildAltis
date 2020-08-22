private _item = param [0, "", [""]];
private _amount = param [1, 0, [0]];

if(_item == "" || _amount isEqualTo 0) exitWith {};

private _index = MARKT_ARRAY findIf {(_x select 0) == _item};
if(_index isEqualTo -1) exitWith {};

private _illegal = MARKT_ARRAY select _index select 3;
private _curPercItem = MARKT_ARRAY select _index select 4;
private _curCounterItem = (MARKT_ARRAY select _index select 5) + _amount;
private _newItem = [_illegal] call HC_fnc_getLowestPerc;

if(_curCounterItem < MARKT_CHANGE_VALUE) exitWith {(MARKT_ARRAY select _index) set [5, _curCounterItem];};
(MARKT_ARRAY select _index) set [5, 0];

private _newItem = if(_newItem == _item) then {[_illegal, _item] call HC_fnc_getRandomMarktItem} else {_newItem};
private _curPercItem = _curPercItem - (0.01 * MAKRT_MULTIPLIER);
if(_curPercItem < 0.7) then {_curPercItem = 0.7;};
if(_curPercItem < 0) then {_curPercItem = 0};
(MARKT_ARRAY select _index) set [4, _curPercItem];

_index = MARKT_ARRAY findIf {_x select 0 == _newItem};
private _curPercNew = (MARKT_ARRAY select _index select 4) + (0.01 * MAKRT_MULTIPLIER);
(MARKT_ARRAY select _index) set [4, _curPercNew];