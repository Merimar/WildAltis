disableSerialization;
private _text = param [0, "", [""]];
private _header = param [1, "", [""]];
private _extraTime = param [2, 0, [0]];

if(isNil "INFO_ARRAY") then {INFO_ARRAY = [];};

if(_header == "") then {_header = "Neue Info";};

_header = format ["<t size = '1.2px' align = 'left'>%1</t>", _header];

private _display = findDisplay 46;
private _random = random(1000);

private _headerX = 0.0151911 * safezoneW + safezoneX;
private _headerY = (0.247 * safezoneH + safezoneY) - 0.1;
private _headerW = 0.123781 * safezoneW;
private _headerH = 0.022 * safezoneH;

private _siderX = 0.0100336 * safezoneW + safezoneX;
private _siderY = (0.247 * safezoneH + safezoneY) - 0.1;
private _siderW = 0.00412603 * safezoneW;
private _siderH = 0.154 * safezoneH;

private _infoX = 0.0151911 * safezoneW + safezoneX;
private _infoY = (0.28 * safezoneH + safezoneY) - 0.1;
private _infoW = 0.123781 * safezoneW;
private _infoH = 0.121 * safezoneH;

INFO_ARRAY pushBack _random;

waitUntil {(INFO_ARRAY param [0,-1]) isEqualTo _random};

private _headerText = _display ctrlCreate ["RscStructuredText", -1];
_headerText ctrlSetStructuredText parseText _header;
_headerText ctrlSetPosition [_headerX, _headerY, _headerW, _headerH];
_headerText ctrlSetBackgroundColor [-1, -1, -1, 0];

private _infoText = _display ctrlCreate ["RscStructuredText", -1];
_infoText ctrlSetStructuredText parseText _text;
_infoText ctrlSetPosition [_infoX, _infoY, _infoW, 0];
_infoText ctrlSetBackgroundColor [-1, -1, -1, 0];
_infoText ctrlCommit 0;

private _siderText = _display ctrlCreate ["RscStructuredText", -1];
_siderText ctrlSetStructuredText parseText "";
_siderText ctrlSetPosition [_siderX, _siderY, _siderW, 0];
_siderText ctrlSetBackgroundColor [0.96, 0.6, 0.24, 1];
_siderText ctrlCommit 0;

_headerText ctrlShow false;
_infoText ctrlShow false;

_siderText ctrlSetPosition [_siderX, _siderY, _siderW, 0.07 + ctrlTextHeight _infoText];
_siderText ctrlCommit 0.5;

sleep 0.3;

_headerText ctrlShow true;
_infoText ctrlShow true;

_infoText ctrlSetPosition [_infoX, _infoY, _infoW, ctrlTextHeight _infoText];
_infoText ctrlCommit 0.5;

_headerText ctrlSetFade 1;
_headerText ctrlCommit 0;
_headerText ctrlSetFade 0;
_headerText ctrlCommit 0.4;

sleep (5 + _extraTime);

_siderText ctrlSetPosition [_siderX, _siderY, _siderW, 0];
_siderText ctrlCommit 0.5;

sleep 0.5;

ctrlDelete _siderText;

_headerText ctrlSetPosition [_headerX, _headerY, 0, _headerH];
_headerText ctrlCommit 0.5;

_infoText ctrlSetPosition [_infoX, _infoY, _infoW, 0];
_infoText ctrlCommit 0.5;

sleep 0.5;

ctrlDelete _headerText;
ctrlDelete _infoText;

INFO_ARRAY deleteAt 0;