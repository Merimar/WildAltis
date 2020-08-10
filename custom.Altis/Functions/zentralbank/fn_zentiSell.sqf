disableSerialization;
private _vehicle = param [0, objNull];
if(isNull _vehicle) exitWith {};
if((_vehicle distance zenti_sell_1) > 20 && (_vehicle distance zenti_sell_2) > 20) exitWith {["Du bist nicht in der Nähe eines Giftankäufers.", "Zentralbank"] spawn life_fnc_message;};

private _currentVehicleFuel = _vehicle getVariable ["zenti_fuel", 0];
private _seller = _vehicle getVariable ["zenti_seller", objNull];
if(_currentVehicleFuel <= 0) exitWith {["Das Fahrzeug hat kein Skorpionsgift geladen.", "Zentralbank"] spawn life_fnc_message;};
if(!(isNull _seller)) exitWith {["Es verkauft bereits jemand das Skorpionsgift.", "Zentralbank"] spawn life_fnc_message;};

_vehicle setVariable ["zenti_seller", player, true];

5 cutRsc ["life_progress","PLAIN"];
private _title = "Bleibe in einem Radius von 20m";
private _ui = uiNamespace getVariable "life_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
private _sleep = (_currentVehicleFuel / 100) * 10;
_titleText ctrlSetText format["%2 (1%1)...", "%", _title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    sleep _sleep;
    if (isNull _ui) then {
        5 cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...", round(_cP * 100), "%", _title];
    if(_cP >= 1 || player != (_vehicle getVariable ["zenti_seller", objNull]) || life_isDead || life_istazed || life_isknocked || {player getVariable["restrained",false]} || ((_vehicle distance zenti_sell_1) > 20 && (_vehicle distance zenti_sell_2) > 20) || (_vehicle getVariable ["zenti_fuel", 0]) <= 0) exitWith {};
};

_vehicle setVariable ["zenti_seller", nil, true];
5 cutText ["","PLAIN"];

if(_cP < 1) exitWith {titleText ["Abgebrochen", "PLAIN"];};

_vehicle setVariable ["zenti_fuel", 0, true];
_money = _currentVehicleFuel * 1000000;
CASH = CASH + _money;
[format ["Du hast %1 Skorpionsgift für €%2 verkauft. Jetzt aber schnell weg hier, bevor die Polizei kommt!", _currentVehicleFuel, [_money] call life_fnc_numberText], "Giftankäufer"] spawn life_fnc_message;
[player, _currentVehicleFuel] remoteExec ["HC_fnc_sellZenti", HC_LIFE];