private _unit = param [0, objNull];
private _buff = param [1, ""];
private _group = group _unit;
private _activeBuffs = _group getVariable ["gang_active_buffs", []];

private _activeIndex = _activeBuffs findIf {_x select 0 == _buff};
private _return = _activeIndex != -1;
_return;