disableSerialization;
private _vault = param [0, objNull, [objNull]];
private _robber = param [1, objNull, [objNull]];

6 cutRsc ["life_timer","PLAIN", -1, true];
private _uiDisp = uiNamespace getVariable "life_timer";
private _timer = _uiDisp displayCtrl 38301;
private _time = time + (8 * 60);

for "_i" from 0 to 1 step 0 do {
    if(isNull _uiDisp) then {
        6 cutRsc ["life_timer","PLAIN", -1, true];
        _uiDisp = uiNamespace getVariable "life_timer";
        _timer = _uiDisp displayCtrl 38301;
    };
    if(round(_time - time) < 1) exitWith {};
	if(!(_vault getVariable ["opening",false])) exitWith {};
	if(isNull _robber) exitWith {};
    _timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
    sleep 0.08;
};

6 cutText["","PLAIN"];