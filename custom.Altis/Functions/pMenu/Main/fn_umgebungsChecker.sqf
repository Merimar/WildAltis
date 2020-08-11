if((time - life_action_delay) < 10) exitWith {};
life_action_delay = time;

private _display = findDisplay 4350;
private _playerCombo = _display displayCtrl 4353;
lbClear _playerCombo;

private _nearUnits = playableUnits select {(player distance _x) < 15 && _x != player && alive _x && !(_x getVariable ["invisible", false]) && !(_x getVariable ["Spectating", false])};

{
_playerCombo lbAdd (name _x);
_playerCombo lbSetData [(lbSize _playerCombo)-1, str _x];
}forEach _nearUnits;

private _info = _display ctrlCreate ["Trans_Text", -1];
_info ctrlSetText "Umgebung aktualisiert!";
_info ctrlSetFont "TahomaB";
_info ctrlSetPosition [0.5825 * safezoneW + safezoneX,0.225 * safezoneH + safezoneY,0.170156 * safezoneW,0.044 * safezoneH];
_info ctrlSetBackgroundColor [0, 0, 0, 0];
_info ctrlSetFade 0;
_info ctrlCommit 0;
_info ctrlSetFade 1;
_info ctrlCommit 10;

sleep 10;

ctrlDelete _info;

