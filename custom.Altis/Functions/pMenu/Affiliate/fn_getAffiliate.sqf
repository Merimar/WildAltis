#include "..\..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 1050;
private _listPlayers = _display displayCtrl 1051;
private _editCode = _display displayCtrl 1052;
private _btnGenerate = _display displayCtrl 1053;

private _code = "";
private _abc = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0"];

while {count _code < 15} do {
private _random = round (random (62));
_code = _code + (_abc select _random);
};

_btnGenerate ctrlEnable false;
_editCode ctrlSetText _code;
life_code = _code;
[player, _code, false] remoteExec ["HC_fnc_authAffiliate", HC_LIFE];