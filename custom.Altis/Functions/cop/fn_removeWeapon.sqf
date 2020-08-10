_unit = _this select 0;
_action = _this select 1;

[player, _unit, _action] remoteExec ["HC_fnc_removeItemInteraction", HC_LIFE];

if(_action isEqualTo 1) then {titleText ["Waffen wurden gelöscht", "PLAIN"];};
if(_action isEqualTo 2) then {titleText ["Weste wurde gelöscht", "PLAIN"];};
if(_action isEqualTo 3) then {titleText ["Uniform wurde gelöscht", "PLAIN"];};
if(_action isEqualTo 4) then {titleText [format["Du hast %1 den Waffenschein entzogen", name _unit], "PLAIN"];};
if(_action isEqualTo 5) then {titleText [format["Du hast %1 den Führerschein entzogen", name _unit], "PLAIN"];};