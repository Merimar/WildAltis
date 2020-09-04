#include "..\script_macros.hpp"
private _vehicle = param [0, objNull];
private _enable = param [1, true];
if(isNull _vehicle) exitWith {};

if(!_enable) exitWith {
titleText ["Autosammeln abgeschaltet", "PLAIN"];
_vehicle setVariable ["mining", false, true];
};

if(fuel _vehicle isEqualTo 0) exitWith {["Das Fahrzeug hat keinen Treibstoff mehr. Um das Gerät weiter zu benutzen fülle es wieder auf!", "Kein Treibstoff"] spawn life_fnc_message;};

private _weight = [_vehicle] call life_fnc_vehicleWeight;
private _maxWeight = _weight select 0;
private _currentWeight = _weight select 1;
if(_currentWeight >= _maxWeight) exitWith {["", "Das Fahrzeug ist voll"] spawn life_fnc_message;};

private _routeConfig = "true" configClasses (missionConfigFile >> "CfgFarmRoutes");
private _route = _routeConfig select {
_fields = getArray (_x >> "fields");
_zoneSize = getNumber (_x >> "farmZonesize");
_isIn = count (_fields select {(_vehicle distance (getMarkerPos _x)) < _zoneSize}) > 0;
_isIn;
};

if(count _route isEqualTo 0) exitWith {["", "Keine Route in der Nähe"] spawn life_fnc_message;};
_route = _route select 0;
if((configName _route) in ["Helium", "Dunkle", "Relikt", "Raritaet"]) exitWith {};

private _farmItem = getText (_route >> "gatherItem");

_vehicle setVariable ["mining", true, true];
[_vehicle] remoteExec ["life_fnc_soundDevice", -2];

for "_i" from 0 to 1 step 0 do {
    if(isNull _vehicle || {!alive _vehicle}) exitWith {};
	if(!(_vehicle getVariable ["mining", false])) exitWith {};
    if((isEngineOn _vehicle) || ((speed _vehicle) > 5)) exitWith {titleText ["Das Fahrzeug wurde gestartet - sammeln beendet.", "PLAIN"];};
    if(fuel _vehicle isEqualTo 0) exitWith {titleText ["Das Fahrzeug hat keinen Tank mehr", "PLAIN"];};

    titleText ["Das Fahrzeug sammelt ...","PLAIN"];
    private _time = time + 27;

    waitUntil {
        if ((isEngineOn _vehicle) || ((speed _vehicle) > 5)) exitWith {
            _vehicle setVariable ["mining", false, true];
            titleText ["Das Fahrzeug wurde gestartet - sammeln beendet.", "PLAIN"];
            true
        };

        if (round(_time - time) < 1) exitWith {true};

        if (fuel _vehicle < 0.1) exitWith {
            _vehicle setVariable["mining", false, true];
            titleText ["Das Fahrzeug hat keinen Sprit mehr", "PLAIN"];
            true
        };

        sleep 0.2;
        false
    };

    if ((isEngineOn _vehicle) || ((speed _vehicle) > 5) || !(_vehicle getVariable ["mining", false])) exitWith {
        _vehicle setVariable["mining", false, true];
        titleText ["Das Fahrzeug wurde gestartet - sammeln beendet.", "PLAIN"];
    };

    private _vehicle_data = _vehicle getVariable ["Trunk", [[], 0]];
    private _inv = _vehicle_data select 0;
    private _space = _vehicle_data select 1;
    private _itemIndex = _inv findIf {_x select 0 == _farmItem};
    private _weight = [_vehicle] call life_fnc_vehicleWeight;
    private _sum = [_farmItem, 15, _weight select 1, _weight select 0] call life_fnc_calWeightDiff;

    if (_sum < 1) exitWith {
        titleText ["Das Fahrzeug ist voll", "PLAIN"];
        _vehicle setVariable ["mining", false, true];
    };

    if (fuel _vehicle < 0.1) exitWith {titleText ["Das Fahrzeug wurde gestartet - sammeln beendet.", "PLAIN"];};

    if (local _vehicle) then {
        _vehicle setFuel (fuel _vehicle)-0.045;
    } else {
        [_vehicle, (fuel _vehicle)-0.045] remoteExec ["life_fnc_setFuel", _vehicle];
    };

    if (fuel _vehicle < 0.1) exitWith {
        titleText ["Das Fahrzeug wurde gestartet - sammeln beendet.", "PLAIN"];
        _vehicle setVariable["mining", false, true];
    };
	
	if (_itemIndex isEqualTo -1) then {
        _inv pushBack [_farmItem, _sum];
    } else {
        _val = (_inv select _itemIndex) select 1;
        (_inv select _itemIndex) set [1, _val + _sum];
    };
	
	[player, _vehicle, _farmItem, _sum] remoteExec ["HC_fnc_deviceGather", HC_LIFE];

    private _itemName = getText (missionConfigFile >> "Items" >> _farmItem >> "name");
	private _itemWeight = ([_farmItem] call life_fnc_itemWeight) * _sum;
    titleText [format["Sammeln beendet, das Gerät hat %1 %2 gesammelt", _sum, _itemName], "PLAIN"];
    
    _vehicle setVariable ["Trunk", [_inv, _space + _itemWeight], true];
    _weight = [_vehicle] call life_fnc_vehicleWeight;
    _sum = [_farmItem, 15, _weight select 1, _weight select 0] call life_fnc_calWeightDiff;

    if (_sum < 1) exitWith {
        _vehicle setVariable ["mining", false, true];
        titleText ["Das Fahrzeug ist voll", "PLAIN"];
    };

    sleep 2;
};

_vehicle setVariable ["mining", false, true];