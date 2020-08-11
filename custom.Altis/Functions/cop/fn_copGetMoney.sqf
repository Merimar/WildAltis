if(isNull cursorObject) exitWith {};
if(!(isPlayer cursorObject)) exitWith {};

if(COP_MONEY_REMOVE_TIMER) exitWith {["", "Das geht nur alle 15 Sekunden"] spawn life_fnc_mesage;};

[] spawn {
COP_MONEY_REMOVE_TIMER = true;
sleep 15;
COP_MONEY_REMOVE_TIMER = false;
};

[player, cursorObject] remoteExec ["HC_fnc_copMoney", HC_LIFE];
["Du hast alle illegalen Banknoten des Spielers vernichtet.", "Geld gelöscht"] spawn life_fnc_mesage;