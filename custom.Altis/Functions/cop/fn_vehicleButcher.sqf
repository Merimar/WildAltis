disableSerialization;
private _vehicle = param [0, objNull, [objNull]];
private _nearHemtts = nearestObjects [getPos _vehicle, ["B_Truck_01_box_F"], 30];
private _butcher = ({"hemtt_1.jpg" in (str (getObjectTextures _x))} count _nearHemtts) > 0;

if(player distance _vehicle > 20 || isEngineOn _vehicle || speed _vehicle > 0 || !(alive _vehicle) || !_butcher) exitWith {};

["Du bist dabei ein Fahrzeug zu zerstören! Halte dich hierfür in einem 20 Meter Radius zum Fahrzeug auf und achte darauf, dass der Butcher in der Nähe steht.", "Butcher"] spawn life_fnc_message;

5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
private _title = "Zerstöre Fahrzeug";
private _cP = 0.01;

_titleText ctrlSetText format["%2 (1%1)...", "%", _title];
_progressBar progressSetPosition 0.01;

for "_i" from 0 to 1 step 0 do {
    sleep 3;
	if (isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
    _cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...", round(_cP * 100), "%", _title];
    if(isNull _vehicle || _cP >= 1 || life_isDead || life_isknocked || {player getVariable ["restrained",false]}) exitWith {};
	_nearHemtts = nearestObjects [getPos _vehicle, ["B_Truck_01_box_F"], 30];
	_butcher = ({"hemtt_1.jpg" in (str (getObjectTextures _x))} count _nearHemtts) > 0;
	if(player distance _vehicle > 20 || isEngineOn _vehicle || speed _vehicle > 0 || !(alive _vehicle) || !_butcher) exitWith {};
};

5 cutText ["","PLAIN"];
if(_cP < 1) exitWith {titleText ["Abgebrochen", "PLAIN"];};

["Du hast das Fahrzeug zerstört!", "Butcher"] spawn life_fnc_message;
[player, _vehicle] remoteExec ["HC_fnc_butcherVehicle", HC_LIFE];