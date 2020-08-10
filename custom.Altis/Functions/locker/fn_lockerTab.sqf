disableSerialization;
private _tab = param [0, 0];
CURRENT_TAB = _tab;
private _btnList = [398002, 398003, 398004];
private _ctrlList = [[398007, 398008, 398009, 398010, 398011, 398012, 398013, 398014, 398015, 398016, 398017, 398018, 398101, 398102, 398103, 398104, 398105, 398106], [398005, 398006, 398019, 398020, 398021, 398022, 398023, 398024, 398025, 398026, 398027, 398028, 398029, 398030, 398031, 398032, 398033, 398034, 398035, 398036, 398037, 398038, 398107, 398108, 398109, 398110, 398111, 398112, 398113, 398114], [398039, 398040, 398115, 398116]];
private _display = findDisplay 398000;
private _disableBtn = _display displayCtrl (_btnList select _tab);
{(_display displayCtrl _x) ctrlEnable true;}forEach _btnList;
//_disableBtn ctrlEnable false;

private _header = _display displayCtrl 398001;
ctrlSetFocus _header;

{
private _index = _forEachIndex;
{
(_display displayCtrl _x) ctrlShow (_index isEqualTo _tab);
if(!(_x in [398005, 398006])) then {
(_display displayCtrl _x) lbSetCurSel -1;
};
}forEach _x;
}forEach _ctrlList;

