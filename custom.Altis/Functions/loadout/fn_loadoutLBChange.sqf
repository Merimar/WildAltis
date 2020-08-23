#include "..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 3750;
private _list = _display displayCtrl 3751;
private _loadoutInfo = _display displayCtrl 3752;
private _curSel = (lbCurSel _list) + 1;

if(_curSel isEqualTo 0) exitWith {};

private _index = life_allLoadouts findIf {(_x select 1) isEqualTo _curSel};
if(_index isEqualTo -1) exitWith {_loadoutInfo ctrlSetStructuredText parseText "Dieser Loadout Slot ist noch frei";};
private _loadout = life_allLoadouts select _index select 0;
private _price = [_loadout] call life_fnc_getLoadoutPrice;

private _convertedloadout = _loadout call life_fnc_convertLoadout;
_prim = _convertedloadout select 0;
_seco = _convertedloadout select 1;
_pistol = _convertedloadout select 2;
_uniform = _convertedloadout select 3;
_vest = _convertedloadout select 4;
_backpack = _convertedloadout select 5;
_headgear = _loadout select 6;
_goggles = _loadout select 7;

_WaffeChange = "Keine Waffe";
_PistoleChange = "Keine Pistole";
_UniformChange = "Keine Uniform";
_WesteChange = "Keine Weste";
_HelmChange = "Kein Helm";
_RucksackChange = "Kein Rucksack";
_BrilleChange = "Keine Brille";

if(_prim != "") then {_WaffeChange = ([_prim] call life_fnc_fetchCfgDetails) select 1;};
if(_pistol != "") then {_PistoleChange = ([_pistol] call life_fnc_fetchCfgDetails) select 1;};
if(_uniform != "") then {_UniformChange = ([_uniform] call life_fnc_fetchCfgDetails) select 1;};
if(_vest != "") then {_WesteChange = ([_vest] call life_fnc_fetchCfgDetails) select 1;};
if(_headgear != "") then {_HelmChange = ([_headgear] call life_fnc_fetchCfgDetails) select 1;};
if(_backpack != "") then {_RucksackChange = ([_backpack] call life_fnc_fetchCfgDetails) select 1;};
if(_goggles != "") then {_BrilleChange = ([_goggles] call life_fnc_fetchCfgDetails) select 1;};

_map = "Keine Map";
_compass = "Kein Kompass";
_watch = "Keine Uhr";
_gps = "Kein GPS";
_nvg = "Kein Nightvision";
_binoculars = "Kein Fernglas";

{
    _items = _x;
    {
        _iteminfo = _x;
        _item = _iteminfo select 0;
        if(_item == "ItemMap") then {_map = ([_item] call life_fnc_fetchCfgDetails) select 1;};
        if(_item == "ItemCompass") then {_compass = ([_item] call life_fnc_fetchCfgDetails) select 1;};
        if(_item == "ItemWatch") then {_watch = ([_item] call life_fnc_fetchCfgDetails) select 1;};
        if(_item == "ItemGPS") then {_gps = ([_item] call life_fnc_fetchCfgDetails) select 1;};
        if(_item == "NVGoggles" || _item == "NVGoggles_OPFOR" || _item == "NVGoggles_INDEP" || _item == "Integrated_NVG_F" || _item == "Integrated_NVG_TI_0_F" || _item == "Integrated_NVG_TI_1_F") then {_nvg = ([_item] call life_fnc_fetchCfgDetails) select 1;};
        if(_item == "Laserdesignator" || _item == "Laserdesignator_02" || _item == "Laserdesignator_03" || _item == "Rangefinder" || _item == "Binocular") then {_binoculars = ([_item] call life_fnc_fetchCfgDetails) select 1;};
    } forEach _items;
} forEach [_convertedloadout select 12, _convertedloadout select 6, _convertedloadout select 7, _convertedloadout select 8, _convertedloadout select 9, _convertedloadout select 10, _convertedloadout select 11];

_loadoutInfo ctrlSetStructuredText parseText format[
	"Waffe: <t color='#8cff9b'>%1</t><br/>"+
	"Pistole: <t color='#8cff9b'>%2</t><br/>"+
	"Uniform: <t color='#8cff9b'>%3</t><br/>"+
	"Weste: <t color='#8cff9b'>%4</t><br/>"+
	"Helm: <t color='#8cff9b'>%5</t><br/>"+
	"Rucksack: <t color='#8cff9b'>%6</t><br/>"+
	"Brille: <t color='#8cff9b'>%7</t><br/>"+
	"Map: <t color='#8cff9b'>%8</t><br/>"+
	"Kompass: <t color='#8cff9b'>%9</t><br/>"+
	"Uhr: <t color='#8cff9b'>%10</t><br/>"+
	"GPS: <t color='#8cff9b'>%11</t><br/>"+
	"Fernglas: <t color='#8cff9b'>%12</t><br/>"+
	"Kaufpreis: <t color='#8cff9b'>%13</t><br/>",
	_WaffeChange,
	_PistoleChange,
    _UniformChange,
    _WesteChange,
    _HelmChange,
    _RucksackChange,
    _BrilleChange,
    _map,
	_compass,
	_watch,
	_gps,
	_binoculars,
	[_price] call life_fnc_numberText
];