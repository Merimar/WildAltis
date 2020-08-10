disableSerialization;
private ["_messageField", "_messageText", "_messageSider", "_plusHeightMessage"];
private _message = param [0, ""];
private _title = param [1, ""];
private _extraTime = param [2, 0];

OUTSIDE_X = 1.0 * safezoneW + safezoneX;
LENGTH = 0.159844 * safezoneW;
ONE_STAMP = 0.022 * safezoneH;
HEADER_HIGHT = 0.0055 * safezoneH;
INSIDE_X = 0.83 * safezoneW + safezoneX;

HEADER_BACKGROUND_START = 0.115 * safezoneH + safezoneY;
HEADER_MESSAGE_START = (0.115 * safezoneH + safezoneY) + 0.02;
HEADER_SIDER_START = HEADER_BACKGROUND_START +  2 * ONE_STAMP - 0.005;

MESSAGE_BACKGROUND_START = 0.16 * safezoneH + safezoneY;
MESSAGE_MESSAGE_START = (0.16 * safezoneH + safezoneY) + 0.02;
MESSAGE_SIDER_START = 0.196 * safezoneH + safezoneY;

SIDER_COLOR = [1, 1, 1, 1]; //[0.835, 0.462, 0.023, 1]
HEADER_COLOR = [0.102, 0.114, 0.161, 1];
MESSAGE_COLOR = [0.239, 0.262, 0.337, 0.8];

if(isNil "LAST_MESSAGE") then {LAST_MESSAGE = "";};
if(isNil "LAST_TITLE") then {LAST_TITLE = "";};
if(isNil "LAST_MESSAGE_TIME") then {LAST_MESSAGE_TIME = 0;};
if(isNil "MESSAGE_ARRAY") then {MESSAGE_ARRAY = [];};

if(clientOwner isEqualTo HC_LIFE) exitWith {};
if(_message == LAST_MESSAGE && _title == LAST_TITLE && (time - LAST_MESSAGE_TIME) < 20) exitWith {};
LAST_MESSAGE = _message;
LAST_TITLE = _title;
LAST_MESSAGE_TIME = time;

_title =  format ["<t color = '#FFFFFF' font = 'EtelkaMonospacePro' size='1.1px'>%1</t>", _title];

if(_message != "") then {
_message =  format ["<t color = '#B3C8C9' font = 'PuristaMedium' size='0.9px'>%1</t>", _message];
_title =  format ["<t color = '#FFFFFF' align = 'center' font = 'EtelkaMonospacePro' size='1.1px'>%1</t>", _title];
};


private _display = findDisplay 46;

_random = random(1000);
MESSAGE_ARRAY pushBack _random;

waitUntil {(MESSAGE_ARRAY param [0,-1]) isEqualTo _random};

private _header = _display ctrlCreate ["RscStructuredText", -1];
_header ctrlSetStructuredText parseText "";

private _headerText = _display ctrlCreate ["RscStructuredText", -1];
_headerText ctrlSetStructuredText parseText _title;
_headerText ctrlSetPosition [OUTSIDE_X, HEADER_MESSAGE_START, LENGTH, ONE_STAMP + ctrlTextHeight _headerText];
_headerText ctrlSetBackgroundColor [-1, -1, -1, 0];
_headerText ctrlSetFade 1;
_headerText ctrlCommit 0;
_headerText ctrlSetFade 0;
_headerText ctrlCommit 0.4;

private _asp = getResolution select 7;
private _multiplier = switch (_asp) do {
	case 1 : {0.0366667}; //4:3
	case 1.33333 : {0.044}; //16:9
	case 3 : {0.0366667}; //21:9
	case 0.9375 : {0.0366667};
	default {0.044};
};

private _plusHeight = ((parseNumber str ctrlTextHeight _headerText) / (parseNumber str _multiplier)) - 1;
if(_plusHeight < 0) then {_plusHeight = 0;};
_plusHeight = _plusHeight * _multiplier;

_header ctrlSetPosition [OUTSIDE_X, HEADER_BACKGROUND_START, LENGTH, ONE_STAMP + ctrlTextHeight _headerText];
_header ctrlSetBackgroundColor HEADER_COLOR;
_header ctrlSetFade 1;
_header ctrlCommit 0;
_header ctrlSetFade 0;
_header ctrlCommit 0.4;

