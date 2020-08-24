disableSerialization;
private _display = findDisplay 39400;
private _vehicleList = _display displayCtrl 39401;
private _priceTag = _display displayCtrl 39402;
private _index = lbCurSel _vehicleList;
private _geGang = SCHILD_DEALER getVariable ["Zone_Dealer_Winner", "-1"];

if(_index isEqualTo -1) exitWith {["Du musst ein Fahrzeug auswählen!", "ChopShop"] spawn life_fnc_message;};
private _netID = _vehicleList lbData _index;
if(_netID == "") exitWith {};

private _vehicle = objectFromNetId _netID;
if(isNull _vehicle) exitWith {};
if(!(alive _vehicle) || count crew _vehicle > 0 || _vehicle distance CHOP_SHOP_INFOSTAND > 50 || isEngineOn _vehicle || speed _vehicle > 10) exitWith {};
if(_vehicle getVariable ["event_vehicle", false]) exitWith {["Du kannst keine Event Fahrzeuge verkaufen.", "ChopShop"] spawn life_fnc_message;};
if(_vehicle getVariable ["rent", false]) exitWith {["Du kannst keine gemieteten Fahrzeuge verkaufen.", "ChopShop"] spawn life_fnc_message;};
private _chopPlayer = _vehicle getVariable ["chopShop", objNull];
if(!(isNull _chopPlayer)) exitWith {["Das Fahrzeug wird gerade schon verkauft.", "ChopShop"] spawn life_fnc_message;};

private _vehicleInfo = _vehicle getVariable ["dbInfo", []];
private _vehicleOwner = _vehicleInfo param [0, "-1"];
private _isInGang = false;
private _title = "Verkaufe Fahrzeug (Bleibe in 15m Radius)";
private _bad = false;

{
private _currentName = _x getVariable ["gang_name", ""];
private _currentMembers = _x getVariable ["gang_members", []];
if(_geGang == _currentName) then {
if(_vehicleOwner in _currentMembers) exitWith {_isInGang = true;};
};
}forEach allGroups;

private _vehicleLegal = (getNumber (missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle >> "legal")) isEqualTo 1;

if(!NIGHT && _vehicleLegal) exitWith {["Der Chop Shop ist aktuell, für legale Fahrzeuge, tagsüber deaktiviert", "Chop Shop"] spawn life_fnc_message;};

if(_isInGang) exitWith {["Die Gang des Spielers hat die Gangeroberung gewonnen. Du kannst sein Fahrzeug nicht verkaufen!", "ChopShop"] spawn life_fnc_message;};
_vehicle setVariable ["chopShop", player, true];
life_action_inUse = true;

5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...", "%", _title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    sleep 6;
if (isNull _ui) then {
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNamespace getVariable "life_progress";
	_progressBar = _ui displayCtrl 38201;
	_titleText = _ui displayCtrl 38202;
};
    _cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...", round (_cP * 100), "%", _title];
    if(_cP >= 1) exitWith {};
	if(life_isDead || !(isNull objectParent player) || player distance CHOP_SHOP_INFOSTAND > 15 || {(_vehicle getVariable ["chopShop", objNull]) != player} || {player getVariable ["restrained", false]}) exitWith {_bad = true;};
	if(isNull _vehicle || {!(alive _vehicle) || count crew _vehicle > 0 || _vehicle distance CHOP_SHOP_INFOSTAND > 50 || isEngineOn _vehicle || speed _vehicle > 10}) exitWith {_bad = true;};
};

_vehicle setVariable ["chopShop", nil, true];
life_action_inUse = false;
5 cutText ["","PLAIN"];
if(_bad) exitWith {};

private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
private _chopPrice = [typeOf _vehicle] call life_fnc_getVehicleChopPrice;

[format ["Du hast einen %1 für %2€ verkauft", _vehicleName, [_chopPrice] call life_fnc_numberText], "Fahrzeug verkauft"] spawn life_fnc_message;
CASH = CASH + _chopPrice;
[player, _vehicle, _chopPrice] remoteExecCall ["HC_fnc_chopShopSell", HC_Life];
closeDialog 0;
