disableSerialization;
if(life_action_inUse) exitWith {};
private _search = nearestObjects [getPos SERVICE_CHOPPER, ["Air"], 20];
private _title = "Fülle Helikopter auf";

if(count _search isEqualTo 0) exitWith {["In der Nähe des Helikopterlandeplatzes wurde kein Fahrzeug gefunden. Die maximale Distanz ist 20m!", "Kein Fahrzeug gefunden"] spawn life_fnc_message;};
private _vehicle = _search select 0;

life_action_inUse = true;
5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%", _title];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    sleep  0.2;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format["%3 (%1%2)...", round(_cP * 100), "%", _title];
    if (_cP >= 1 || life_isDead || isNull _vehicle || {!(alive _vehicle) || _vehicle distance SERVICE_CHOPPER > 20}) exitWith {};
};

life_action_inUse = false;
5 cutText ["","PLAIN"];

if(_cP < 1) exitWith {["Das Fahrzeug wurde zerstört oder befindest sich nicht mehr auf dem Helikopterlandeplatz.", "Nicht möglich"] spawn life_fnc_message;};

titleText ["Dein Helikopter wurde repariert","PLAIN"];
if(!local _vehicle) then {[_vehicle, 1] remoteExecCall ["life_fnc_setFuel", _vehicle];} else {_vehicle setFuel 1;};
[player, _vehicle] remoteExec ["HC_fnc_serviceChopper", HC_LIFE];