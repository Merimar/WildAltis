private _unit = param [0, objNull, [objNull]];
private _missionStart = param [1, objNull, [objNull]];
private _missionEnd = param [2, objNull, [objNull]];
private _playerPrice = param [3, -1, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_dpFinish"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _missionStart || isNull _missionEnd || _playerPrice isEqualTo -1) exitWith {};

private _price = round(5.0 * (_missionStart distance _missionEnd));
private _extraMoney = ([getPlayerUID _unit, side _unit, "farmPost"] call HC_fnc_getSkillAdvantage) * 1000;
private _price = _extraMoney + _price;

if(!(_price isEqualTo _playerPrice)) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte eine DP Mission abschliesen, hat aber einen falschen Preis angegeben (%4 != %5)", name _unit, getPlayerUID _unit, side _unit, [_playerPrice] call HC_fnc_numberSafe, [_price] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "dpFinish Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein dpFinish Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, side _unit, "cash", _price, true] call HC_fnc_handleMoney;
[getPlayerUID _unit, side _unit, "farmPost", floor ((_missionStart distance _missionEnd) / 625)] call HC_fnc_addSkill;

private _msg = format ["Der Spieler %1 (%2 - %3) hat $%4 durch eine DP mission gemacht (VON: %5 NACH: %6)", name _unit, getPlayerUID _unit, side _unit, [_price] call HC_fnc_numberSafe, toUpper(str _missionStart), toUpper(str _missionEnd)];
["DPLog", _msg] call HC_fnc_Log;