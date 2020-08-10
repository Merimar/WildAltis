private _legal = _this select 0;
_return = "";
_lowestCur = 1;

{
private _var = _x select 0;
private _lStatus = _x select 3;
private _perc = _x select 4;
if(_lStatus isEqualTo _legal && _perc <= _lowestCur) then {
_lowestCur = _perc;
_return = _var;
};
}forEach MARKT_ARRAY;

_return;

