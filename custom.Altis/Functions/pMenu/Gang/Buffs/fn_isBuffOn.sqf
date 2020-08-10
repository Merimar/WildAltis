private _buff = param [0, ""];
private _group = group player;
private _activeBuffs = _group getVariable ["gang_active_buffs", []];

private _activeIndex = _activeBuffs findIf {_x select 0 == _buff};
private _return = _activeIndex != -1;
_return;