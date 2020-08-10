private _unit = param [0, objNull];
private _container = param [1, objNull];
private _item = param [2, ""];

if(isNull _unit || isNull _container || _item isEqualTo "") exitWith {};

private _cargo = magazineCargo _container;
private _ammoCargo = magazinesAmmoCargo _container;
private _index = _ammoCargo findIf {(_x select 1) isEqualTo 0};
private _items = uniformItems player + vestItems player + backpackItems player + [uniform player, vest player, backpack player];

if(_index != -1) exitWith {clearMagazineCargo _container;};

[] call life_fnc_updateCom;

if(!(isNull objectParent player)) then {
private _count = {_item == _x} count _items;
private _index = if((DUPE_ARRAY findIf {_x select 0 == _item}) isEqualTo -1) then {count DUPE_ARRAY} else {DUPE_ARRAY findIf {_x select 0 == _item}};
DUPE_ARRAY set [_index, [_item, _count]];
};

if(abs (DUPE_TIME - time) <= 0.1) then {
{
private _xItem = _x select 0;
private _xAmount = _x select 1;
private _realCount = {_xItem == _x} count _items;
if(_xAmount != _realCount) then {
[player, _item] remoteExec ["HC_fnc_dupeHC", HC_LIFE];
};
}forEach DUPE_ARRAY;
};

[player, _item, _container] remoteExec ["HC_fnc_putItem", HC_LIFE];