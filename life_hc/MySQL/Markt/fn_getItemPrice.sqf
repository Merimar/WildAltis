private _item = _this select 0;
private _buySell = _this select 1;

private _originalPrice = getNumber (missionConfigFile >> "Items" >> _item >> _buySell);
private _index = MARKT_SERVER_ARRAY findIf {(_x select 0) == _item};
if(_index isEqualTo -1) exitWith {_originalPrice};

private _event = (MARKT_SERVER_ARRAY select _index) select 6;
private _perc = (MARKT_SERVER_ARRAY select _index) select 4;

_originalPrice = if(_event isEqualTo -1) then {round(_originalPrice * _perc)} else {round(_originalPrice * _event)};
_originalPrice;