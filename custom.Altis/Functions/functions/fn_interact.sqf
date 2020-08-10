#include "..\script_macros.hpp"
disableSerialization;
private _sign = cursorObject;
private _signSide = _sign getVariable ["Interaction_Side", sideUnknown];
private _interactions = _sign getVariable ["Interaction_List", []];

private _compareSide = switch (playerSide) do {case west : {west}; case independent : {independent}; case civilian : {civilian}; case east : {civilian};};

if((!(_signSide isEqualTo _compareSide) && !(_signSide isEqualTo sideUnknown)) || _interactions isEqualTo []) exitWith {["", "Dieses Schild ist nicht für deine Fraktion"] spawn life_fnc_message};
if(!(isNull (findDisplay 374000))) exitWith {};

createDialog "Interaction_Menu";

CUR_AMOUNT_IDC = 0;

private _createElement = {
disableSerialization;
private _name = _this select 0;
private _action = _this select 1;
private _enable = _this select 2;
private _control = (findDisplay 374000) ctrlCreate ["Trans_Button", -1];
private _yValue = 0.19 + (0.044 * CUR_AMOUNT_IDC);
CUR_AMOUNT_IDC = CUR_AMOUNT_IDC + 1;
_control ctrlSetPosition [0.402031 * safezoneW + safezoneX, _yValue * safezoneH + safezoneY, 0.195937 * safezoneW, 0.033 * safezoneH];
_control ctrlCommit 0;
_control ctrlSetText _name;
_control ctrlCommit 0;
_control buttonSetAction _action;
_control ctrlEnable _enable;
};

{
private _name = _x select 0;
private _action = format ["_targetCall = call compile (str %1);closeDialog 0;%2", _sign, _x select 1];
private _condition = _sign call compile (_x select 2);
[_name, _action, _condition] call _createElement;
}forEach _interactions;