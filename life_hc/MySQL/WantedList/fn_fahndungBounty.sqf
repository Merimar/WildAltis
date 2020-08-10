private _unit = param [0, objNull];
private _cop = param [1, objNull];

if(isNull _unit || isNull _cop) exitWith {};

private _money = [getPlayerUID _unit] call HC_fnc_fahndungGetMoney;
[_unit, "", false, true] call HC_fnc_fahndungHandle;

if(_money <= 0) exitWith {};

private _newAmount = floor (_money / 2);
private _geheimZahl = [getPlayerUID _cop, side _cop] call HC_fnc_getGeheimzahl;
[getPlayerUID _cop, side _cop, "bank", _newAmount, true] call HC_fnc_handleMoney;

[_newAmount, _money, _geheimZahl] remoteExec ["life_fnc_bountyReceive", _cop];