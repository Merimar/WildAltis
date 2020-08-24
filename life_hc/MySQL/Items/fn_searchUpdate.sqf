private _cop = param [0, objNull, [objNull]];
private _removePlayer = param [1, objNull, [objNull]];

private _isHacker = [[], _cop, remoteExecutedOwner, "fn_searchUpdate"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _removePlayer) exitWith {};

private _items = [getPlayerUID _removePlayer] call HC_fnc_getVirt;
private _searchSkill = [getPlayerUID _cop, "search"] call HC_fnc_getSkillAdvantage;
private _nameArray = [];
private _removeArray = [];

{
private _item = _x select 0;
private _amount = _x select 1;
private _isIllegal = getNumber (missionConfigFile >> "Items" >> _item >> "illegal");
private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");

if(_amount > 0) then {
private _random = round(random(100)) + 1;

if(_random < _searchSkill && _isIllegal isEqualTo 1) then {
_nameArray pushBack (format ["%1 %2", _amount, _displayName]);
_removeArray pushBack _item;
[getPlayerUID _removePlayer, _item, _amount, false] call HC_fnc_handleVirt;
};
};
}forEach _items;

private _removeText = _nameArray joinString "<br/>";

[_cop, _removeArray, _removeText] remoteExec ["life_fnc_searchClient", _removePlayer];
if(count _removeArray > 0) then {
[_removeText, "Diese Items wurden entfernt"] remoteExec ["life_fnc_message", _cop];
}else {
["", "Es wurden keine illegalen Items gefunden"] remoteExec ["life_fnc_message", _cop];
};

_removePlayer setVariable ["UranTime", 0, true];

_removeText = _nameArray joinString ", ";

private _msg = format ["Der Spieler %1 (%2 - %3) hat den Spieler %4 (%5 - %6) durchsucht, und hat (%7) entfernt", name _cop, getPlayerUID _cop, side _cop, name _removePlayer, getPlayerUID _removePlayer, side _removePlayer, _removeText];
["SearchLog", _msg] call HC_fnc_Log;