private _unit = param [0, objNull, [objNull]];
private _item = param [1, "", [""]];

private _isHacker = [[_item], _unit, remoteExecutedOwner, "fn_triggerFarmEvent", true] call HC_fnc_checkSQLBreak;
if(_isHacker || _item == "") exitWith {};

private _itemName = getText (missionConfigFile >> "Items" >> _item >> "name");
private _msg = format ["Der Admin %1 (%2 - %3) hat für das Item %4 ein Farmevent gestartet", name _unit, getPlayerUID _unit, side _unit, _itemName];
["MarktLog", _msg] call HC_fnc_Log;

if(!(isClass (missionConfigFile >> "LifeCfgFarmEvent" >> _item))) exitWith {};

private _farmRoute = missionConfigFile >> "LifeCfgFarmEvent" >> _item;
private _messageStart = getText(_farmRoute >> "descriptionStart");
private _messageEnd = getText(_farmRoute >> "descriptionEnd");
private _displayName = getText(_farmRoute >> "name");
private _time = getNumber (_farmRoute >> "time");
private _minValue = getNumber(_farmRoute >> "minValue");
private _maxValue = getNumber(_farmRoute >> "maxValue");
private _difference = _maxValue - _minValue;
private _multiplier = _minValue + random _difference;

private _oldPrice = getNumber (missionConfigFile >> "Items" >> _item >> "sellPrice");
private _newPrice = round (_oldPrice * _multiplier);
private _kursPrefix = _newPrice / _oldPrice;

private _index = MARKT_ARRAY findIf {(_x select 0) == _item};
if(_index isEqualTo -1) exitWith {};

CANCEL_EVENT = true;
sleep 1;
CANCEL_EVENT = false;

(MARKT_ARRAY select _index) set [6, _multiplier];
publicVariable "MARKT_ARRAY";
MARKT_SERVER_ARRAY = + MARKT_ARRAY;

[_messageStart, "Neues Marktevent"] remoteExec ["life_fnc_message", -2];
bank_obj setVariable ["MarktEventMessage", _messageStart, true];
bank_obj setVariable ["MarktEventPercentage", _kursPrefix, true];

_time = time + _time;

waitUntil {(_time - time) <= 0 || CANCEL_EVENT};
CANCEL_EVENT = false;

(MARKT_ARRAY select _index) set [6, -1];
publicVariable "MARKT_ARRAY";
MARKT_SERVER_ARRAY = + MARKT_ARRAY;

[_messageEnd, "Marktevent vorbei"] remoteExec ["life_fnc_message", -2];
bank_obj setVariable ["MarktEventMessage", nil, true];
bank_obj setVariable ["MarktEventPercentage", nil, true];