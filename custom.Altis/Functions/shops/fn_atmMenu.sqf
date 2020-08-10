#include "..\script_macros.hpp"
disableSerialization;
if(isNull findDisplay 3850) then {createDialog "Atm";};

private _display = findDisplay 3850;
private _bank = _display displayCtrl 3851;
private _bargeld = _display displayCtrl 3852;
private _players = _display displayCtrl 3854;
private _gangWithdraw = _display displayCtrl 3860;
private _playerRank = [player, group player] call life_fnc_getGangRank;
private _gangMoney = (group player) getVariable ["gang_bank", 0];

if(_playerRank < 5) then {_gangWithdraw ctrlEnable false;};

lbClear _players;

_bank ctrlSetText format ["BANK: €%1", [BANK] call life_fnc_numberText];
_bargeld ctrlSetText format ["CASH: €%1", [CASH] call life_fnc_numberText];

{
if(!(_x getVariable ["isDead", false]) && _x != player) then {
_players lbAdd (name _x);
_players lbSetData [(lbSize _players)-1, str(_x)];
};
}forEach playableUnits;

_players lbSetCurSel 0;