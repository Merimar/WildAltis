private _vehicle = param [0, objNull, [objNull]];
private _siren = param [1, "", [""]];

if(isNull _vehicle) exitWith {};

private _length = switch (_siren) do {
case "medic_siren_normal" : {9.7};
case "cop_siren_normal" : {4.3};
case "cop_siren_call" : {7};
case "cop_siren_yelp" : {3};
};

private _sirenState = format ["%1_state", _siren];
private _isLoop = _siren in ["medic_siren_normal", "cop_siren_normal"];

_vehicle setVariable [_siren, true, true];

for "_i" from 0 to 1 step 0 do {
	private _crew = (crew _vehicle) select {(side _x) in [west, independent] && alive _x};
	if(count _crew isEqualTo 0) then {_vehicle setVariable [_sirenState, false, true];};
    if(isNull _vehicle) exitWith {};
	if(!(_vehicle getVariable [_sirenState, false]) || !(alive _vehicle)) exitWith {};
	private _distance = if(_vehicle isKindOf "Air") then {700} else {500};
    _vehicle say3D [_siren, _distance];
    sleep _length;
	if(!_isLoop) exitWith {_vehicle setVariable [_sirenState, false, true];};
};

_vehicle setVariable [_siren, false, true];