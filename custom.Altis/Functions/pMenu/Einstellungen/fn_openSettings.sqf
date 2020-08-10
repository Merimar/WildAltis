#include "..\..\script_macros.hpp"
disableSerialization;
if(isNull findDisplay 4000) then {createDialog "Settings";};
private _display = findDisplay 4000;
private _boxGras = _display displayCtrl 4001;
private _boxName = _display displayCtrl 4002;
private _combo = _display displayCtrl 4003;
private _textColor = _display displayCtrl 4004;
private _pictureHats = _display displayCtrl 4005;
private _pictureGlasses = _display displayCtrl 4006;
private _pictureKleidung = _display displayCtrl 4007;
private _pictureWeste = _display displayCtrl 4008;
private _pictureRucksack = _display displayCtrl 4009;
private _sliderHeli = _display displayCtrl 4010;
private _sliderAuto = _display displayCtrl 4011;
private _sliderBoden = _display displayCtrl 4012;
private _sliderRot = _display displayCtrl 4013;
private _sliderGrun = _display displayCtrl 4014;
private _sliderBlau = _display displayCtrl 4015;
private _editHeli = _display displayCtrl 4016;
private _editAuto = _display displayCtrl 4017;
private _editBoden = _display displayCtrl 4018;
private _editRot = _display displayCtrl 4019;
private _editGrun = _display displayCtrl 4020;
private _editBlau = _display displayCtrl 4021;

_sliderAuto sliderSetRange [100, 8000];
_sliderHeli sliderSetRange [100, 8000];
_sliderBoden sliderSetRange [100, 8000];
_sliderRot sliderSetRange [0, 100];
_sliderGrun sliderSetRange [0, 100];
_sliderBlau sliderSetRange [0, 100];
_sliderAuto sliderSetSpeed [100, 100];
_sliderHeli sliderSetSpeed [100, 100];
_sliderBoden sliderSetSpeed [100, 100];
_sliderRot sliderSetSpeed [100, 100];
_sliderGrun sliderSetSpeed [100, 100];
_sliderBlau sliderSetSpeed [100, 100];

private _settings = profileNamespace getVariable ["WildAltis_Settings", []];
if(count _settings isEqualTo 0) then {
_settings set [0, 5000];
_settings set [1, 5000];
_settings set [2, 5000];
_settings set [3, 100];
_settings set [4, 100];
_settings set [5, 100];
_settings set [6, 3];
_settings set [7, false];
_settings set [8, true];
};

private _distanceCar = _settings select 0;
private _distanceAir = _settings select 1;
private _distanceFoot = _settings select 2;
private _hexagonRot = _settings select 3;
private _hexagonGrun = _settings select 4;
private _hexagonBlau = _settings select 5;
private _thickness = _settings select 6;
private _nameTag = _settings select 7;
private _gras = _settings select 8;

profileNamespace setVariable ["WildAltis_Settings", _settings];
saveProfileNamespace;

_sliderAuto sliderSetPosition _distanceCar;
_sliderHeli sliderSetPosition _distanceAir;
_sliderBoden sliderSetPosition _distanceFoot;
_sliderRot sliderSetPosition _hexagonRot;
_sliderGrun sliderSetPosition _hexagonGrun;
_sliderBlau sliderSetPosition _hexagonBlau;

_editAuto ctrlSetText str(_distanceCar);
_editHeli ctrlSetText str(_distanceAir);
_editBoden ctrlSetText str(_distanceFoot);
_editRot ctrlSetText str(_hexagonRot);
_editGrun ctrlSetText str(_hexagonGrun);
_editBlau ctrlSetText str(_hexagonBlau);

_boxName cbSetChecked _nameTag;
_boxGras cbSetChecked _gras;

_textColor ctrlSetBackgroundColor [HEXAGON_R / 100, HEXAGON_G / 100, HEXAGON_B / 100, 1];

_thicknessArray = [[0,0.3],[1,0.5],[2,0.7],[3,1],[4,1.2],[5,1.4],[6,1.6],[7,1.7],[8,1.8],[9,1.9],[10,2]];
_thicknessIndex = _thicknessArray findIf {(_x select 1) == _thickness};
_newThickness = if(_thicknessIndex isEqualTo -1) then {3} else {_thicknessArray select _thicknessIndex select 0};

lbClear _combo;
{_combo lbAdd (str (_x select 0));_combo lbsetData [(lbSize _combo)-1, str (_x select 1)];}forEach _thicknessArray;
_combo lbSetCurSel _newThickness;

_headgear = headgear player;
_goggles = goggles player;
_vest = vest player;
_uniform = uniform player;
_backpack = backpack player;

if(_headgear != "") then {
_hatInfo = [_headgear] call life_fnc_fetchCfgDetails;
_pictureHats ctrlSetText (_hatInfo select 2);
};

if(_goggles != "") then {
_hatInfo = [_goggles] call life_fnc_fetchCfgDetails;
_pictureGlasses ctrlSetText (_hatInfo select 2);
};

if(_vest != "") then {
_hatInfo = [_vest] call life_fnc_fetchCfgDetails;
_pictureWeste ctrlSetText (_hatInfo select 2);
};

if(_uniform != "") then {
_hatInfo = [_uniform] call life_fnc_fetchCfgDetails;
_pictureKleidung ctrlSetText (_hatInfo select 2);
};

if(_backpack != "") then {
_hatInfo = [_backpack] call life_fnc_fetchCfgDetails;
_pictureRucksack ctrlSetText (_hatInfo select 2);
};