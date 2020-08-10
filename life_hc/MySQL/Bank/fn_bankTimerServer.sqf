private _vault = param [0, objNull, [objNull]];
private _unit = param [1, objNull, [objNull]];
private _time = time + (8 * 60);

for "_i" from 0 to 1 step 0 do {
    if(round(_time - time) < 1) exitWith {};
	if(!(_vault getVariable ["opening",false])) exitWith {};
	if(isNull _unit) exitWith {_vault setVariable ["opening", false, true];};
    sleep 0.08;
};