_pos = getPos player;
_pos = [_pos select 0, _pos select 1, 0];
bank_obj setVariable ["Scroll_Pos", _pos, true];
["Scrollrad Position erfolgreich gespeichert!", true, "slow"] call life_fnc_showNotification;