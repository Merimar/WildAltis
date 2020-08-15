private _pSide = param [0, civilian];
private _sideID = SIDE_QUERY findIf {_x select 1 == str (_pSide)};
_sideID = SIDE_QUERY select _sideID select 0;
_sideID;