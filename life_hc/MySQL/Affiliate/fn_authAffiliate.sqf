private _unit = param [0, objNull, [objNull]];
private _code = param [1, "", [""]];
private _selection = param [2, false, [false]];

private _isHacker = [[_code], _unit, remoteExecutedOwner, "fn_authAffiliate"] call HC_fnc_checkSQLBreak;
if(_isHacker || count _code != 15) exitWith {};

private _pName = name _unit;
private _pID = getPlayerUID _unit;
private _pSide = side _unit;

if(_selection) then {
//Code eingelöst
private _query = format ["SELECT id FROM player_affiliate_referrals WHERE referrer_id = '%1'", _pID];
private _result = [_query, 2] call HC_fnc_asyncCall;

if(count _result > 0) exitWith {["Du hast bereits einen Code eingelöst.", "Affiliate"] remoteExec ["life_fnc_message", _unit]};

_query = format ["SELECT player_id FROM player_affiliate_codes WHERE code = '%1'", _code];
_result = [_query, 2] call HC_fnc_asyncCall;

if(count _result isEqualTo 0) exitWith {["Diesen Code gibt es nicht", "Affiliate"] remoteExec ["life_fnc_message", _unit]};
private _ownerID = _result select 0;

if(_ownerID == getPlayerUID _unit) exitWith {["Du kannst deinen eigenen Code nicht eingeben.", "Affiliate"] remoteExec ["life_fnc_message", _unit];};

_query = format ["INSERT INTO player_affiliate_referrals (owner_id, referrer_id) VALUES ('%1', '%2')", _ownerID, _pID];
[_query, 1] call HC_fnc_asyncCall;

["Du hast einen Affiliate Code eingelöst. Als Belohnung hast du einen Truck Boxer bekommen", "Affiliate"] remoteExec ["life_fnc_message", _unit];

_query = format ["INSERT INTO vehicles (vuid, owner_id, side_id, classname_id, color_id, material_id, insurance, active) VALUES ('%1', '%2', '%3', (SELECT id FROM life_classnames WHERE classname = '%4'), (SELECT id FROM life_vehicle_colors WHERE color = '%5'), (SELECT id FROM life_vehicle_materials WHERE material = '%6'), '%7', '%8')", round(random(100000000)), _pID, [_pSide] call HC_fnc_getSideID, "C_Van_01_box_F", "-1", "-1", 0, 0];
[_query,1] call HC_fnc_asyncCall;

private _codeName = "Kein Civ Name";

private _codeOwner = playableUnits select {getPlayerUID _x == _ownerID};
if(count _codeOwner > 0) then {
_codeOwner = _codeOwner select 0;
_codeName = name _codeOwner;
private _geheimZahl = [getPlayerUID _codeOwner] call HC_fnc_getGeheimzahl;
[getPlayerUID _codeOwner, "bank", 100000, true] call HC_fnc_handleMoney;
[format ["%1 hat deinen Affiliate Code eingegeben. Als Belohnung bekommst du $100.000", _pName], _geheimZahl] remoteExec ["life_fnc_receiveAffiliate", _codeOwner];
}else {
_query = format ["UPDATE player_money SET amount = ((SELECT amount FROM player_money WHERE player_id = '%1' AND type = 'BANK' AND side_id = '3') + 100000) WHERE  player_id = '%1' AND type = 'BANK' AND side_id = '3'", _ownerID];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["SELECT name FROM player_names WHERE player_id = '%1' AND side_id = '2'", _ownerID];
_result = [_query, 2] call HC_fnc_asyncCall;

if(count _result isEqualTo 0) exitWith {};

_codeName = _result select 0;
};

private _msg = format ["Der Spieler %1 (%2 - %3) hat einen Affiliate Code des Spielers %4 (%5 - %6) eingelöst (CODE: %7)", _pName, _pID, _pSide, _codeName, _ownerID, civilian, _code];
["AffiliateLog", _msg] call HC_fnc_Log;
}else {
//Code generiert
private _query = format ["SELECT id FROM player_affiliate_codes WHERE player_id = '%1'", _pID];
private _result = [_query, 2] call HC_fnc_asyncCall;

if(count _result > 0) exitWith {["Du hast bereits einen Code erstellt.", "Affiliate"] remoteExec ["life_fnc_message", _unit]};

_query = format ["SELECT id FROM player_affiliate_codes WHERE code = '%1'", _code];
_result = [_query, 2] call HC_fnc_asyncCall;

if(count _result > 0) exitWith {["Diesen Code gibt es schon, relog einmal um einen neuen Code zu erstellen.", "Affiliate"] remoteExec ["life_fnc_message", _unit]};

_query = format ["INSERT INTO player_affiliate_codes (player_id, code) VALUES ('%1', '%2')", _pID, _code];
[_query, 1] call HC_fnc_asyncCall;

["Du hast einen Affiliate Code erstellt. Andere Spieler können den Code nun einlösen!", "Affiliate"] remoteExec ["life_fnc_message", _unit];

private _msg = format ["Der Spieler %1 (%2 - %3) hat einen Affiliate Code generiert (CODE: %4)", _pName, _pID, _pSide, _code];
["AffiliateLog", _msg] call HC_fnc_Log;
};