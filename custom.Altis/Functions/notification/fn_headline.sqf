#include "..\script_macros.hpp"
disableSerialization;
private _message = param [0, "Invalid Message"];
private _display = findDisplay 46;

if(isNil "LAST_HEADLINE_MESSAGE") then {LAST_HEADLINE_MESSAGE = "";};
if(isNil "LAST_HEADLINE_TIME") then {LAST_HEADLINE_TIME = 0;};

if(clientOwner isEqualTo HC_LIFE) exitWith {};
if(_message == LAST_HEADLINE_MESSAGE && (time - LAST_HEADLINE_TIME) < 20) exitWith {};
LAST_HEADLINE_MESSAGE = _message;
LAST_HEADLINE_TIME = time;

_message =  format ["<t font = 'PuristaMedium' size='1.1px'>%1</t>", _message];

_random = random(1000);
HEADLINE_ARRAY pushBack _random;

waitUntil {(HEADLINE_ARRAY param [0,-1]) isEqualTo _random};

private _messageField = _display ctrlCreate ["RscStructuredText", -1];
_messageField ctrlSetStructuredText parseText _message;
_messageField ctrlSetPosition [0.293017 * safezoneW + safezoneX, 0.1 * safezoneH + safezoneY,0.413967 * safezoneW, 0.035 * safezoneH];
_messageField ctrlSetBackgroundColor [0.102, 0.114, 0.161, 0.8];
_messageField ctrlSetFade 1;
_messageField ctrlCommit 0;
_messageField ctrlSetFade 0;
_messageField ctrlCommit 0.4;

private _header = _display ctrlCreate ["RscStructuredText", -1];
_header ctrlSetStructuredText parseText "";
_header ctrlSetPosition [0.293017 * safezoneW + safezoneX, 0.1 * safezoneH + safezoneY, 0.413967 * safezoneW, 0.0055 * safezoneH];
_header ctrlSetBackgroundColor [0.86,0.07,0.188,1];
_header ctrlSetFade 1;
_header ctrlCommit 0;
_header ctrlSetFade 0;
_header ctrlCommit 0.4;

_messageField ctrlSetPosition [0.293017 * safezoneW + safezoneX, 0.192 * safezoneH + safezoneY,0.413967 * safezoneW, 0.035 * safezoneH];
_messageField ctrlCommit 0.4;
_header ctrlSetPosition [0.293017 * safezoneW + safezoneX, 0.192 * safezoneH + safezoneY, 0.413967 * safezoneW, 0.0055 * safezoneH];
_header ctrlCommit 0.4;

sleep 5;

_messageField ctrlSetPosition [0.293017 * safezoneW + safezoneX, 0.3 * safezoneH + safezoneY,0.413967 * safezoneW, 0.035 * safezoneH];
_messageField ctrlCommit 0.5;
_header ctrlSetPosition [0.293017 * safezoneW + safezoneX, 0.3 * safezoneH + safezoneY, 0.413967 * safezoneW, 0.0055 * safezoneH];
_header ctrlCommit 0.5;

sleep 0.5;

_messageField ctrlSetPosition [0.293017 * safezoneW + safezoneX, -1.0 * safezoneH + safezoneY,0.413967 * safezoneW, 0.035 * safezoneH];
_messageField ctrlCommit 0.15;
_header ctrlSetPosition [0.293017 * safezoneW + safezoneX, -1.0 * safezoneH + safezoneY, 0.413967 * safezoneW, 0.0055 * safezoneH];
_header ctrlCommit 0.15;

sleep 2;

ctrlDelete _header;
ctrlDelete _messageField;

sleep 1.5;

HEADLINE_ARRAY deleteAt 0;