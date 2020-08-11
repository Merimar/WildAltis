private _unit = param [0, objNull, [objNull]];
private _healPlayer = param [1, objNull, [objNull]];
private _withoutHealkit = param [2, false, [false]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_healPlayer"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _pItems = [getPlayerUID _unit, side _unit, "firstaidkit"] call HC_fnc_countVirt;
if(_withoutHealkit) then {_pItems = 1;};

if(_pItems < 1) exitWith {
private _reason1 = (isNull _healPlayer) then {format ["Der Spieler %1 (%2 - %3) wollte sich heilen, hat aber nicht genug Items", name _unit, getPlayerUID _unit, side _unit]} else {format ["Der Spieler %1 (%2 - %3) wollte den Spieler %4 (%5 - %6) heilen, hat aber nicht genug Items", name _unit, getPlayerUID _unit, side _unit, name _healPlayer, getPlayerUID _healPlayer, side _healPlayer]};
private _reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Heal Hack", [_reason1, _reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Heal Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if((side _unit) != independent && !_withoutHealkit) then {[getPlayerUID _unit, side _unit, "firstaidkit", 1, false] call HC_fnc_handleVirt;};
if(!_withoutHealkit) then {[getPlayerUID _unit, side _unit, "heal"] call HC_fnc_addSkill;} else {[getPlayerUID _unit, side _unit, "cash", 100, false] call HC_fnc_handleMoney;};

private _msg = if(isNull _healPlayer) then {format ["Der Spieler %1 (%2 - %3) hat sich geheilt", name _unit, getPlayerUID _unit, side _unit]} else {format ["Der Spieler %1 (%2 - %3) hat den Spieler %4 (%5 - %6) geheilt", name _unit, getPlayerUID _unit, side _unit, name _healPlayer, getPlayerUID _healPlayer, side _healPlayer]};
["HealLog", _msg] call HC_fnc_Log;

private _healAmount = if(([_unit, "heal"] call HC_fnc_isBuffOn) || _withoutHealkit) then {0} else {[getPlayerUID _unit, side _unit, "heal"] call HC_fnc_getSkillAdvantage};
if(isNull _healPlayer) then {
private _prevDamage = getDammage _unit;
_unit setDamage 0;
_unit setDammage _prevDamage;
if(_prevDamage > _healAmount) exitWith {};
_unit setDamage _healAmount;
}else {
_healPlayer setDamage _healAmount;
};