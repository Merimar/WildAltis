private _unit = param [0, objNull, [objNull]];
private _code = param [1, "0", [""]];

private _isHacker = [[_code], _unit, remoteExecutedOwner, "fn_supportCode"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

_code = parseNumber _code;

private _query = format ["SELECT id, receiver_id, side_id, amount FROM support_codes WHERE code = '%1' AND deleted_at IS NULL", _code];
private _result = [_query, 2] call HC_fnc_asyncCall;

if(count _result isEqualTo 0) exitWith {["Der von dir eingegebene Supportcode ist ungültig. Bitte warte eine Minute bevor du erneut einen Code absendest!", "Supportcode"] remoteExec ["life_fnc_message", _unit];};

private _id = _result select 0;
private _pID = _result select 1;
private _sideID = _result select 2;
private _amount = _result select 3;
private _pSideID = [side _unit] call HC_fnc_getGroupSideID;

if(getPlayerUID _unit != _pID) exitWith {["Der von dir eingegebene Supportcode gehört einem anderen Spieler. Bitte warte eine Minute bevor du erneut einen Code absendest!", "Supportcode"] remoteExec ["life_fnc_message", _unit];};
if(_pSideID != _sideID) exitWith {["Der von dir eingegebene Supportcode ist nicht für deine Fraktion", "Supportcode"] remoteExec ["life_fnc_message", _unit];};

private _geheimZahl = [getPlayerUID _unit, side _unit] call HC_fnc_getGeheimzahl;
[_geheimZahl, _amount] remoteExec ["life_fnc_supportCodeReceive", _unit];

[getPlayerUID _unit, side _unit, "bank", _amount, true] call HC_fnc_handleMoney;

_query = format ["UPDATE support_codes SET deleted_at = now() WHERE id = '%1'", _id];
[_query, 1] call HC_fnc_asyncCall;

private _log = format ["Der Spieler %1 (%2 - %3) hat einen Supportcode im Wert von %4 eingelöst", name _unit, getPlayerUID _unit, side _unit, [_amount] call HC_fnc_numberSafe];
["SupportLog", _log] call HC_fnc_log;