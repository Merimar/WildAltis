

dataTimer = {
private _isPrimary = param [0, false, [false]];
private _overlay = if(_isPrimary) then {7} else {8};
private _time = DATA_TIMER;
private _prefix = if(_isPrimary) then {"Punkte in"} else {"Datacenter"};

if(!_isPrimary) then {
DATACENTER_TASK = player createSimpleTask ["Datacenter"];
DATACENTER_TASK setSimpleTaskDescription ["Einnehmen", "Hotzone", "Einnehmen"];
DATACENTER_TASK setTaskState "Assigned";
player setCurrentTask DATACENTER_TASK;
};

_overlay cutRsc ["life_timer","PLAIN", -1, true];
private _uiDisp = uiNamespace getVariable "life_timer";
private _timer = _uiDisp displayCtrl 38301;
private _clock = _uiDisp displayCtrl 38302;

if(_isPrimary) then {
_timer ctrlSetPosition [0.0204688 * safezoneW + safezoneX, (0.2778 * safezoneH + safezoneY) + 0.1, 0.12 * safezoneW, 0.055 * safezoneH];
_clock ctrlSetPosition [0.00499997 * safezoneW + safezoneX, (0.291 * safezoneH + safezoneY) + 0.1, 0.04, 0.045];
}else {
_timer ctrlSetPosition [0.0204688 * safezoneW + safezoneX, (0.2778 * safezoneH + safezoneY) + 0.2, 0.12 * safezoneW, 0.055 * safezoneH];
_clock ctrlSetPosition [0.00499997 * safezoneW + safezoneX, (0.291 * safezoneH + safezoneY) + 0.2, 0.04, 0.045];
};

_timer ctrlCommit 0;
_clock ctrlCommit 0;

for "_i" from 0 to 1 step 0 do {
    if(isNull _uiDisp) then {
        _overlay cutRsc ["life_timer","PLAIN", -1, true];
        _uiDisp = uiNamespace getVariable "life_timer";
        _timer = _uiDisp displayCtrl 38301;
		_clock = _uiDisp displayCtrl 38302;
		if(_isVehicle) then {
			_timer ctrlSetPosition [0.0204688 * safezoneW + safezoneX, (0.2778 * safezoneH + safezoneY) + 0.1, 0.12 * safezoneW, 0.055 * safezoneH];
			_clock ctrlSetPosition [0.00499997 * safezoneW + safezoneX, (0.291 * safezoneH + safezoneY) + 0.1, 0.04, 0.045];
		}else {
			_timer ctrlSetPosition [0.0204688 * safezoneW + safezoneX, (0.2778 * safezoneH + safezoneY) + 0.2, 0.12 * safezoneW, 0.055 * safezoneH];
			_clock ctrlSetPosition [0.00499997 * safezoneW + safezoneX, (0.291 * safezoneH + safezoneY) + 0.2, 0.04, 0.045];
		};
		_timer ctrlCommit 0;
		_clock ctrlCommit 0;
    };
	if(_isPrimary) then {_time = bank_obj getVariable ["DataTime", servertime + 17];};
    if(round (_time - servertime) < 1) exitWith {};
	if(life_isDead) exitWith {};
	if(!(player inArea "Datacenter_Zone") && !_isPrimary) exitWith {};
	if(!(player inArea "Datacenter") && _isPrimary) exitWith {};
    _timer ctrlSetText format["%1 - %2", _prefix, [(_time - servertime),"MM:SS.MS"] call BIS_fnc_secondsToString];
	DATACENTER_TASK setSimpleTaskDestination (getMarkerPos "Datacenter");
    sleep 0.08;
};

if(!_isPrimary) then {player removeSimpleTask DATACENTER_TASK;};

_overlay cutText["","PLAIN"];
};

[] spawn {
while {true} do {
private _handle = if(player inArea "Datacenter_Zone") then {[false] spawn dataTimer} else {objNull};

waitUntil {isNull _handle};
sleep 1;
};
};

[] spawn {
while {true} do {
private _handle = if(player inArea "Datacenter") then {[true] spawn dataTimer} else {objNull};

waitUntil {isNull _handle};
sleep 1;
};
};

[] spawn {
while {true} do {
if(player inArea "Datacenter_Zone") then {
private _list = [];
{_list pushBack format ["%1 - %2 Punkte", _x select 0, _x select 1];}forEach DATA_POINTS;
[_list joinString "<br/>", "Scoreboard"] spawn life_fnc_showInfo;
};
sleep 15;
};
};