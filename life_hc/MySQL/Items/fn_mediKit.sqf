private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_mediKit"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _pItems = [getPlayerUID _unit, "medikit"] call HC_fnc_countVirt;

if(_pItems < 1) exitWith {
private _reason1 = format ["Der Spieler %1 (%2 - %3) wollte sich mit einem MediKit heilen, hat aber nicht genug Items", name _unit, getPlayerUID _unit, side _unit];
private _reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Heal Hack", [_reason1, _reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Heal Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, "medikit", 1, false] call HC_fnc_handleVirt;
[getPlayerUID _unit, "heal"] call HC_fnc_addSkill;
_unit setDammage 0;

private _msg = format ["Der Spieler %1 (%2 - %3) hat sich mit einem MediKit geheilt", name _unit, getPlayerUID _unit, side _unit];
["HealLog", _msg] call HC_fnc_Log;