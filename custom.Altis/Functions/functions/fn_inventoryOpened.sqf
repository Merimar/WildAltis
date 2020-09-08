private _unit = _this select 0;
private _container = _this select 1;
private _return = false;

if(!(player getVariable ["restrained", false])) then {
	if(!(_container isKindOf "Groundweaponholder") && !(_container isKindOf "AllVehicles") && !(_container getVariable ["rewardbox", false])) then {
		_return = true;
		if(typeOf _container in ["B_CargoNet_01_ammo_F", "Box_NATO_Ammo_F"]) then {
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
					_return = true;
				};
			};
		};
	};	
} else {
	_return = true;
};

if(_return) then {
	[] spawn {
		for "_i" from 1 to 10 do {
			closeDialog 0;
			sleep 0.1;
		};
		if(!isNull (findDisplay 602)) then {
			closeDialog 0;
		};
	};
};

_return;