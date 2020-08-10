#include "..\script_macros.hpp"
private _skill = param [0, ""];
private _lvl = param [1, -1];
private _noDes = param [2, false];
private _advantage = [_skill, _lvl] call life_fnc_getSkillAdvantage;

if(_lvl isEqualTo -1) exitWith {"Geht nicht"};

private _time = ["repair", "revive", "impound", "boltcutter", "processGrapes", "processSand", "processOre", "processFossil", "processRock", "processDrugs", "craftClothing", "craftWeapon", "craftScrolls", "craftSpezial", "craftFarm"];
private _chance = ["lockpick", "search", "farmFruit", "farmGrapes", "farmSand", "farmOre", "farmFossil", "farmStone", "farmDrugs"];
private _money = ["farmPost"];

private _result = "<t align = 'center' color = '#FFD33F' font = 'RobotoCondensed'>";
if(_noDes) then {_result = "";};

if(_advantage isEqualType []) then {
{
if(!(_x isEqualTo 0)) then {
if(_noDes) then {
_result = format["%1Menge: %2 Wahrscheinlichkeit: %3%4 ", _result, _forEachIndex + 1, _x, "%"];
}else {
_result = format["%1Menge: %2 Wahrscheinlichkeit: %3%4<br/>", _result, _forEachIndex + 1, _x, "%"];
};
};
}forEach _advantage;
}else {
private _description = switch (true) do {
case (_skill in _time) : {format ["Zeit: %1s", (_advantage * 100)];};
case (_skill in _chance) : {format ["Erfolg: %1%2", _advantage, "%"];};
case (_skill == "heal") : {format ["Leben: %1", (1 - _advantage) * 100];};
case (_skill == "stamina") : {format ["Distanz: %1m", _advantage];};
case (_skill in _money) : {format ["Geld: €%1", [_advantage * 1000] call life_fnc_numberText];};
};
_result = format ["%1%2", _result, _description];
};

if(!_noDes) then {
_result = format ["%1</t>", _result];
};

_result;