if(isNull findDisplay 4350) then {createDialog "ZInv";};

private _display = findDisplay 4350;
private _itemList = _display displayCtrl 4351;
private _licenseList = _display displayCtrl 4352;
private _playerCombo = _display displayCtrl 4353;
private _editAmount = _display displayCtrl 4354;

private _textKonto = _display displayCtrl 4355;
private _textBar = _display displayCtrl 4356;
private _textWeight = _display displayCtrl 4357;

private _gangBtn = _display displayCtrl 4367;

private _extraBtn1 = _display displayCtrl 4374;
private _extraBtn2 = _display displayCtrl 4375;
private _extraBtn3 = _display displayCtrl 4376;
private _extraBtn4 = _display displayCtrl 4377;
private _extraBtn5 = _display displayCtrl 4378;
private _extraBtn6 = _display displayCtrl 4379;

_extraBtn6 ctrlSetText "Speichern";
_extraBtn6 buttonSetAction "[] call SOCK_fnc_save;";

lbClear _itemList;
lbClear _licenseList;

{
private _item = _x select 0;
private _amount = _x select 1;
if(_amount > 0) then {
private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");
private _tooltip = getText (missionConfigFile >> "Items" >> _item >> "itemInfo");
_itemList lbAdd format["%1x - %2", _amount, _displayName];
_itemList lbSetData [(lbSize _itemList)-1, _item];
if(_tooltip != "") then {_itemList lbSetToolTip [(lbSize _itemList)-1, _tooltip];};
};
}forEach life_virt_gear;

{
_displayName = localize (getText(missionConfigFile >> "Licenses" >> _x >> "displayName"));
_licenseList lbAdd _displayName;
}forEach LICENSES;

if(lbSize _licenseList isEqualTo 0) then {_licenseList lbAdd "Du hast keine Lizenzen";};

_textKonto ctrlSetText format ["€%1", [BANK] call life_fnc_numberText];
_textBar ctrlSetText format ["€%1", [CASH] call life_fnc_numberText];
_textWeight ctrlSetText format ["%1 / %2", life_carryWeight, life_maxWeight];

_extraBtn1 ctrlShow false;
_extraBtn2 ctrlShow false;
_extraBtn3 ctrlShow false;
_extraBtn4 ctrlShow false;
_extraBtn5 ctrlShow false;

_gangBtn ctrlEnable (playerSide in [civilian, east]);

if(playerSide isEqualTo west) then {
_extraBtn1 ctrlShow true;
_extraBtn1 ctrlSetText "Notrufsystem";
_extraBtn1 buttonSetAction "[] call life_fnc_openEmergencyMenu;";
_extraBtn2 ctrlShow true;
_extraBtn2 ctrlSetText "WantedList";
_extraBtn2 buttonSetAction "[] call life_fnc_openFahndung;";
_extraBtn3 ctrlShow true;
_extraBtn3 ctrlSetText "WantedList+";
_extraBtn3 buttonSetAction "[] call life_fnc_openFahndungAdd;";
_extraBtn4 ctrlShow true;
_extraBtn4 ctrlSetText "Streifensystem";
_extraBtn4 buttonSetAction "[] call life_fnc_openStreifensystem;";

if(call life_coplevel >= 8) then {
_extraBtn5 ctrlShow true;
_extraBtn5 ctrlSetText "Cop Spectate";
_extraBtn5 buttonSetAction "[] call life_fnc_openCopSpectate;";
};
};

if(playerSide isEqualTo independent) then {
_extraBtn4 ctrlShow true;
_extraBtn4 ctrlSetText "Notrufsystem";
_extraBtn4 buttonSetAction "[] call life_fnc_openEmergencyMenu;";
_extraBtn5 ctrlShow true;
_extraBtn5 ctrlSetText "Verlassene Fahrzeuge";
_extraBtn5 buttonSetAction "[] spawn life_fnc_showAbandonedVehicles;";
};