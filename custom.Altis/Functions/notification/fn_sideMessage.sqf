#include "..\script_macros.hpp"
disableSerialization;
private _message = param [0, "Invalid Message"];
private _icon = param [1, ""];
private _display = findDisplay 46;

if(clientOwner isEqualTo HC_LIFE) exitWith {};

_message = format ["<t valign = 'middle' font = 'RobotoCondensed' color = '#BBBBC4'><br/>                               %1</t>", _message];

waitUntil {SIDELINE_USE};

if(!SIDELINE_STATUS) then {
SIDELINE_STATUS = true;
SIDELINE_TIME = time;
_sideMessageField = _display ctrlCreate ["RscStructuredText", -1];
_sideMessageField ctrlSetStructuredText parseText _message;
_sideMessageField ctrlSetPosition [-1.0 * safezoneW + safezoneX, 0.247 * safezoneH + safezoneY,0.129365 * safezoneW, 0.077 * safezoneH];
_sideMessageField ctrlSetBackgroundColor [0.102, 0.114, 0.161, 1];
_sideMessageField ctrlSetFade 1;
_sideMessageField ctrlCommit 0;
_sideMessageField ctrlSetFade 0;
_sideMessageField ctrlCommit 0.4;

_sideMessageHeader = _display ctrlCreate ["RscStructuredText", -1];
_sideMessageHeader ctrlSetStructuredText parseText "";
_sideMessageHeader ctrlSetPosition [-1.0 * safezoneW + safezoneX, 0.247 * safezoneH + safezoneY, 0.00517458 * safezoneW, 0.077 * safezoneH];
_sideMessageHeader ctrlSetBackgroundColor [0.86,0.07,0.188,1];
_sideMessageHeader ctrlSetFade 1;
_sideMessageHeader ctrlCommit 0;
_sideMessageHeader ctrlSetFade 0;
_sideMessageHeader ctrlCommit 0.4;

_sideMessagePicture = _display ctrlCreate ["RscPicture", -1];
_sideMessagePicture ctrlSetText _icon;
_sideMessagePicture ctrlSetPosition [-1.0 * safezoneW + safezoneX, 0.258 * safezoneH + safezoneY, 0.0362221 * safezoneW, 0.055 * safezoneH];
_sideMessagePicture ctrlSetBackgroundColor [-1, -1, -1, -1];
_sideMessagePicture ctrlSetFade 1;
_sideMessagePicture ctrlCommit 0;
_sideMessagePicture ctrlSetFade 0;
_sideMessagePicture ctrlCommit 0.4;

_sideMessageField ctrlSetPosition [-0.00193472 * safezoneW + safezoneX, 0.247 * safezoneH + safezoneY,0.129365 * safezoneW, 0.077 * safezoneH];
_sideMessageField ctrlCommit 0.4;
_sideMessageHeader ctrlSetPosition [0.1272 * safezoneW + safezoneX, 0.247 * safezoneH + safezoneY, 0.00517458 * safezoneW, 0.077 * safezoneH];
_sideMessageHeader ctrlCommit 0.4;
_sideMessagePicture ctrlSetPosition [0.00841447 * safezoneW + safezoneX, 0.258 * safezoneH + safezoneY, 0.0362221 * safezoneW, 0.055 * safezoneH];
_sideMessagePicture ctrlCommit 0.4;

uiNamespace setVariable ["Side_Message_Field", _sideMessageField];
uiNamespace setVariable ["Side_Message_Header", _sideMessageHeader];
uiNamespace setVariable ["Side_Message_Picture", _sideMessagePicture];

waitUntil {(time - SIDELINE_TIME) > 5};
SIDELINE_USE = false;
SIDELINE_STATUS = false;

_sideMessageField ctrlSetPosition [-1.0 * safezoneW + safezoneX, 0.247 * safezoneH + safezoneY,0.129365 * safezoneW, 0.077 * safezoneH];
_sideMessageField ctrlCommit 0.4;
_sideMessageHeader ctrlSetPosition [-1.0 * safezoneW + safezoneX, 0.247 * safezoneH + safezoneY, 0.00517458 * safezoneW, 0.077 * safezoneH];
_sideMessageHeader ctrlCommit 0.4;
_sideMessagePicture ctrlSetPosition [-1.0 * safezoneW + safezoneX, 0.258 * safezoneH + safezoneY, 0.0362221 * safezoneW, 0.055 * safezoneH];
_sideMessagePicture ctrlCommit 0.4;

sleep 2;

ctrlDelete _sideMessageHeader;
ctrlDelete _sideMessageField;
ctrlDelete _sideMessagePicture;

SIDELINE_USE = true;
}else {
SIDELINE_TIME = time;

_sideMessageField = uiNamespace getVariable "Side_Message_Field";
_sideMessagePicture = uiNamespace getVariable "Side_Message_Picture";

_sideMessageField ctrlSetStructuredText parseText _message;
_sideMessagePicture ctrlSetText _icon;
};