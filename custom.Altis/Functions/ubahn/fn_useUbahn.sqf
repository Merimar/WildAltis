disableSerialization;
private _display = findDisplay 3600;
private _spawnList = _display displayCtrl 3601;
private _curSel = lbCurSel _spawnList;

if(_curSel isEqualTo -1) exitWith {};
if(CASH < 10000) exitWith {["Du hast nicht genug Geld für ein Ubahn Ticket. Ein Ubahn Ticket kostet €10.000!", "Ubahn"] spawn life_fnc_message;};

private _marker = _spawnList lbData _curSel;
private _displayName = _spawnList lbText _curSel;
private _random = round (random (100));
private _msg = if(_random isEqualTo 31) then {format ["Deine Ubahn hatte einen schweren Unfall, du bist gestorben, deine Ticketnummer: %1", _random]} else {format ["Du bist an deinem Ziel angekommen, deine Ticketnummer: %1",_random]};
[format ["Deine Fahrt in Richtung %1 beginnt nun ...", _displayName], "Ubahn"] spawn life_fnc_message;
closeDialog 0;

15 cutText ["", "BLACK FADED"];
15 cutFadeOut 9999999;
playSound "ubahn";
sleep 17;
15 cutText ["", "BLACK IN"];
if(CASH < 10000 || life_isDead || {player getVariable ["restrained", false]} || life_istazed) exitWith {["Du bist nicht in die Ubahn eingestiegen", "Ubahn"] spawn life_fnc_message;};
CASH = CASH - 10000;

[player, 10000, _displayName, _marker, _random] remoteExec ["HC_fnc_ubahn", HC_LIFE];
[_msg, "Ubahn"] spawn life_fnc_message;