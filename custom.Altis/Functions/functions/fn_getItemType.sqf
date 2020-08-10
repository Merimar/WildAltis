_itm = _this select 0;
private _indexLocker =
if (_itm != "") then {
	if (isClass(configFile >> "CfgWeapons" >> _itm)) then {
		if (getNumber(configFile >> "CfgWeapons" >> _itm >> "type") == 1) then {
			0; //PrimaryWeapon
		} else {
			if (getNumber(configFile >> "CfgWeapons" >> _itm >> "type") == 4) then {
				1; //Raketenwerfer
			} else {
			if (getNumber(configFile >> "CfgWeapons" >> _itm >> "type") == 2) then {
				2; //HandgunWeapon
			} else {
				if ((getNumber(configFile >> "CfgWeapons" >> _itm >> "ItemInfo" >> "type")) in [101, 201, 301, 302]) then {
					4; //Aufsätze
				} else {
					if (getText(configFile >> "CfgWeapons" >> _itm >> "ItemInfo" >> "containerClass") != "") then {
						if (getNumber(configFile >> "CfgWeapons" >> _itm >> "ItemInfo" >> "type") == 801) then {
							5; //Kleidung
						} else {
							6; //Weste
						};
					} else {
						if (getNumber(configFile >> "CfgWeapons" >> _itm >> "ItemInfo" >> "type") == 605) then {
							8; //Headgear
						} else {
							if(getNumber(configFile >> "CfgWeapons" >> _itm >> "ItemInfo" >> "type") in [620, 401]) then {
								11; //ToolKit, FirstAid Kit
							}else {
								10; //NVG
							};
						};
					};
				};
			};
		};
		};
	} else {
		if (isClass(configFile >> "CfgVehicles" >> _itm)) then {
			7; //Backpack
		} else {
			if (isClass(configFile >> "CfgGlasses" >> _itm)) then {
				9; //Brille
			} else {
				if (isClass(configFile >> "CfgMagazines" >> _itm)) then {
					3; //Magazine
				};
			};
		};
	};
} else {
	-1;
};

if(_itm in ["ItemCompass", "ItemMap", "ItemGPS", "ItemRadio", "ItemWatch"]) then {
_indexLocker = 12;
};

_indexLocker;