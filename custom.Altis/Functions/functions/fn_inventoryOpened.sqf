private _unit = _this select 0;
private _container = _this select 1;
private _return = false;

if(!(_container isKindOf "Groundweaponholder") && !(_container isKindOf "AllVehicles")) then {
	_return = true;
	if(typeOf _container == "B_CargoNet_01_ammo_F") then {
		_return = (({_x distance player < 7 && alive _x} count playableUnits) > 1);
		[player, time] remoteExec ["HC_fnc_vitusCrate", HC_LIFE];
	};
}else {
	_isPack = getNumber(configFile >> "CfgVehicles" >> typeOf _container >> "isBackpack");
	if(_isPack isEqualTo 1) then {
		["", "Du kannst den Rucksack von anderen Leuten nicht öffnen"] spawn life_fnc_message;
		_return = true;
	}else {
		if(_container isKindOf "LandVehicle" || _container isKindOf "Ship" || _container isKindOf "Air") then {
			if(isNull objectParent player) then {
				_return = true;
			}else {
				if((locked _container) isEqualTo 2) then {
					_return = true;
				};
			};
		}else {
			if (_container isKindOf "Man" && !alive _container) then {
				_return = !(player inArea "VirtusZone");
			};
		};
	};
};

_return;