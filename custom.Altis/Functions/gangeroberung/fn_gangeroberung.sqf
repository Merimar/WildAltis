#include "..\script_macros.hpp"
private _playerGang = (group player) getVariable ["gang_name", ""];
private _winner = SCHILD_DEALER getVariable["Zone_Dealer_Winner", ""];
private _capturePlayer = SCHILD_DEALER getVariable["Zone_Dealer_CapturePlayer", objNull];

if(_playerGang == "") exitWith {titleText["Du bist in keiner Gang!","PLAIN"];};
if(_winner == _playerGang) exitWith {titleText["Deine Gang hat die Fahne bereits eingenommen!","PLAIN"];};
if(!isNull _capturePlayer) exitWith {titleText["Die Fahne wird gerade eingenommen!","PLAIN"];};

SCHILD_DEALER setVariable ["Zone_Dealer_CapturePlayer", player, true];

disableSerialization;
private _title = "Bleibe in einem Radius von 15m";
5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    sleep 0.5;
    if (isNull _ui) then {
        5 cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	private _currentPlayer = SCHILD_DEALER getVariable ["Zone_Dealer_CapturePlayer", objNull];
    if(_cP >= 1 || life_isDead || _currentPlayer != player || player distance SCHILD_DEALER > 15 || GE_VORBEI) exitWith {};
};

5 cutText ["","PLAIN"];
SCHILD_DEALER setVariable["Zone_Dealer_CapturePlayer", nil, true];

if(_cP < 1) exitWith {};

SCHILD_DEALER setVariable["Zone_Dealer_Winner", _playerGang, true];
"Gangeroberung_Text" setMarkerText format [" Gangfight - %1", _playerGang];

_members = playableUnits select {_x distance player < 500};

[format ["Der Gangfight wurde von %1 eingenommen!",_playerGang], "Gangfight"] remoteExec ["life_fnc_message", _members];
["Deine Gang hat das Gebiet eingenommen! Halte diese bis der Timer abgelaufen ist", "Gangfight"] remoteExec ["life_fnc_message", (units (group player))];