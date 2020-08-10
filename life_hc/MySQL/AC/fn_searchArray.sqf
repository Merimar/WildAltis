private _pID = _this select 0;
private _pSide = _this select 1;
private _return = SAVE_ARRAY findIf {_x select 0 isEqualTo _pID && _x select 1 isEqualTo _pSide};
_return;