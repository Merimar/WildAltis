disableSerialization;
if(isNull findDisplay 4300) then {createDialog "GangHaus";};
private _display = findDisplay 4300;
private _mapCtrl = _display displayCtrl 4301;
private _upgradeMarktCtrl = _display displayCtrl 4302;
private _upgradeATMCtrl = _display displayCtrl 4303;
private _upgradeGarageCtrl = _display displayCtrl 4304;
private _upgradeGeneralstoreCtrl = _display displayCtrl 4305;
private _marktBtn = _display displayCtrl 4306;
private _atmBtn = _display displayCtrl 4307;
private _garageBtn = _display displayCtrl 4308;
private _generalstoreBtn = _display displayCtrl 4309;
private _allControls = [["markt", _marktBtn, _upgradeMarktCtrl], ["atm", _atmBtn, _upgradeATMCtrl], ["garage", _garageBtn, _upgradeGarageCtrl], ["generalstore", _generalstoreBtn, _upgradeGeneralstoreCtrl]];
private _gangID = (group player) getVariable ["gang_id", 0];
private _allHouses = bank_obj getVariable ["gang_houses", []];
private _houseIndex = _allHouses findIf {((_x getVariable ["house_information", []]) param [0, -1]) isEqualTo _gangID};
if(_houseIndex isEqualTo -1) exitWith {closeDialog 0; ["", "Eure Gang besitzt kein Ganghaus"] spawn life_fnc_message;};
private _houseObj = _allHouses select _houseIndex;
private _houseName = typeOf _houseObj;
private _upgrades = _houseObj getVariable ["house_upgrades", []];
private _gangRank = [player, group player] call life_fnc_getGangRank;

_mapCtrl ctrlMapAnimAdd [1, 0.1, getPos _houseObj];
ctrlMapAnimCommit _mapCtrl;

{
private _upgrade = _x select 0;
private _amount = _x select 1;

{
private _upgradeType = _x select 0;
private _btnCtrl = _x select 1;
private _textCtrl = _x select 2;
private _price = getNumber (missionConfigFile >> "CfgHouseUpgrades" >> _upgradeType >> "price");

if(_upgradeType == _upgrade) then {
	_textCtrl ctrlEnable false;
	if(_amount isEqualTo 0) then {
		_btnCtrl ctrlEnable true;
		_textCtrl ctrlSetText format ["€%1", [_price] call life_fnc_numberText];
	}else {
		_btnCtrl ctrlEnable false;
		_textCtrl ctrlSetText "Upgrade gekauft";
	};
};

if(_gangRank < 4) then {_btnCtrl ctrlEnable false;};
}forEach _allControls;
}forEach _upgrades;