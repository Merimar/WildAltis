private _pID = param [0, "", [""]];
private _item = param [1, "", [""]];

if(_pID == "" || _item == "") exitWith {0;};
private _allItems = [_pID] call HC_fnc_getVirt;

private _index = _allItems findIf {_x select 0 == _item};
if(_index isEqualTo -1) exitWith {0};

private _count = _allItems select _index select 1;
_count;