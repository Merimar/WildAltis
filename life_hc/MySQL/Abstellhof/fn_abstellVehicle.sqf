private _unit = param [0, objNull, [objNull]];
private _vUID = param [1, 0, [0]];
private _pPrice = param [2, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_abstellVehicle"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _pSideID = [_pSide] call HC_fnc_getSideID;
private _databaseInformation = [_vUID, _pID, _pSide] call HC_fnc_getVehicleDatabase;
if(count _databaseInformation isEqualTo 0) exitWith {};
private _id = _databaseInformation select 0;
private _classname = _databaseInformation select 1;
private _finalPrice = [_classname, side _unit] call life_fnc_getAbstellhofPrice;

if(_finalPrice != _pPrice) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Fahrzeug vom Abstellhof zurückkaufen, hat aber einen anderen Preis angegeben (%4 != %5)", name _unit, getPlayerUID _unit, side _unit, [_finalPrice] call HC_fnc_numberSafe, [_pPrice] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1 (%2 - %3)", name _unit, getPlayerUID _unit, side _unit];
[_unit, "Abstellhof Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Abstellhof Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _bankMoney = [_pID, _pSide, "bank"] call HC_fnc_getMoney;

if(_bankMoney < _pPrice) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Fahrzeug vom Abstellhof zurückkaufen, hat aber nicht genug Geld (%4 < %5)", name _unit, getPlayerUID _unit, side _unit, [_bankMoney] call HC_fnc_numberSafe, [_pPrice] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1 (%2 - %3)", name _unit, getPlayerUID _unit, side _unit];
[_unit, "Abstellhof Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Abstellhof Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[_pID, _pSide, "bank", _finalPrice, false] call HC_fnc_handleMoney;

private _query = format["UPDATE vehicles SET impounded = '0' WHERE vuid = '%1' AND owner_id = '%2' AND side_id = '%3' AND deleted_at IS NULL", _vUID, _pID, _pSideID];
[_query,1] call HC_fnc_asyncCall;

_msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug vom Abstellhof freigekauft (FAHRZEUG: %4 PREIS: %5)", name _unit, getPlayerUID _unit, _classname, [_finalPrice] call HC_fnc_numberSafe];
["AbstellhofLog", _msg] call HC_fnc_Log;