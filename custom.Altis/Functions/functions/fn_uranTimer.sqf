uranTimer = {
private _isVehicle = param [0, false, [false]];
private _object = param [1, objNull, [objNull]];
private _overlay = if(_isVehicle) then {7} else {8};

private _time = _object getVariable ["UranTime", 0];

if(_time isEqualTo 0) exitWith {};

_overlay cutRsc ["life_timer","PLAIN", -1, true];
private _uiDisp = uiNamespace getVariable "life_timer";
private _timer = _uiDisp displayCtrl 38301;
private _clock = _uiDisp displayCtrl 38302;
private _prefix = if(_isVehicle) then {"Fahrzeug"} else {"Spieler"};

if(_isVehicle) then {
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
    if(round (_time - servertime) < 1) exitWith {};
	if(isNull _object) exitWith {};
	if(_object getVariable ["UranTime", 0] isEqualTo 0) exitWith {};
	if(isNull objectParent player && _isVehicle) exitWith {};
    _timer ctrlSetText format["%1 - %2", _prefix, [(_time - servertime),"MM:SS.MS"] call BIS_fnc_secondsToString];
    sleep 0.08;
};

_overlay cutText["","PLAIN"];
};

[] spawn {
while {true} do {

private _unitUran = player getVariable ["UranTime", 0];
private _unitHandle = if(_unitUran != 0) then {[false, player] spawn uranTimer} else {objNull};

waitUntil {isNull _unitHandle};
sleep 5;
};
};

[] spawn {
while {true} do {

private _vehicleUran = if(isNull objectParent player) then {0} else {(objectParent player) getVariable ["UranTime", 0]};
private _vehicleHandle = if(_vehicleUran != 0) then {[true, objectParent player] spawn uranTimer} else {objNull};

waitUntil {isNull _vehicleHandle};
sleep 5;
};
};

STRAHLUNG = false;
STRAHLUNG_THREAD = objNull;
STRAHLUNG_SCRIPT = {
STRAHLUNG = true;

8 cutRsc ["life_timer","PLAIN", -1, true];
private _uiDisp = uiNamespace getVariable "life_timer";
private _timer = _uiDisp displayCtrl 38301;
private _clock = _uiDisp displayCtrl 38302;
private _time = time + 20;

_timer ctrlSetPosition [0.0204688 * safezoneW + safezoneX, (0.2778 * safezoneH + safezoneY) + 0.3, 0.12 * safezoneW, 0.055 * safezoneH];
_clock ctrlSetPosition [0.00499997 * safezoneW + safezoneX, (0.291 * safezoneH + safezoneY) + 0.3, 0.04, 0.045];
_timer ctrlCommit 0;
_clock ctrlCommit 0;

for "_i" from 0 to 1 step 0 do {
    if(isNull _uiDisp) then {
        8 cutRsc ["life_timer","PLAIN", -1, true];
        _uiDisp = uiNamespace getVariable "life_timer";
		
        _timer = _uiDisp displayCtrl 38301;
		_clock = _uiDisp displayCtrl 38302;
		
		_timer ctrlSetPosition [0.0204688 * safezoneW + safezoneX, (0.2778 * safezoneH + safezoneY) + 0.3, 0.12 * safezoneW, 0.055 * safezoneH];
		_clock ctrlSetPosition [0.00499997 * safezoneW + safezoneX, (0.291 * safezoneH + safezoneY) + 0.3, 0.04, 0.045];
		
		_timer ctrlCommit 0;
		_clock ctrlCommit 0;
    };
    if(round (_time - time) < 1) exitWith {};
	if(life_isDead || !(player inArea "Zone_Verstrahlt_1" || player inArea "Zone_Verstrahlt_2" || player inArea "Zone_Verstrahlt_3" || player inArea "Zone_Verstrahlt_4" || player inArea "Zone_Verstrahlt_5") || (uniform player == "U_C_CBRN_Suit_01_White_F" && goggles player == "G_AirPurifyingRespirator_02_black_F")) exitWith {};
    _timer ctrlSetText format["%1 - %2", "Strahlung", [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
    sleep 0.08;
};

if(!(player inArea "Zone_Verstrahlt_1" || player inArea "Zone_Verstrahlt_2" || player inArea "Zone_Verstrahlt_3" || player inArea "Zone_Verstrahlt_4" || player inArea "Zone_Verstrahlt_5") || (uniform player == "U_C_CBRN_Suit_01_White_F" && goggles player == "G_AirPurifyingRespirator_02_black_F")) then {STRAHLUNG = false;};

8 cutText["","PLAIN"];
STRAHLUNG_THREAD = objNull;
};

[] spawn {
while {true} do {
waitUntil {isNull STRAHLUNG_THREAD && alive player && (player inArea "Zone_Verstrahlt_1" || player inArea "Zone_Verstrahlt_2" || player inArea "Zone_Verstrahlt_3" || player inArea "Zone_Verstrahlt_4" || player inArea "Zone_Verstrahlt_5")};

if(STRAHLUNG && (uniform player == "U_C_CBRN_Suit_01_White_F" && goggles player == "G_AirPurifyingRespirator_02_black_F")) then {STRAHLUNG = false;};
if(STRAHLUNG && !(uniform player == "U_C_CBRN_Suit_01_White_F" && goggles player == "G_AirPurifyingRespirator_02_black_F")) then {
["Du bist durch eine zu hohe Ladung an Strahlung gestorben.", "Verstrahltes Gebiet"] spawn life_fnc_message;
[player] remoteExec ["HC_fnc_strahlungDeath", HC_LIFE];
STRAHLUNG = false;
};

if(!(uniform player == "U_C_CBRN_Suit_01_White_F" && goggles player == "G_AirPurifyingRespirator_02_black_F") && alive player) then {STRAHLUNG_THREAD = [] spawn STRAHLUNG_SCRIPT;};
};
};