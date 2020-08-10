disableSerialization;
private _nearUnits = (nearestObjects[player, ["Man"], 15]) arrayIntersect playableUnits;
if(count _nearUnits > 1) exitWith {["Wenn du einen Spieler lootest dürfen keine Spieler in deiner Nähe sein.", "Spieler looten"] spawn life_fnc_message;};
if(LOOT_TIMER) exitWith {["Du kannst nur alle 3 Sekunden Geld nehmen.", "Spieler looten"] spawn life_fnc_message;};

[] spawn {LOOT_TIMER = true;sleep 3;LOOT_TIMER = false;};

private _display = findDisplay 5100;
private _moneyBtn = _display displayCtrl 5103;

private _playerUID = LOOT_INFORMATION select 0;
private _playerName = LOOT_INFORMATION select 1;
private _playerItems = LOOT_INFORMATION select 2;
private _cash = LOOT_INFORMATION select 3;
private _corpse = LOOT_INFORMATION select 4;

if(isNull _corpse) exitWith {["", "Der Spieler ist respawnt"] spawn life_fnc_message;};
if(_cash < 1) exitWith {["", "Hier gibt es nichts mehr zu holen"] spawn life_fnc_message;};

_moneyBtn ctrlSetText "Ausgeraubt";
_moneyBtn ctrlEnable false;

[format["Du hast dem Spieler %1 €%2 gestohlen.", _playerName, [_cash] call life_fnc_numberText], "Spieler ausgeraubt"] spawn life_fnc_message;
CASH = CASH + _cash;
[player, _cash, _corpse, _playerUID] remoteExec ["HC_fnc_takeLootMoney", HC_LIFE];
LOOT_INFORMATION = [_playerUID, _playerName, _playerItems, 0, _corpse];