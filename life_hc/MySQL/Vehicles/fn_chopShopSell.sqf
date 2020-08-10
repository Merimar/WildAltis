#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _vehicle = param [1, objNull, [objNull]];
private _playerPrice = param [2, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_chopShopSell"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;

if(isNull _vehicle) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Fahrzeug choppen, das Fahrzeug existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "ChopShop Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein ChopShop Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _dbInfo = _vehicle getVariable ["dbInfo",[]];

if (count _dbInfo isEqualTo 0) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Fahrzeug choppen, das Fahrzeug hat allerdings keine Datenbankinformationen", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "ChopShop Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein ChopShop Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _vID = _dbInfo select 0;
private _vSide = _dbInfo select 1;
private _vUID = _dbInfo select 2;
private _vSideID = [_vSide] call HC_fnc_getGroupSideID;

_isHacker = [[str _vID, str _vSide, str _vUID], _unit, remoteExecutedOwner, "fn_chopShopSell"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _databaseInformation = [_vUID, _vID, _vSide] call HC_fnc_getVehicleDatabase;

if (count _databaseInformation isEqualTo 0) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Fahrzeug choppen, das Fahrzeug existiert allerdings nicht in der DB", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "ChopShop Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein ChopShop Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _classname = _databaseInformation select 1;
private _insurance = _databaseInformation select 6;
private _chopPrice = [typeOf _vehicle] call HC_fnc_getVehicleChopPrice;

if(_playerPrice != _chopPrice) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Fahrzeug choppen, hat aber einen anderen Preis angegeben (%4 != %5)", name _unit, getPlayerUID _unit, side _unit, [_playerPrice] call HC_fnc_numberSafe, [_chopPrice] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "ChopShop Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein ChopShop Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _query = if(_insurance isEqualTo 1) then {format["UPDATE vehicles SET insurance = '0' AND active = '0' WHERE owner_id = '%1' AND side_id = '%2' AND vuid = '%3'", _vID, _vSideID, _vUID]} else {format["UPDATE vehicles SET deleted_at = now() AND active = '0' WHERE owner_id = '%1' AND side_id = '%2' AND vuid = '%3'", _vID, _vSideID, _vUID]};
[_query, 1] call HC_fnc_asyncCall;

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug verchopt (FAHRZEUG: %4 PREIS: %5)", name _unit, getPlayerUID _unit, side _unit, typeOf _vehicle, [_chopPrice] call HC_fnc_numberSafe];
["ChopLog", _msg] call HC_fnc_Log;

[getPlayerUID _unit, side _unit, "cash", _chopPrice, true] call HC_fnc_handleMoney;
deleteVehicle _vehicle;