switch (_tab) do {

case 0 : {
private _helmetList = _display displayCtrl 398007;
private _glassesList = _display displayCtrl 398008;
private _binocularList = _display displayCtrl 398009;
private _uniformList = _display displayCtrl 398010;
private _vestList = _display displayCtrl 398011;
private _backpackList = _display displayCtrl 398012;

private _helmet = _display displayCtrl 398013;
private _glasses = _display displayCtrl 398014;
private _binocular = _display displayCtrl 398015;
private _uniform = _display displayCtrl 398016;
private _vest = _display displayCtrl 398017;
private _backpack = _display displayCtrl 398018;

_helmet ctrlSetTooltip "Helm";
_glasses ctrlSetTooltip "Brille";
_binocular ctrlSetTooltip "Fernglas";
_uniform ctrlSetTooltip "Uniform";
_vest ctrlSetTooltip "Weste";
_backpack ctrlSetTooltip "Rucksack";

private _listArray = [_uniformList, _vestList, _backpackList, _helmetList, _glassesList, _binocularList];
{lbClear _x;}forEach [_helmetList, _glassesList, _binocularList, _uniformList, _vestList, _backpackList, _helmet, _glasses, _binocular, _uniform, _vest, _backpack];

{
private _className = _x select 0;
private _amount = _x select 1;
if(_amount > 0) then {
private _itemType = ([_className] call life_fnc_getItemType) - 5;
if(_itemType in [0, 1, 2, 3, 4, 5]) then {
private _itemList = _listArray select _itemType;
private _itemInfo = [_className] call life_fnc_fetchCfgDetails;
private _displayName = _itemInfo select 1;
private _picture = _itemInfo select 2;
_itemList lbAdd format ["%1 (%2)", _displayName, _amount];
_itemList lbSetPicture [(lbSize _itemList)-1, _picture];
_itemList lbSetData [(lbSize _itemList)-1, _className];
_itemList lbSetValue [(lbSize _itemList)-1, _amount];
};
};
}forEach LOCKER;

{
private _xList = _x select 0;
private _xMsg = _x select 1;
if(lbSize _xList isEqualTo 0) then {_xList lbAdd _xMsg;_xList lbSetData [lbSize (_xList)-1, ""];};
}forEach [[_helmetList, "Keine Kopfbedeckungen verfügbar"], [_glassesList, "Keine Brillen verfügbar"], [_binocularList, "Keine Ferngläser verfügbar"], [_uniformList, "Keine Uniformen verfügbar"], [_vestList, "Keine Westen verfügbar"], [_backpackList, "Keine Rucksäcke verfügbar"]];

lbSort _helmetList;
lbSort _glassesList;
lbSort _binocularList;
lbSort _uniformList;
lbSort _vestList;
lbSort _backpackList;

{
private _gear = _x select 0;
private _gearList = _x select 1;
private _default = _x select 2;
if(_gear == "") then {
_gearList lbAdd "";
_gearList lbSetData [lbSize (_gearList)-1, ""];
_gearList lbSetPicture[lbSize(_gearList)-1, _default];
}else {
private _itemInfo = [_gear] call life_fnc_fetchCfgDetails;
private _gearClassname = _itemInfo select 0;
private _displayName = _itemInfo select 1;
private _picture = _itemInfo select 2;
_gearList lbAdd _displayName;
_gearList lbSetPicture[lbSize(_gearList)-1, _picture];
_gearList lbSetTooltip[lbSize(_gearList)-1, _displayName];
_gearList lbSetData[lbSize(_gearList)-1, _gearClassname];
};
}forEach [[headgear player, _helmet, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa"], [goggles player, _glasses, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_glasses_gs.paa"], [binocular player, _binocular, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa"], [uniform player, _uniform, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa"], [vest player, _vest, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa"], [backpack player, _backpack, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa"]];

};


case 1 : {
private _countLocker = _display displayCtrl 398005;
private _countPlayer = _display displayCtrl 398006;
private _primaryLockerList = _display displayCtrl 398019;
private _secondaryLockerList = _display displayCtrl 398020;
private _attachmentLockerList = _display displayCtrl 398021;
private _magazineLockerList = _display displayCtrl 398022;
private _primaryPlayerWeapon = _display displayCtrl 398023;
private _secondaryPlayerWeapon = _display displayCtrl 398024;
private _handgunPlayerWeapon = _display displayCtrl 398025;
private _magazinePlayerList = _display displayCtrl 398026;
private _pSilencer = _display displayCtrl 398027;
private _pScope = _display displayCtrl 398028;
private _pPointer = _display displayCtrl 398029;
private _pBipod = _display displayCtrl 398030;
private _sSilencer = _display displayCtrl 398031;
private _sScope = _display displayCtrl 398032;
private _sPointer = _display displayCtrl 398033;
private _sBipod = _display displayCtrl 398034;
private _hSilencer = _display displayCtrl 398035;
private _hScope = _display displayCtrl 398036;
private _hPointer = _display displayCtrl 398037;
private _hBipod = _display displayCtrl 398038;

_primaryPlayerWeapon ctrlSetTooltip "Primärwaffe";
_secondaryPlayerWeapon ctrlSetTooltip "Raketenwerfer";
_handgunPlayerWeapon ctrlSetTooltip "Pistole";

{
(_x select 0) ctrlSetTooltip "Schalldämpfer";
(_x select 1) ctrlSetTooltip "Visier";
(_x select 2) ctrlSetTooltip "Aufsatz";
(_x select 3) ctrlSetTooltip "Standbein";
}forEach [[_pSilencer, _pScope, _pPointer, _pBipod], [_sSilencer, _sScope, _sPointer, _sBipod], [_hSilencer, _hScope, _hPointer, _hBipod]];

{lbClear _x;}forEach [_primaryLockerList, _secondaryLockerList, _attachmentLockerList, _magazineLockerList, _primaryPlayerWeapon, _secondaryPlayerWeapon, _handgunPlayerWeapon, _magazinePlayerList, _pSilencer, _pScope, _pPointer, _pBipod, _sSilencer, _sScope, _sPointer, _sBipod, _hSilencer, _hScope, _hPointer, _hBipod];

{
private _className = _x select 0;
private _amount = _x select 1;
if(_amount > 0) then {
private _itemType = ([_className] call life_fnc_getItemType);
private _itemList = switch (true) do {
case (_itemType in [0, 2]) : {_primaryLockerList};
case (_itemType in [1]) : {_secondaryLockerList};
case (_itemType in [3]) : {_magazineLockerList};
case (_itemType in [4]) : {_attachmentLockerList};
default {""};
};
if(_itemList isEqualType _primaryLockerList) then {
private _itemInfo = [_className] call life_fnc_fetchCfgDetails;
private _displayName = _itemInfo select 1;
private _picture = _itemInfo select 2;
_itemList lbAdd format ["%1 (%2)", _displayName, _amount];
_itemList lbSetPicture [(lbSize _itemList)-1, _picture];
_itemList lbSetData [(lbSize _itemList)-1, _className];
_itemList lbSetValue [(lbSize _itemList)-1, _amount];
};
};
}forEach LOCKER;

{
private _xList = _x select 0;
private _xMsg = _x select 1;
if(lbSize _xList isEqualTo 0) then {_xList lbAdd _xMsg;_xList lbSetData [lbSize (_xList)-1, ""];};
}forEach [[_primaryLockerList, "Keine Waffen verfügbar"], [_secondaryLockerList, "Keine Raketenwerfer verfügbar"], [_attachmentLockerList, "Keine Attachments verfügbar"], [_magazineLockerList, "Keine Magazine verfügbar"]];

lbSort _primaryLockerList;
lbSort _secondaryLockerList;
lbSort _attachmentLockerList;
lbSort _magazineLockerList;

{
private _gear = _x select 0;
private _attachments = _x select 1;
private _gearList = _x select 2;
private _attachmentArray = _x select 3;
private _default = _x select 4;

if(_gear == "") then {
_gearList lbAdd "";
_gearList lbSetData [lbSize (_gearList)-1, ""];
_gearList lbSetPicture[lbSize(_gearList)-1, _default];
(_attachmentArray select 0) lbAdd "";
(_attachmentArray select 0) lbSetData [lbSize ((_attachmentArray select 0))-1, ""];
(_attachmentArray select 0) lbSetPicture[lbSize((_attachmentArray select 0))-1, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa"];
(_attachmentArray select 1) lbAdd "";
(_attachmentArray select 1) lbSetData [lbSize ((_attachmentArray select 1))-1, ""];
(_attachmentArray select 1) lbSetPicture[lbSize((_attachmentArray select 0))-1, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa"];
(_attachmentArray select 2) lbAdd "";
(_attachmentArray select 2) lbSetData [lbSize ((_attachmentArray select 2))-1, ""];
(_attachmentArray select 2) lbSetPicture[lbSize((_attachmentArray select 0))-1, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa"];
(_attachmentArray select 3) lbAdd "";
(_attachmentArray select 3) lbSetData [lbSize ((_attachmentArray select 3))-1, ""];
(_attachmentArray select 3) lbSetPicture[lbSize((_attachmentArray select 0))-1, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa"];
}else {
private _itemInfo = [_gear] call life_fnc_fetchCfgDetails;
private _gearClassname = _itemInfo select 0;
private _displayName = _itemInfo select 1;
private _picture = _itemInfo select 2;
_gearList lbAdd _displayName;
_gearList lbSetPicture[lbSize(_gearList)-1, _picture];
_gearList lbSetTooltip[lbSize(_gearList)-1, _displayName];
_gearList lbSetData[lbSize(_gearList)-1, _gearClassname];

if(_attachments select 0 == "") then {
(_attachmentArray select 0) lbAdd "";
(_attachmentArray select 0) lbSetData [lbSize ((_attachmentArray select 0))-1, ""];
(_attachmentArray select 0) lbSetPicture[lbSize((_attachmentArray select 0))-1, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa"];
}else {
private _itemInfo = [_attachments select 0] call life_fnc_fetchCfgDetails;
private _gearClassname = _itemInfo select 0;
private _displayName = _itemInfo select 1;
private _picture = _itemInfo select 2;
(_attachmentArray select 0) lbAdd _displayName;
(_attachmentArray select 0) lbSetPicture[lbSize((_attachmentArray select 0))-1, _picture];
(_attachmentArray select 0) lbSetTooltip[lbSize((_attachmentArray select 0))-1, _displayName];
(_attachmentArray select 0) lbSetData[lbSize((_attachmentArray select 0))-1, _gearClassname];
};

if(_attachments select 1 == "") then {
(_attachmentArray select 2) lbAdd "";
(_attachmentArray select 2) lbSetData [lbSize ((_attachmentArray select 2))-1, ""];
(_attachmentArray select 2) lbSetPicture[lbSize((_attachmentArray select 2))-1, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa"];
}else {
private _itemInfo = [_attachments select 1] call life_fnc_fetchCfgDetails;
private _gearClassname = _itemInfo select 0;
private _displayName = _itemInfo select 1;
private _picture = _itemInfo select 2;
(_attachmentArray select 2) lbAdd _displayName;
(_attachmentArray select 2) lbSetPicture[lbSize((_attachmentArray select 2))-1, _picture];
(_attachmentArray select 2) lbSetTooltip[lbSize((_attachmentArray select 2))-1, _displayName];
(_attachmentArray select 2) lbSetData[lbSize((_attachmentArray select 2))-1, _gearClassname];
};

if(_attachments select 2 == "") then {
(_attachmentArray select 1) lbAdd "";
(_attachmentArray select 1) lbSetData [lbSize ((_attachmentArray select 1))-1, ""];
(_attachmentArray select 1) lbSetPicture[lbSize((_attachmentArray select 1))-1, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa"];
}else {
private _itemInfo = [_attachments select 2] call life_fnc_fetchCfgDetails;
private _gearClassname = _itemInfo select 0;
private _displayName = _itemInfo select 1;
private _picture = _itemInfo select 2;
(_attachmentArray select 1) lbAdd _displayName;
(_attachmentArray select 1) lbSetPicture[lbSize((_attachmentArray select 1))-1, _picture];
(_attachmentArray select 1) lbSetTooltip[lbSize((_attachmentArray select 1))-1, _displayName];
(_attachmentArray select 1) lbSetData[lbSize((_attachmentArray select 1))-1, _gearClassname];
};

if(_attachments select 3 == "") then {
(_attachmentArray select 3) lbAdd "";
(_attachmentArray select 3) lbSetData [lbSize ((_attachmentArray select 3))-1, ""];
(_attachmentArray select 3) lbSetPicture[lbSize((_attachmentArray select 3))-1, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa"];
}else {
private _itemInfo = [_attachments select 3] call life_fnc_fetchCfgDetails;
private _gearClassname = _itemInfo select 0;
private _displayName = _itemInfo select 1;
private _picture = _itemInfo select 2;
(_attachmentArray select 3) lbAdd _displayName;
(_attachmentArray select 3) lbSetPicture[lbSize((_attachmentArray select 3))-1, _picture];
(_attachmentArray select 3) lbSetTooltip[lbSize((_attachmentArray select 3))-1, _displayName];
(_attachmentArray select 3) lbSetData[lbSize((_attachmentArray select 3))-1, _gearClassname];
};
};
}forEach [[primaryWeapon player, primaryWeaponItems player, _primaryPlayerWeapon, [_pSilencer, _pScope, _pPointer, _pBipod], "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa"], [secondaryWeapon player, secondaryWeaponItems player, _secondaryPlayerWeapon, [_sSilencer, _sScope, _sPointer, _sBipod], "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_secondary_gs.paa"], [handgunweapon player, handgunItems player, _handgunPlayerWeapon, [_hSilencer, _hScope, _hPointer, _hBipod], "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_hgun_gs.paa"]];

private _magList = [];
{
_mag = _x;
private _index = _magList findIf {_x select 0 == _mag};
if(_index isEqualTo -1) then {
_magList pushBack [_mag, 1];
}else {
private _old = (_magList select _index) select 1;
(_magList select _index) set [1, _old + 1];
};
}forEach (magazines player);

{
private _mag = _x select 0;
private _amount = _x select 1;
private _itemInfo = [_mag] call life_fnc_fetchCfgDetails;
private _gearClassname = _itemInfo select 0;
private _displayName = _itemInfo select 1;
private _picture = _itemInfo select 2;
_magazinePlayerList lbAdd format ["%1 (%2)", _displayName, _amount];
_magazinePlayerList lbSetPicture [lbSize (_magazinePlayerList)-1, _picture];
_magazinePlayerList lbSetData [lbSize (_magazinePlayerList)-1, _gearClassname];
_magazinePlayerList lbSetValue [lbSize (_magazinePlayerList)-1, _amount];
}forEach _magList;

if(lbSize (_magazinePlayerList) isEqualTo 0) then {_magazinePlayerList lbAdd "Keine Magazine verfügbar";_magazinePlayerList lbSetData [lbSize (_magazinePlayerList)-1, ""];};
lbSort _magazinePlayerList;

};

case 2 : {

private _listLocker = _display displayCtrl 398039;
private _listPlayer = _display displayCtrl 398040;

lbClear _listLocker;
lbClear _listPlayer;

{
private _className = _x select 0;
private _amount = _x select 1;
if(_amount > 0) then {
private _itemInfo = [_className] call life_fnc_fetchCfgDetails;
private _displayName = _itemInfo select 1;
private _picture = _itemInfo select 2;
_itemType = [_className] call life_fnc_getItemType;
if(!(_itemType in [0, 1, 2, 5, 6, 7, 8])) then {
_listLocker lbAdd format ["%1 (%2)", _displayName, _amount];
_listLocker lbSetPicture [(lbSize _listLocker)-1, _picture];
_listLocker lbSetData [(lbSize _listLocker)-1, _className];
_listLocker lbSetValue [(lbSize _listLocker)-1, _amount];
};
};
}forEach LOCKER;

if(lbSize (_listLocker) isEqualTo 0) then {_listLocker lbAdd "Keine Items verfügbar";_listLocker lbSetData [lbSize (_listLocker)-1, ""];};
lbSort _listLocker;

private _playerItems = [];
{
_className = _x;
if(_className != "") then {
private _index = _playerItems findIf {_x select 0 == _className};
if(_index isEqualTo -1) then {
_playerItems pushBack [_className, 1];
}else {
private _old = (_playerItems select _index) select 1;
(_playerItems select _index) set [1, _old + 1];
};
};
}forEach (uniformItems player + vestItems player + backpackItems player + assignedItems player);

{
private _className = _x select 0;
private _amount = _x select 1;
private _itemInfo = [_className] call life_fnc_fetchCfgDetails;
private _displayName = _itemInfo select 1;
private _picture = _itemInfo select 2;
_listPlayer lbAdd format ["%1 (%2)", _displayName, _amount];
_listPlayer lbSetPicture [lbSize (_listPlayer)-1, _picture];
_listPlayer lbSetData [lbSize (_listPlayer)-1, _className];
_listPlayer lbSetValue [lbSize (_listPlayer)-1, _amount];
}forEach _playerItems;

if(lbSize (_listPlayer) isEqualTo 0) then {_listPlayer lbAdd "Keine Items verfügbar";_listPlayer lbSetData [lbSize (_listPlayer)-1, ""];};
lbSort _listPlayer;
};
};