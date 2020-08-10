disableSerialization;
private _vehicleList = _this select 0;
private _index = _this select 1;
private _priceTag = (findDisplay 39400) displayCtrl 39402;

if(_index isEqualTo -1) exitWith {};

private _netID = _vehicleList lbData _index;
if(_netID == "") exitWith {};
private _vehicle = objectFromNetId _netID;
if(isNull _vehicle || {!(alive _vehicle)}) exitWith {};

private _vehiclePrice = [[typeOf _vehicle] call life_fnc_getVehicleChopPrice] call life_fnc_numberText;
_priceTag ctrlSetStructuredText parseText format ["Preis: <t color = '#8cff9b'>€%1</t>", _vehiclePrice];