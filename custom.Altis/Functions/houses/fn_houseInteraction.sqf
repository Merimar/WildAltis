disableSerialization;
private _target = param [0, objNull];
if(isNull _target || !(isNull findDisplay 6000)) exitWith {};
if(NO_INTERACTION) exitWith {};
if(!(isClass (missionConfigFile >> "CfgHouses" >> typeOf _target))) exitWith {}; 
if(playerSide in [west, independent]) exitWith {};

private _houseBought = _target getVariable ["house_bought", false];
private _houseID = _target getVariable ["house_id", -1];
private _houseInfo = _target getVariable ["house_information", []];
private _houseUpgrades = _target getVariable ["house_upgrades", []];
private _group = group player;
private _leader = ((_houseInfo param [2, ""]) == getPlayerUID player);

if(!("haus" in LICENSES) && !_houseBought) exitWith {["", "Du brauchst eine Hauseintümerlizenz"] spawn life_fnc_message;};

CURRENT_HOUSE_TARGET = _target;
GARAGE_SETTING = false;

createDialog "Interaction";
private _display = findDisplay 6000;
private _btn1 = _display displayCtrl 6001;
private _btn2 = _display displayCtrl 6002;
private _btn3 = _display displayCtrl 6003;
private _btn4 = _display displayCtrl 6004;
private _btn5 = _display displayCtrl 6005;
private _btn6 = _display displayCtrl 6006;
private _btn7 = _display displayCtrl 6007;
private _btn8 = _display displayCtrl 6008;
private _allControls = [["markt", _btn2], ["atm", _btn3], ["garage", _btn4], ["generalstore", _btn5]];

_btn1 ctrlShow false;
_btn2 ctrlShow false;
_btn3 ctrlShow false;
_btn4 ctrlShow false;
_btn5 ctrlShow false;
_btn6 ctrlShow false;
_btn7 ctrlShow false;
_btn8 ctrlShow false;

private _houseType = if("Garage" in typeOf _target) then {"Garage"} else {"Haus"};

if(_houseBought) then {
if(!_leader) exitWith {
_btn1 ctrlShow true;
_btn1 ctrlSetText "Haus ist bereits gekauft";
_btn1 ctrlEnable false;
};

if((_houseInfo select 1) == "") then {
_btn1 ctrlShow true;
_btn1 ctrlSetText format ["%1 verkaufen", _houseType];
_btn1 buttonSetAction "[false] spawn life_fnc_houseSell;";

if(_houseType == "Garage") then {
_btn2 ctrlShow true;
_btn3 ctrlShow true;
_btn2 ctrlSetText "Garage öffnen";
_btn3 ctrlSetText "Garage setzen";
_btn2 buttonSetAction "[""Car"", ""HOUSE"", civilian] call life_fnc_openGarage;";
_btn3 buttonSetAction "[false] spawn life_fnc_houseGarageSet;";
};

}else {
_btn1 ctrlShow true;
_btn2 ctrlShow true;
_btn3 ctrlShow true;
_btn4 ctrlShow true;
_btn5 ctrlShow true;
_btn6 ctrlShow true;
_btn7 ctrlShow true;

_btn1 ctrlSetText "Ganghaus verkaufen";
_btn2 ctrlSetText "Markt";
_btn3 ctrlSetText "ATM";
_btn4 ctrlSetText "Garage";
_btn5 ctrlSetText "Generalstore";
_btn6 ctrlSetText "Garage setzen";
_btn7 ctrlSetText "Medizinische Hilfe";

_btn1 buttonSetAction "[true] spawn life_fnc_houseSell;";
_btn2 buttonSetAction "[""reb"", objNull] call life_fnc_virt_menu;";
_btn3 buttonSetAction "[] call life_fnc_atmMenu;";
_btn4 buttonSetAction "[""Car"", ""GANG"", civilian] call life_fnc_openGarage;";
_btn5 buttonSetAction "[""Gang Shop"", ""generalstore"", sideUnknown] call life_fnc_weaponShopMenu;";
_btn6 buttonSetAction "[true] spawn life_fnc_houseGarageSet;";
_btn7 buttonSetAction "[] spawn life_fnc_medHilfe;";

if(_houseInfo select 1 == (_group getVariable ["gang_name", ""])) then {
_btn7 ctrlEnable true;
_btn1 ctrlEnable _leader;
_btn6 ctrlEnable _leader;

{
private _upgrade = _x select 0;
private _amount = _x select 1;

{
private _upgradeType = _x select 0;
private _btnCtrl = _x select 1;
if(_upgradeType == _upgrade) then {_btnCtrl ctrlEnable (_amount != 0);};
}forEach _allControls;
}forEach _houseUpgrades;
}else {
_btn1 ctrlEnable false;
_btn2 ctrlEnable false;
_btn3 ctrlEnable false;
_btn4 ctrlEnable false;
_btn5 ctrlEnable false;
_btn6 ctrlEnable false;
_btn7 ctrlEnable false;
};
};
}else {
_btn1 ctrlShow true;
_btn2 ctrlShow true;
_btn3 ctrlShow true;
_btn1 ctrlSetText "Haus kaufen (Gang)";
_btn2 ctrlSetText "Haus kaufen (Spieler)";
_btn3 ctrlSetText "Haus Preis anschauen";
_btn1 buttonSetAction "[true] spawn life_fnc_houseBuy;";
_btn2 buttonSetAction "[false] spawn life_fnc_houseBuy;";
_btn3 buttonSetAction "[] call life_fnc_houseInfo;";
};