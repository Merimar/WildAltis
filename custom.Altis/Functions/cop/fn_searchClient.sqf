private _cop = param [0, objNull];
private _items = param [1, []];
private _infoText = param [2, ""];
if(isNull _cop) exitWith {};

{
private _item = _x;
private _index = life_virt_gear findIf {_x select 0 == _item};
if(_index != -1) then {life_virt_gear deleteAt _index};
}forEach _items;

if(count _items > 0) then {
[_infoText, "Diese Items wurden entfernt"] call life_fnc_message;
};

[] call life_fnc_fixSpace;