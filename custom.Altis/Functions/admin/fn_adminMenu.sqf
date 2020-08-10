disableSerialization;
private _adminLvl = call life_adminlevel;
if(_adminLvl < 2) exitWith {};

if(isNull findDisplay 3800) then {createDialog "Admin";};

private _display = findDisplay 3800;
private _list = _display displayCtrl 3801;
lbClear _list;

private _BtnInfo = _display displayCtrl 3805;
private _BtnSupporter = _display displayCtrl 3806;
private _BtnInvisible = _display displayCtrl 3807;
private _BtnTeleport = _display displayCtrl 3808;
private _BtnSupportTell = _display displayCtrl 3809;
private _BtnFreeze = _display displayCtrl 3810;
private _BtnMoney = _display displayCtrl 3811;
private _BtnBackup = _display displayCtrl 3812;

private _red = [0.81, 0.34, 0.41, 1];
private _blau = [0, 0.3, 1, 1];
private _pink = [0.3, 0.3, 0.5, 1];
private _gruen = [0, 0.3, 0, 1];
private _orange = [0.73, 0.24, 0.11, 1];

{
private _color = switch (side _x) do { case (!(isNull objectParent _x)) : {_orange}; case civilian : {_pink}; case east : {_red}; case west : {_blau}; case independent : {_gruen};};
private _picture = getText (configFile >> "CfgWeapons" >> (if((primaryWeapon _x) != "") then {primaryWeapon _x} else {uniform _x}) >> "Picture");

_list lbAdd (name _x);
_list lbSetData [(lbSize _list)-1, str _x];
_list lbSetColor [(lbSize _list)-1, _color];
_list lbSetPicture [(lbSize _list)-1, _picture];
}foreach playableUnits;

_BtnInfo ctrlEnable (_adminLvl >= 2);
_BtnSupporter ctrlEnable (_adminLvl >= 2);
_BtnInvisible ctrlEnable (_adminLvl >= 3);
_BtnTeleport ctrlEnable (_adminLvl >= 3);
_BtnSupportTell ctrlEnable (_adminLvl >= 3);
_BtnFreeze ctrlEnable (_adminLvl >= 4);
_BtnMoney ctrlEnable (_adminLvl >= 5);
_BtnBackup ctrlEnable (_adminLvl >= 5);