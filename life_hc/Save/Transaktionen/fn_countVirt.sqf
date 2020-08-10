private _pID = param [0, "-1", ["-1"]];
private _pSide = param [1, sideUnknown, [sideUnknown]];
private _item = param [2, "", [""]];

if(_pID == "-1" || _pSide isEqualTo sideUnknown || _item == "") exitWith {0;};
private _allItems = [_pID, _pSide] call HC_fnc_getVirt;

private _index = _allItems findIf {_x select 0 == _item};
if(_index isEqualTo -1) exitWith {0};

private _count = _allItems select _index select 1;
_count;