private _uid = _this select 0;
private _unitC = objNull;

for "_int" from 0 to 10 step 1 do {
private _unitIndex = allPlayers findIf {getPlayerUID _x == _uid};
if(_unitIndex != -1) exitWith {_unitC = allPlayers param [_unitIndex, objNull];};
sleep 1;
};

JOIN_IN_PROGRESS = JOIN_IN_PROGRESS - [_uid];
missionNamespace setVariable [format ["Player_%1", _uid], _unitC];