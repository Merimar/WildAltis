private _unit = param [0, objNull, [objNull]];
private _name = param [1, "", [""]];
private _group = group _unit;
private _unitOwner = [getPlayerUID _unit] call HC_fnc_getOwnerID;

private _isHacker = [[_name], _unit, remoteExecutedOwner, "fn_gangCreate"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};
if(_name == "") exitWith {gang_money = false; _unitOwner publicVariableClient "gang_money";};

private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _name};
if(_gangIndex != -1) exitWith {[format["Eine Gang mit dem Namen %1 existiert bereits auf dem Server. Bitte wähle einen anderen Namen", _name], "Gang existiert schon"] remoteExec ["life_fnc_message", _unit];gang_money = false;_unitOwner publicVariableClient "gang_money";};

private _bank = [getPlayerUID _unit, "bank"] call HC_fnc_getMoney;
if(_bank < 100000) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte eine Gang erstellen, hat aber nicht genug Geld (%4 < %5)", name _unit, getPlayerUID _unit, side _unit, [_bank] call HC_fnc_numberSafe, [100000] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangCreate Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangCreate Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _query = format ["SELECT uid FROM gangs WHERE name='%1' AND deleted_at IS NULL", _name];
private _queryResult = [_query, 2] call HC_fnc_asyncCall;

if (count _queryResult > 0) exitWith {[format["Eine Gang mit dem Namen %1 existiert bereits auf dem Server. Bitte wähle einen anderen Namen", _name], "Gang existiert schon"] remoteExec ["life_fnc_message", _unit];gang_money = false;_unitOwner publicVariableClient "gang_money";};

private _sideID = [side _unit] call HC_fnc_getSideID;
_query = format ["SELECT gang_id FROM player_gang WHERE player_id = '%1' AND side_id = '%2'", getPlayerUID _unit, _sideID];
_queryResult = [_query, 2] call HC_fnc_asyncCall;

if(count _queryResult > 0) exitWith {[format["Du befindest dich aktuell in einer Gang mit folgender ID: %1", _queryResult select 0], "Du bist schon in einer Gang"] remoteExec ["life_fnc_message", _unit];gang_money = false;_unitOwner publicVariableClient "gang_money";};

private _id = round(random(999999));
_query = format ["INSERT INTO gangs (uid, owner_id, owner_side_id, name, max_members, bank_balance) VALUES ('%1', '%2', '%3', '%4', '8', '0')", _id, getPlayerUID _unit, _sideID, _name];
[_query, 1] call HC_fnc_asyncCall;

_group setVariable ["gang_name", _name, true];
_group setVariable ["gang_owner", getPlayerUID _unit, true];
_group setVariable ["gang_maxMembers", 8, true];
_group setVariable ["gang_bank", 0, true];
_group setVariable ["gang_permissions", [], true];
_group setVariable ["gang_ownerName", name _unit, true];
_group setVariable ["gang_buffs", [], true];
_group setVariable ["gang_id", _id, true];
_group setVariable ["gang_members", [getPlayerUID player], true];
[getPlayerUID _unit, "bank", 100000, false] call HC_fnc_handleMoney;
gang_money = true;
_unitOwner publicVariableClient "gang_money";

private _infoArray = [_id, _name, getPlayerUID _unit, name _unit, 8, 0, [[name _unit, getPlayerUID _unit, _sideID]], [], [], [], [], []];
PLAYER_GANG_ARRAY pushBack _infoArray;

[format["Du hast die Gang %1 erstellt. $100.000 wurden von deinem Konto entfernt", _name], "Gang erstellt"] remoteExec ["life_fnc_message", _unit];

private _msg = format ["Der Spieler %1 (%2 - %3) hat eine Gang gegründet (NAME: %4)", name _unit, getPlayerUID _unit, side _unit, _name];
["GangLog", _msg] call HC_fnc_Log;

sleep 1;

_query = format ["INSERT INTO player_gang (player_id, gang_id, side_id, level) VALUES ('%1', '%2', '%3', '6')", getPlayerUID _unit, _id, _sideID];
[_query, 1] call HC_fnc_asyncCall;

private _buffs = "true" configClasses (missionConfigFile >> "CfgBuffs");
{
_query = format ["INSERT INTO gang_buffs (gang_id, buff_id, amount) VALUES ('%1', (SELECT id FROM life_buffs WHERE buff = '%2'), '0')", _id, configName _x];
[_query, 1] call HC_fnc_asyncCall;
}forEach _buffs;