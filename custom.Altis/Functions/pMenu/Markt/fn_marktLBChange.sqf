#include "..\..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 1250;
private _pictureCtrl = _display displayCtrl 1252;
private _oldPriceEdit = _display displayCtrl 1253;
private _newPriceEdit = _display displayCtrl 1254;
private _kursEdit = _display displayCtrl 1255;
private _index = lbCurSel 1251;

if(_index isEqualTo -1) exitWith {};

private _item = lbData [1251, _index];
private _newPrice = [_item, "sellPrice"] call life_fnc_getItemPrice;
private _oldPrice = getNumber (missionConfigFile >> "Items" >> _item >> "sellPrice");

private _picture = if(_newPrice > _oldPrice) then {"Images\Dialog\uparrow.paa"} else {"Images\Dialog\downarrow.paa"};
private _color = switch (true) do {case (_newPrice > _oldPrice) : {[0, 1, 0, 1]}; case (_newPrice < _oldPrice) : {[1, 0, 0, 1]}; case (_newPrice == _oldPrice) : {[1, 1, 1, 1]};};

private _prefix = if(_newPrice < _oldPrice) then {"-"}else {"+"};
private _kursPrefix = if(_newPrice < _oldPrice) then {_oldPrice / _newPrice} else {_newPrice / _oldPrice};

_pictureCtrl ctrlSetText _picture;
_pictureCtrl ctrlSetTextColor _color;
_newPriceEdit ctrlSetText ([_newPrice] call life_fnc_numberText);
_oldPriceEdit ctrlSetText ([_oldPrice] call life_fnc_numberText);
_kursEdit ctrlSetText format ["%1 %2%3", _prefix, (_kursPrefix * 100) - 100, "%"];