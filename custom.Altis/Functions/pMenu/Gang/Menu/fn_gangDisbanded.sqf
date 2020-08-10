["", "Deine Gang wurde aufgelöst"] spawn life_fnc_message;
_group = group player;
[player] join grpNull;

waitUntil {count units _group < 1};
deleteGroup _group;