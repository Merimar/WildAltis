private _input = param [0, []];
private _index = param [1, 0];
private _doppelt = param [2, false];
private _result = [];

{
if(!_doppelt || !((_x select 0) in _result)) then {
_result pushBack (_x select 0);
};
}forEach _input;

_result;