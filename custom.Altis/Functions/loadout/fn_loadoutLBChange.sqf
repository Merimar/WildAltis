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

_loadout params [
    "_uniform",
    "_vest",
    "_backpack",
    "_goggles",
    "_headgear",
    ["_items",[]],
    "_prim",
    "_seco",
    ["_uItems",[]],
    ["_uMags",[]],
    ["_bItems",[]],
    ["_bMags",[]],
    ["_vItems",[]],
    ["_vMags",[]],
    ["_pItems",[]],
    ["_hItems",[]]
];

_WaffeChange = "Keine Waffe";
_PistoleChange = "Keine Pistole";
_UniformChange = "Keine Uniform";
_WesteChange = "Keine Weste";
_HelmChange = "Kein Helm";
_RucksackChange = "Kein Rucksack";
_BrilleChange = "Keine Brille";

if(_prim != "") then {_WaffeChange = ([_prim] call life_fnc_fetchCfgDetails) select 1;};
if(_seco != "") then {_PistoleChange = ([_seco] call life_fnc_fetchCfgDetails) select 1;};
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
if(_x == "ItemMap") then {_map = ([_x] call life_fnc_fetchCfgDetails) select 1;};
if(_x == "ItemCompass") then {_compass = ([_x] call life_fnc_fetchCfgDetails) select 1;};
if(_x == "ItemWatch") then {_watch = ([_x] call life_fnc_fetchCfgDetails) select 1;};
if(_x == "ItemGPS") then {_gps = ([_x] call life_fnc_fetchCfgDetails) select 1;};
if(_x == "NVGoggles" || _x == "NVGoggles_OPFOR" || _x == "NVGoggles_INDEP" || _x == "Integrated_NVG_F" || _x == "Integrated_NVG_TI_0_F" || _x == "Integrated_NVG_TI_1_F") then {_nvg = ([_x] call life_fnc_fetchCfgDetails) select 1;};
if(_x == "Laserdesignator" || _x == "Laserdesignator_02" || _x == "Laserdesignator_03" || _x == "Rangefinder" || _x == "Binocular") then {_binoculars = ([_x] call life_fnc_fetchCfgDetails) select 1;};
}forEach _items;

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