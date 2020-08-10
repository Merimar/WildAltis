disableSerialization;
if(isNull findDisplay 4250) then {createDialog "GangBuffs";};
private _display = findDisplay 4250;
private _listBuffs = _display displayCtrl 4251;
private _listBuffsActive = _display displayCtrl 4252;
private _availableBuffsText = _display displayCtrl 4253;
private _activeBuffsText = _display displayCtrl 4254;
private _btnActivate = _display displayCtrl 4255;

private _group = group player;
private _playerRank = [player, _group] call life_fnc_getGangRank;
private _gangBuffs = _group getVariable ["gang_buffs", []];
private _activeBuffs = _group getVariable ["gang_active_buffs", []];

if(_playerRank < 3) exitWith {["", "Dafür hast du keine Rechte!"] spawn life_fnc_message;};
lbClear _listBuffs;
lbClear _listBuffsActive;

private _avAmount = 0;

{
private _name = _x select 0;
private _amount = _x select 1;
private _buffName = getText (missionConfigFile >> "CfgBuffs" >> _name >> "name");
_avAmount = _avAmount + _amount;
if(_amount > 0) then {
_listBuffs lbAdd (format ["%1 - [%2]", _buffName, _amount]);
_listBuffs lbSetData [lbSize (_listBuffs)-1, _name];
};
}forEach _gangBuffs;

{
private _buff = _x select 0;
private _time = _x select 1;
private _buffName = getText (missionConfigFile >> "CfgBuffs" >> _buff >> "name");
private _duration = getNumber (missionConfigFile >> "CfgBuffs" >> _buff >> "duration");
private _endTime = _time + _duration;
_listBuffsActive lbAdd format ["%1 - [ZEIT: %2 Minuten]", _buffName, [(_endTime - time),"MM:SS"] call BIS_fnc_secondsToString];
}forEach _activeBuffs;

_availableBuffsText ctrlSetText format ["Verfügbare Buffs (%1)", _avAmount];
_activeBuffsText ctrlSetText format ["Aktive Buffs (%1)", count _activeBuffs];