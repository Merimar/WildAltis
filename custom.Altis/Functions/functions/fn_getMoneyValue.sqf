private _input = param [0, []];
private _keyWord = param [1, ""];

private _index = _input findIf {_x select 0 == _keyWord};
if(_index isEqualTo -1) exitWith {0;};
private _result = _input select _index select 1;
_result;