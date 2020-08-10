disableSerialization;
private _upgrade = param [0, ""];
private _display = findDisplay 4300;
if(isNull _display || _upgrade == "") exitWith {};

private _group = group player;
private _gangRank = [player, group player] call life_fnc_getGangRank;
private _gangBank = _group getVariable ["gang_bank", 0];
private _gangID = _group getVariable ["gang_id", 0];
private _allHouses = bank_obj getVariable ["gang_houses", []];
private _houseIndex = _allHouses findIf {((_x getVariable ["house_information", []]) param [0, -1]) isEqualTo _gangID};
if(_houseIndex isEqualTo -1) exitWith {["", "Euer Ganghaus wurde verkauft"] spawn life_fnc_message;};
private _houseObj = _allHouses select _houseIndex;
private _upgrades = _houseObj getVariable ["house_upgrades", []];
private _checkIndex = _upgrades findIf {(_x select 0) == _upgrade && (_x select 1) isEqualTo 1};
if(_checkIndex != -1) exitWith {["Euer Ganghaus hat dieses Upgrade bereits", "Gang Upgrades"] spawn life_fnc_message;};

private _name = getText (missionConfigFile >> "CfgHouseUpgrades" >> _upgrade >> "name");
private _description = getText (missionConfigFile >> "CfgHouseUpgrades" >> _upgrade >> "description");
private _price = getNumber (missionConfigFile >> "CfgHouseUpgrades" >> _upgrade >> "price");

private _action = [format ["Möchtest du das %1 wirklich für €%2 kaufen?", _name, [_price] call life_fnc_numberText], "Upgrade kaufen", "Ja", "Nein"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

if(_gangRank < 4) exitWith {["Du Kannst dir Ganghaus Upgrades erst ab Ganglevel 4 kaufen!", "Gang Upgrade"] spawn life_fnc_message;};
if(_gangBank < _price) exitWith {[format ["Ihr könnt euch das %1 nicht leisten. Das Upgrade kostet €%2", _name, [_price] call life_fnc_numberText], "Gang Upgrade"] spawn life_fnc_message;};

[player, _group, _upgrade] remoteExec ["HC_fnc_gangHouseUpgrade", HC_LIFE];
[format ["Du hast das %1 für deine Gang gekauft!<br/>%2", _name, _description], "Gang Upgrade"] spawn life_fnc_message;

private _upgradeIndex = _upgrades findIf {(_x select 0) == _upgrade && (_x select 1) isEqualTo 0};
if(_upgradeIndex isEqualTo -1) exitWith {};
(_upgrades select _upgradeIndex) set [1, 1];
_houseObj setVariable ["house_upgrades", _upgrades, true];

[] call life_fnc_openGangHouse;