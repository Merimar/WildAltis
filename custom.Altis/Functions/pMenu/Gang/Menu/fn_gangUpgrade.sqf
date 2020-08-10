disableSerialization;
private _display = findDisplay 4200;
private _group = group player;
private _playerRank = [player, _group] call life_fnc_getGangRank;
private _maxMembers = _group getVariable ["gang_maxMembers", 8];
private _maxSize = getNumber (missionConfigFile >> "Life_Settings" >> "gang_max_size");

if(_maxMembers >= _maxSize) exitWith {[format ["Deine Gang hat das maximale Spielerlimit von %1 Leuten erreicht.", _maxSize], "Gang ist voll!"] spawn life_fnc_message;};

private _bank = _group getVariable ["gang_bank", 0];
private _slots = _maxMembers + 1;
private _price = round(_slots * 10000);

if(_playerRank < 2) exitWith {["", "Keine Rechte!"] spawn life_fnc_message;};
if(_bank < _price) exitWith {[format["Das Gangupgrade kostet €%1. Deine Gang hat aber nur €%2", [_price] call life_fnc_numberText, [_bank] call life_fnc_numberText], "Kein Geld"] spawn life_fnc_message;};

_action = ["Möchtest du die Gang wirklich upgraden?", format["Kosten: €%1", [_price] call life_fnc_numberText], "Ja", "Nein"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

[format ["Du hast die Gang auf %1 Slots geupgradet. €%2 wurden von der Gangkasse entfernt!", _slots, [_price] call life_fnc_numberText], "Gangupgrade"] spawn life_fnc_message;
[player, _price, _group] remoteExec ["HC_fnc_gangUpgrade", HC_LIFE];