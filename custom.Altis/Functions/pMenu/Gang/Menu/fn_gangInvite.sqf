disableSerialization;
private _display = findDisplay 4200;
private _list = _display displayCtrl 4201;
private _group = group player;
private _playerRank = [player, _group] call life_fnc_getGangRank;
if(_playerRank < 1) exitWith {["Keine Rechte!"] spawn life_fnc_message;};
if(GANG_CUR_ACTION == "OFFLINE") exitWith {};

lbClear _list;

if(GANG_CUR_ACTION == "INVITE") then {
GANG_CUR_ACTION = "";

{
private _xRank = [_x, _group] call life_fnc_getGangRank;
if(_x != player) then {
_list lbAdd format ["%1 [%2]", name _x, _xRank];
_list lbSetData [lbSize (_list)-1, str _x];
};
}forEach (units _group);

}else {
GANG_CUR_ACTION = "INVITE";
["", "Mache einen Doppelklick auf den Spieler den du einladen willst"] spawn life_fnc_message;

{
if(_x != player && ((group _x) getVariable ["gang_name", ""]) == "" && (side _x) isEqualTo playerSide) then {
_list lbAdd (name _x);
_list lbSetData [lbSize (_list)-1, str _x];
};
}forEach playableUnits;
};