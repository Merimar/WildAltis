disableSerialization;
private _type = param [0, false];
private _display = findDisplay 1300;
private _playerList = _display displayCtrl 1301;
private _comboList = _display displayCtrl 1302;
private _index = lbCurSel _comboList;

if(_index isEqualTo -1) exitWith {};

private _currentSquad = player getVariable ["squad", "Nicht eingeloggt"];
private _targetSquad = if(_type) then {"Nicht eingeloggt"} else {_comboList lbText _index};

if(_currentSquad == _targetSquad) exitWith {["", "Du bist schon in dieser Streife"] spawn life_fnc_message;};

player setVariable ["squad", _targetSquad, true];
[] call life_fnc_streifensystemLBChange;

[format["Du hast deine Streife zu %1 gewechselt", _targetSquad], "Neue Streife"] spawn life_fnc_message;