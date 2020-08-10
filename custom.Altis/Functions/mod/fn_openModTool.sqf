disableSerialization;
private _adminLvl = call life_adminlevel;

if(!(_adminLvl in [1, 5]) || !(isNull findDisplay 100000)) exitWith {};
createDialog "life_mod_menu";

private _display = findDisplay 100000;
private _playerList = _display displayCtrl 100021;
private _teamList = _display displayCtrl 100022;
lbClear _playerList;
lbClear _teamList;

private _Btn1 = _display displayCtrl 100001;
private _Btn2 = _display displayCtrl 100002;
private _Btn3 = _display displayCtrl 100003;
private _Btn4 = _display displayCtrl 100004;
private _Btn5 = _display displayCtrl 100005;
private _Btn6 = _display displayCtrl 100006;
private _Btn7 = _display displayCtrl 100007;

private _Btn8 = _display displayCtrl 100008;
private _Btn9 = _display displayCtrl 100009;
private _Btn10 = _display displayCtrl 100010;

private _Btn11 = _display displayCtrl 100011;
private _Btn12 = _display displayCtrl 100012;
private _Btn13 = _display displayCtrl 100013;
private _Btn14 = _display displayCtrl 100014;

private _Btn15 = _display displayCtrl 100015;

private _Btn16 = _display displayCtrl 100016;
private _Btn17 = _display displayCtrl 100017;
private _Btn18 = _display displayCtrl 100018;
private _Btn19 = _display displayCtrl 100019;
private _Btn20 = _display displayCtrl 100020;


private _blau = [0, 0.3, 1, 1];
private _pink = [0.3, 0.3, 0.5, 1];
private _gruen = [0, 0.3, 0, 1];
private _orange = [0.73, 0.24, 0.11, 1];

private _team = [] call life_fnc_getAdmins;
private _spieler = playableUnits - _team;

{
_playerList lbAdd (name _x);
_playerList lbSetData [(lbSize _playerList)-1, str (_x)];
}foreach _spieler;

{
_teamList lbAdd (name _x);
_teamList lbSetdata [(lbSize _teamList)-1, str (_x)];
}foreach _team;

private _accessP = (bank_obj getVariable ["mod_access_player", false]) isEqualTo true;
private _accessE = (bank_obj getVariable ["mod_access_event", false]) isEqualTo true;
private _accessEC = (bank_obj getVariable ["mod_access_eventc", false]) isEqualTo true;
private _accessV = (bank_obj getVariable ["mod_access_vehicle", false]) isEqualTo true;

private _extraAccess = (player getVariable ["isListed", false]) isEqualTo true;

if(_accessP) then {
_Btn16 ctrlSetBackgroundColor [0.1, 1, 0, 0.8];
_Btn16 ctrlSetText "Player Action sperren";
}else {
_Btn16 ctrlSetBackgroundColor [1, 0.1, 0, 0.8];
_Btn16 ctrlSetText "Player Action freigeben";
};

if(_accessE) then {
_Btn17 ctrlSetBackgroundColor [0.1, 1, 0, 0.8];
_Btn17 ctrlSetText "Event Action sperren";
}else {
_Btn17 ctrlSetBackgroundColor [1, 0.1, 0, 0.8];
_Btn17 ctrlSetText "Event Action freigeben";
};

if(_accessEC) then {
_Btn20 ctrlSetBackgroundColor [0.1, 1, 0, 0.8];
_Btn20 ctrlSetText "Event Control sperren";
}else {
_Btn20 ctrlSetBackgroundColor [1, 0.1, 0, 0.8];
_Btn20 ctrlSetText "Event Control freigeben";
};

if(_accessV) then {
_Btn18 ctrlSetBackgroundColor [0.1, 1, 0, 0.8];
_Btn18 ctrlSetText "Vehicle Action sperren";
}else {
_Btn18 ctrlSetBackgroundColor [1, 0.1, 0, 0.8];
_Btn18 ctrlSetText "Vehicle Action freigeben";
};

{(_x select 0) ctrlEnable (_x select 1);}forEach [[_Btn1, _accessP || _extraAccess || _adminLvl isEqualTo 5], [_Btn2, _accessP || _extraAccess || _adminLvl isEqualTo 5], [_Btn3, _accessP || _extraAccess || _adminLvl isEqualTo 5], [_Btn4, _accessP || _extraAccess || _adminLvl isEqualTo 5], [_Btn5, _accessP || _extraAccess || _adminLvl isEqualTo 5], [_Btn6, _accessP || _extraAccess || _adminLvl isEqualTo 5], [_Btn7, _accessP || _extraAccess || _adminLvl isEqualTo 5], [_Btn8, _accessEC || _extraAccess || _adminLvl isEqualTo 5], [_Btn9, _accessEC || _extraAccess || _adminLvl isEqualTo 5], [_Btn10, _accessEC || _extraAccess || _adminLvl isEqualTo 5], [_Btn11, _accessE || _extraAccess || _adminLvl isEqualTo 5], [_Btn12, _accessE || _extraAccess || _adminLvl isEqualTo 5], [_Btn13, _accessE || _extraAccess || _adminLvl isEqualTo 5], [_Btn14, _accessE || _extraAccess || _adminLvl isEqualTo 5], [_Btn15, _accessV || _extraAccess || _adminLvl isEqualTo 5], [_Btn16, _adminLvl isEqualTo 5], [_Btn17, _adminLvl isEqualTo 5], [_Btn18, _adminLvl isEqualTo 5], [_Btn19, _adminLvl isEqualTo 5], [_Btn20, _adminLvl isEqualTo 5]];