if(_message != "") then {
_messageField = _display ctrlCreate ["RscStructuredText", -1];
_messageField ctrlSetStructuredText parseText "";

_messageText = _display ctrlCreate ["RscStructuredText", -1];
_messageText ctrlSetStructuredText parseText _message;
_messageText ctrlSetPosition [OUTSIDE_X, MESSAGE_MESSAGE_START + _plusHeight,LENGTH, ONE_STAMP + ctrlTextHeight _messageText];
_messageText ctrlSetBackgroundColor [-1, -1, -1, 0];
_messageText ctrlSetFade 1;
_messageText ctrlCommit 0;
_messageText ctrlSetFade 0;
_messageText ctrlCommit 0.4;

private _hightMultiplier = switch (_asp) do {
	case 1 : {0.03}; //4:3
	case 1.33333 : {0.036}; //16:9
	case 3 : {0.03}; //21:9
	case 0.9375 : {0.03};
	default {0.036};
};

_plusHeightMessage = ((parseNumber str ctrlTextHeight _messageText) / (parseNumber str _hightMultiplier)) -1;
if(_plusHeightMessage < 0) then {_plusHeightMessage = 0;};
_plusHeightMessage = _plusHeightMessage * _hightMultiplier;
_plusHeightMessage = _plusHeightMessage + _plusHeight;

_messageSider = _display ctrlCreate ["RscStructuredText", -1];
_messageSider ctrlSetPosition [OUTSIDE_X, MESSAGE_SIDER_START + _plusHeightMessage, LENGTH, HEADER_HIGHT];
_messageSider ctrlSetBackgroundColor SIDER_COLOR;
_messageSider ctrlSetFade 1;
_messageSider ctrlCommit 0;
_messageSider ctrlSetFade 0;
_messageSider ctrlCommit 0.4;

_messageField ctrlSetPosition [OUTSIDE_X, MESSAGE_BACKGROUND_START + _plusHeight,LENGTH, ONE_STAMP + ctrlTextHeight _messageText];
_messageField ctrlSetBackgroundColor MESSAGE_COLOR;
_messageField ctrlSetFade 1;
_messageField ctrlCommit 0;
_messageField ctrlSetFade 0;
_messageField ctrlCommit 0.4;
};

private _headerSider = _display ctrlCreate ["RscStructuredText", -1];
_headerSider ctrlSetPosition [OUTSIDE_X, HEADER_SIDER_START + _plusHeight, LENGTH, HEADER_HIGHT];
_headerSider ctrlSetBackgroundColor SIDER_COLOR;
_headerSider ctrlSetFade 1;
_headerSider ctrlCommit 0;
_headerSider ctrlSetFade 0;
_headerSider ctrlCommit 0.4;

if(_message != "") then {
_messageField ctrlSetPosition [INSIDE_X, MESSAGE_BACKGROUND_START + _plusHeight,LENGTH, ONE_STAMP + ctrlTextHeight _messageText];
_messageField ctrlCommit 0.4;
_messageText ctrlSetPosition [INSIDE_X, MESSAGE_MESSAGE_START + _plusHeight,LENGTH, ONE_STAMP + ctrlTextHeight _messageText];
_messageText ctrlCommit 0.4;
_messageSider ctrlSetPosition [INSIDE_X, MESSAGE_SIDER_START + _plusHeightMessage, LENGTH, HEADER_HIGHT];
_messageSider ctrlCommit 0.4;
};
_header ctrlSetPosition [INSIDE_X, HEADER_BACKGROUND_START, LENGTH, ONE_STAMP + ctrlTextHeight _headerText];
_header ctrlCommit 0.4;
_headerText ctrlSetPosition [INSIDE_X, HEADER_MESSAGE_START, LENGTH, ONE_STAMP + ctrlTextHeight _headerText];
_headerText ctrlCommit 0.4;
_headerSider ctrlSetPosition [INSIDE_X, HEADER_SIDER_START + _plusHeight, LENGTH, HEADER_HIGHT];
_headerSider ctrlCommit 0.4;

sleep (5 + _extraTime);

if(_message != "") then {
_messageField ctrlSetPosition [OUTSIDE_X, MESSAGE_BACKGROUND_START + _plusHeight, LENGTH, ONE_STAMP + ctrlTextHeight _messageText];
_messageField ctrlCommit 0.5;
_messageText ctrlSetPosition [OUTSIDE_X, MESSAGE_MESSAGE_START + _plusHeight, LENGTH, ONE_STAMP + ctrlTextHeight _messageText];
_messageText ctrlCommit 0.5;
_messageSider ctrlSetPosition [OUTSIDE_X, MESSAGE_SIDER_START + _plusHeightMessage, LENGTH, HEADER_HIGHT];
_messageSider ctrlCommit 0.5;
};
_header ctrlSetPosition [OUTSIDE_X, HEADER_BACKGROUND_START, LENGTH, ONE_STAMP + ctrlTextHeight _headerText];
_header ctrlCommit 0.5;
_headerText ctrlSetPosition [OUTSIDE_X, HEADER_MESSAGE_START, LENGTH, ONE_STAMP + ctrlTextHeight _headerText];
_headerText ctrlCommit 0.5;
_headerSider ctrlSetPosition [OUTSIDE_X, HEADER_SIDER_START + _plusHeight, LENGTH, HEADER_HIGHT];
_headerSider ctrlCommit 0.5;

sleep 2;

ctrlDelete _header;
ctrlDelete _headerText;
ctrlDelete _headerSider;
if(_message != "") then {
ctrlDelete _messageField;
ctrlDelete _messageText;
ctrlDelete _messageSider;
};

sleep 1.5;

MESSAGE_ARRAY deleteAt 0;