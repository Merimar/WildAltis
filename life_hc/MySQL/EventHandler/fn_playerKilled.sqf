#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull];
private _killer = param [1, objNull];
private _newPlayer = param [2, objNull];
private _deathMessage = "";

private _pName = name _newPlayer;
private _pID = getPlayerUID _newPlayer;
private _pSide = side _newPlayer;

_newPlayer setVariable ["Bank_geschafft", false, true];

private _cash = [_pID, "cash"] call HC_fnc_getMoney;
private _cashLog = [_cash] call HC_fnc_numberSafe;
private _itemList = [_pID] call HC_fnc_getVirt;
private _itemArray = [];{if((_x select 1) > 0) then {_itemArray pushBack format ["%1x %2", _x select 1, _x select 0];};}forEach _itemList;
private _itemString = _itemArray joinString ", ";
private _gear = [_pID] call HC_fnc_getGear;
_primaryWeapon = if(!(isNull _killer)) then {primaryWeapon _killer} else {"Keine Waffe"};

private _unitVehicle = "Kein Fahrzeug";
if(!(isNull objectParent _unit)) then {
private _fetchUnitVehicle = [typeOf objectParent _unit] call life_fnc_fetchVehInfo;
_unitVehicle = _fetchUnitVehicle param [3, "Kein Fahrzeug"];
};

private _killerVehicle = "Kein Fahrzeug";
if(!(isNull objectParent _unit)) then {
private _fetchKillerVehicle = [typeOf objectParent _killer] call life_fnc_fetchVehInfo;
_killerVehicle = _fetchKillerVehicle param [3, "Kein Fahrzeug"];
};

if(isNull _unit) then {
	if(isNull _killer || {_killer == _unit}) then {
		_deathMessage = format ["Der Spieler %1 (%2 - %3) ist ohne Fremdeinwirkung gestorben. Der Spieler existiert zudem nicht, weshalb es keine extra Daten gibt", _pName, _pID, _pSide];
	}else {
		_deathMessage = format ["Der Spieler %1 (%2 - %3) wurde vom Spieler %4 (%5 - %6) getötet. Der Spieler existiert zudem nicht, weshalb es keine extra Daten gibt", _pName, _pID, _pSide, name _killer, getPlayerUID _killer, side _killer];
	};
}else {
	if(isNull _killer || {_killer == _unit}) then {
		if(isNull objectParent _unit) then {
			_deathMessage = format ["Der Spieler %1 (%2 - %3) ist ohne Fremdeinwirkung gestorben. (POS: %4 CASH: %5 ITEMS: %6 GEAR: %7)", _pName, _pID, _pSide, mapGridPosition _unit, _cashLog, _itemString, _gear];
		}else {
			_deathMessage = format ["Der Spieler %1 (%2 - %3) ist ohne Fremdeinwirkung in einem Fahrzeug gestorben. (POS: %4 CASH: %5 ITEMS: %6 GEAR: %7 FAHRZEUG: %8)", _pName, _pID, _pSide, mapGridPosition _unit, _cashLog, _itemString, _gear, _unitVehicle];
		};
	}else {
	private _killType = if((side _killer) isEqualTo west) then {"KILL_COP"} else {"KILL"};
	private _vehicleKillType = if((side _killer) isEqualTo west) then {"VEHICLE_KILL_COP"} else {"VEHICLE_KILL"};
		if(isNull objectParent _unit) then {
			if(isNull objectParent _killer) then {
				_deathMessage = format ["Der Spieler %1 (%2 - %3) wurde vom Spieler %4 (%5 - %6) getötet. (POS: %7 DISTANZ: %8m WAFFE: %9 CASH: %10 ITEMS: %11 GEAR: %12)", _pName, _pID, _pSide, name _killer, getPlayerUID _killer, side _killer, mapGridPosition _unit, round (_unit distance _killer), _primaryWeapon, _cashLog, _itemString, _gear];
				[_killer, _killType] call HC_fnc_fahndungHandle;
			}else {
				_deathMessage = format ["Der Spieler %1 (%2 - %3) wurde vom Spieler %4 (%5 - %6) mit einem Fahrzeug getötet. (POS: %7 DISTANZ: %8m FAHRZEUG: %9 CASH: %10 ITEMS: %11 GEAR: %12)", _pName, _pID, _pSide, name _killer, getPlayerUID _killer, side _killer, mapGridPosition _unit, round (_unit distance _killer), _killerVehicle, _cashLog, _itemString, _gear];
				[_killer, _vehicleKillType] call HC_fnc_fahndungHandle;
			};
		}else {
			if(isNull objectParent _killer) then {
				_deathMessage = format ["Der Spieler %1 (%2 - %3) wurde vom Spieler %4 (%5 - %6) aus einem Fahrzeug geschossen. (POS: %7 DISTANZ: %8 WAFFE: %9 CASH: %10 ITEMS: %11 GEAR: %12)", _pName, _pID, _pSide, name _killer, getPlayerUID _killer, side _killer, mapGridPosition _unit, round (_unit distance _killer), _primaryWeapon, _cashLog, _itemString, _gear];
				[_killer, _killType] call HC_fnc_fahndungHandle;
			}else {
				_deathMessage = format ["Der Spieler %1 (%2 - %3) wurde vom Spieler %4 (%5 - %6) mit einem Fahrzeug tot gerammt. (POS: %7 P-VEHICLE: %8 K-VEHICLE: %9 CASH: %10 ITEMS: %11 GEAR: %12)", _pName, _pID, _pSide, name _killer, getPlayerUID _killer, side _killer, mapGridPosition _unit, _unitVehicle, _killerVehicle, _cashLog, _itemString, _gear];
				[_killer, _vehicleKillType] call HC_fnc_fahndungHandle;
			};
		};
	};
};

if(!(isNull _killer) && _killer != _unit && {(side _killer) isEqualTo west && _pSide != west}) then {[_newPlayer, _killer] call HC_fnc_fahndungBounty;};

private _informationList = [_pID, _pName, _itemList, _cash, _pSide];
private _index = MONEY_PICKUP findIf {_x select 0 == _pID};
if(_index isEqualTo -1) then {MONEY_PICKUP pushBackUnique _informationList;}else {MONEY_PICKUP set [_index, _informationList];};

[_pID, false] call HC_fnc_handleAlive;
[_pID, "", 1, false, true] call HC_fnc_handleVirt;
[_pID, []] call HC_fnc_handleInv;
[_pID, "cash", _cash, false] call HC_fnc_handleMoney;
["DeathLog", _deathMessage] call HC_fnc_Log;
if(isNull _killer || _killer == _unit || {!(_killer inArea "VirtusZone")}) exitWith {};
private _groupName = (group _killer) getVariable ["gang_name", ""];
if(_groupName == "") exitWith {};

private _virtusIndex = VIRTUS_KILL_ARRAY findIf {_x select 0 == _groupName};

if(_virtusIndex isEqualTo -1) then {
VIRTUS_KILL_ARRAY pushBack [_groupName, 15];
}else {
private _old = VIRTUS_KILL_ARRAY select _index select 1;
(VIRTUS_KILL_ARRAY select _index) set [1, _old + 15];
};