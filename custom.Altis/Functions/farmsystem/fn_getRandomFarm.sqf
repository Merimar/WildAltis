private _farmSkill = param [0, "", [""]];
private _return = 0;

private _amountArray = [_farmSkill] call life_fnc_getSkillAdvantage;
if(_amountArray isEqualType 0) exitWith {1};
private _random = round(random(100)) + 1;
private _realAmountArray = [];
private _count = 0;

{
private _newVal = _count + _x;
_realAmountArray pushBack [_forEachIndex + 1, _newVal];
_count = _newVal;
}forEach _amountArray;

private _random = round (random 100) + 1;
{
private _amount = _x select 0;
private _chance = _x select 1;

private _prevAmount = if(_forEachIndex isEqualTo 0) then {0} else {_realAmountArray select (_forEachIndex - 1) select 1};
if(_random <= _chance && _random > _prevAmount) exitWith {_return = _amount};
}forEach _realAmountArray;

_return;