private _input = param [0, []];
private _index = param [1, 0];
private _result = [];

{_result pushBack (_x select 0);}forEach _input;

_result;