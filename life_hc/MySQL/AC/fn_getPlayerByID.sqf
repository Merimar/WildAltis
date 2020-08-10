private _id = _this select 0;
private _return = ["-1", false];

if(_id isEqualTo 0) exitWith {_return;};

private _index = SAVE_ARRAY findIf {(_x select (SAVE_STATE_INDEX - 1)) isEqualTo _id};
if(_index isEqualTo -1) exitWith {_return;};

private _pID = SAVE_ARRAY select _index select 0;

private _playerIndex = allPlayers findIf {getPlayerUID _x == _pID};
if(_playerIndex isEqualTo -1) exitWith {_return;};

_return = [allPlayers select _playerIndex, true];
_return;