private _exists = round (random 100);
if(_exists >= EVENT_PERCENTAGE) exitWith {};

private _dice = round (random EVENT_MAX_TIME);
private _sleep = _dice + EVENT_MIN_TIME;

sleep _sleep;

private _farmArray = "true" configClasses(missionConfigFile >> "LifeCfgFarmEvent");
private _farmRoute = selectRandom _farmArray;
private _name = configName _farmRoute;
private _messageStart = getText(_farmRoute >> "descriptionStart");
private _messageEnd = getText(_farmRoute >> "descriptionEnd");
private _displayName = getText(_farmRoute >> "name");
private _time = getNumber(_farmRoute >> "time");
private _minValue = getNumber(_farmRoute >> "minValue");
private _maxValue = getNumber(_farmRoute >> "maxValue");
private _difference = _maxValue - _minValue;
private _multiplier = _minValue + random _difference;

private _oldPrice = getNumber (missionConfigFile >> "Items" >> _name >> "sellPrice");
private _newPrice = round (_oldPrice * _multiplier);
private _kursPrefix = _newPrice / _oldPrice;

private _index = MARKT_ARRAY findIf {(_x select 0) == _name};
if(_index isEqualTo -1) exitWith {};

(MARKT_ARRAY select _index) set [6, _multiplier];
publicVariable "MARKT_ARRAY";
MARKT_SERVER_ARRAY = + MARKT_ARRAY;

[_messageStart, "Neues Marktevent", 30] remoteExec ["life_fnc_message", -2];
bank_obj setVariable ["MarktEventMessage", _messageStart, true];
bank_obj setVariable ["MarktEventPercentage", _kursPrefix, true];

_time = time + _time;

waitUntil {(_time - time) <= 0 || CANCEL_EVENT};
CANCEL_EVENT = false;

(MARKT_ARRAY select _index) set [6, -1];
publicVariable "MARKT_ARRAY";
MARKT_SERVER_ARRAY = + MARKT_ARRAY;

[_messageEnd, "Marktevent vorbei", 30] remoteExec ["life_fnc_message", -2];
bank_obj setVariable ["MarktEventMessage", nil, true];
bank_obj setVariable ["MarktEventPercentage", nil, true];