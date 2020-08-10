private _unit = param [0, objNull, [objNull]];
private _group = param [1, grpNull, [grpNull]];
private _upgrade = param [2, "", [""]];

private _isHacker = [[_upgrade], _unit, remoteExecutedOwner, "fn_gangHouseUpgrade"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _group || !(_upgrade in ["markt", "atm", "garage", "generalstore"])) exitWith {};

private _upgradeName = getText (missionConfigFile >> "CfgHouseUpgrades" >> _upgrade >> "name");
private _upgradeDescription = getText (missionConfigFile >> "CfgHouseUpgrades" >> _upgrade >> "description");
private _upgradePrice = getNumber (missionConfigFile >> "CfgHouseUpgrades" >> _upgrade >> "price");
private _groupName = _group getVariable ["gang_name", ""];
private _groupBank = _group getVariable ["gang_bank", 0];
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _groupName};

if(_gangIndex isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte das %4 für seine Gang kaufen, die Gang existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit, _upgradeName];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangUpgrade Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangUpgrade Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _gangID = _gangInformation select 0;
private _gangBank = _gangInformation select 5;
private _gangHouse = _gangInformation select 9;
private _gangUpgrades = _gangInformation select 10;

if(_gangBank != _groupBank || _gangBank < _upgradePrice) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte das %4 für seine Gang kaufen, die Gang hat allerdings nicht genug Geld (%5 != %6)", name _unit, getPlayerUID _unit, side _unit, _upgradeName, [_groupBank] call HC_fnc_numberSafe, [_gangBank] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangUpgrade Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangUpgrade Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _houseID = _gangHouse param [0, -1];
if(_houseID isEqualTo -1) exitWith {};

private _upgradeIndex = _gangUpgrades findIf {(_x select 0) == _upgrade};
private _upgradeState = _gangUpgrades param [_upgradeIndex, 1];
if(_upgradeState isEqualTo 1) exitWith {};

private _newAmount = _groupBank - _upgradePrice;

_gangUpgrades set [_upgradeIndex, 1];
_gangInformation set [5, _newAmount];
_group setVariable ["gang_bank", _newAmount, true];

private _query = format ["UPDATE house_upgrades SET amount = '1' WHERE house_id = '%1' AND upgrade = '%2'", _houseID, _upgrade];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["UPDATE gangs SET bank_balance = '%1' WHERE uid='%2' AND deleted_at IS NULL", _newAmount, _gangID];
[_query, 1] call HC_fnc_asyncCall;

private _msg = format ["Der Spieler %1 (%2 - %3) hat das %4 für seine Gang %5 gekauft", name _unit, getPlayerUID _unit, side _unit, _upgradeName, _groupName];
["GangLog", _msg] call HC_fnc_Log;
