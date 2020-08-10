private _inv = _this select 0;
private _item = _this select 1;
private _index = _inv findIf {(_x select 0) == _item};
_index;