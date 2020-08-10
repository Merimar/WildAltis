private _legal = _this select 0;
private _blacklist = param [1, ""];

private _items = MARKT_ARRAY select {_x select 3 isEqualTo _legal && _x select 0 != _blacklist};
private _item = (selectRandom _items) select 0;
_item;