_item = _this select 0;
_return = 1;

{
_var = _x select 0;
_perc = _x select 4;
if(_var == _item) then {
_return = _perc;
};
}forEach MARKT_ARRAY;

_return;

