private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_chargeZenti"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _pName = name _unit;
private _pID = getPlayerUID _unit;
private _pSide = side _unit;

[format ["%1 hat eine Sprengladung platziert", name _unit], true] call HC_fnc_adminMessage;
private _msg = format ["Der Spieler %1 (%2 - %3) hat die eine Sprengladung platziert", _pName, _pID, _pSide];
["BankLog", _msg] call HC_fnc_Log;

[_unit, "ZENTI_CHARGE"] call HC_fnc_fahndungHandle;

[time, 0] remoteExec ["life_fnc_zentiTimer", west];
[time, 1] remoteExec ["life_fnc_zentiTimer", (units (group _unit))];

private _time = time + (15 * 60);

for "_i" from 0 to 1 step 0 do {
    if(round(_time - time) < 1) exitWith {};
    if(!(zenti getVariable ["bombe",false])) exitWith {};
    sleep 1;
};

if(zenti getVariable ["bombe",false]) then {
zenti setVariable ["open", true, true];
_msg = format ["Der Spieler %1 (%2 - %3) hat die Zentralbank erfolgreich ausgeraubt", _pName, _pID, _pSide];
["BankLog", _msg] call HC_fnc_Log;
}else {
_msg = format ["Der Spieler %1 (%2 - %3) ist mit dem Raub auf die Zentralbank gescheitert", _pName, _pID, _pSide];
["BankLog", _msg] call HC_fnc_Log;
};

sleep 10;
zenti setVariable ["bombe", false, true];