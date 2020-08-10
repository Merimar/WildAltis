private _item = param [0, ""];
private _index = life_virt_gear findIf {_x select 0 == _item};
if(_index isEqualTo -1) exitWith {0};
private _amount = life_virt_gear select _index select 1;
_amount;