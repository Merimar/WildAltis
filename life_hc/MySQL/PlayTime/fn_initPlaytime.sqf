private _pID = _this select 0;
private _pSide = _this select 1;

private _index = PLAYTIME findIf {(_x select 0) == _pID && (_x select 1) isEqualTo _pSide};

if(_index isEqualTo -1) then {
PLAYTIME pushBack [_pID, _pSide, time];
}else {
(PLAYTIME select _index) set [2, time];
};