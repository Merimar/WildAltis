private _item = _this select 0;

private _index = MARKT_ARRAY findIf {_x select 0 == _item};
if(_index isEqualTo -1) exitWith {-1;};

private _return = MARKT_ARRAY select _index select 5;
_return;

