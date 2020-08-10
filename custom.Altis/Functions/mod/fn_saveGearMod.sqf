player setVariable ["Event_Loadout", (getUnitLoadout player), true];
["Loadout erfolgreich gespeichert!", false, "slow"] call life_fnc_showNotification;