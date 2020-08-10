private _unit = param [0, objNull];
[player, _unit, 0] remoteExec ["HC_fnc_removeItemInteraction", HC_LIFE];
[format["Du hast dem Spieler %1 seine Kommunikationsmittel weggenommen!", name _unit], "Kommunikationsmittel"] spawn life_fnc_message;