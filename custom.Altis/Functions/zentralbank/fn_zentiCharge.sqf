if(zenti getVariable ["bombe", false]) exitWith {["Es befindet sich bereits eine Bombe am Tresor.", "Zentralbank"] spawn life_fnc_message;};

[player] remoteExec ["HC_fnc_chargeZenti", HC_LIFE];
[false, "blastingcharge", 1] call life_fnc_handleInv;
["Du hast eine Bombe am Tresor platziert. Halte 15 Minuten die Polizei davon ab die Sprengladung zu entschärfen!", "Zentralbank"] spawn life_fnc_message;
zenti setVariable ["bombe", true, true];