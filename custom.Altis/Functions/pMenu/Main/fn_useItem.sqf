#include "..\..\script_macros.hpp"
disableSerialization;
private _curSel = lbCurSel 4351;

if(_curSel isEqualTo -1) exitWith {["Du musst ein Item auswählen bevor du 'Benutzen' drückst.", "Z Inv"] spawn life_fnc_message;};
private _item = lbData [4351, _curSel];
private _removeItem = false;
private _foodList = ["apple", "bananen", "pfirisch", "donuts", "steak", "bacon"];
private _drinkList = ["waterBottle", "coffee"];
private _drugsList = ["kokainP", "heroinP", "marihuanaP", "medmarihuana"];
private _alcoholList = ["wodka", "bier", "traubenP"];

switch (true) do {
    case(_item in _drinkList): {
        if(!([false, _item, 1] call life_fnc_handleInv)) exitWith {};
			_removeItem = true;
			private _walkSkill = ["stamina"] call life_fnc_getSkillAdvantage;
			if(WALK_CURRENT >= _walkSkill) then {WALK_CURRENT = 0;};
			private _food = getNumber (missionConfigFile >> "Items" >> _item >> "edible");
            private _newFood = life_thirst + _food;
			if(_newFood > 100) then {_newFood = 100};
            life_thirst = _newFood;
    };
	
	case (_item in _foodList): {
            if(!([false, _item, 1] call life_fnc_handleInv)) exitWith {};
				_removeItem = true;
                private _food = getNumber (missionConfigFile >> "Items" >> _item >> "edible");
				private _newFood = life_hunger + _food;
                switch (true) do {
                    case (_newFood <= 0): {life_hunger = 5;};
                    case (_newFood > 100): {life_hunger = 100;};
                    default {life_hunger = _newFood;};
                };
    };
	
	case (_item in _drugsList): {
		if(player getVariable ["drogen", false]) exitWith {};
		if(!([false, _item, 1] call life_fnc_handleInv)) exitWith {};
			[] spawn life_fnc_useDrugs;
			_removeItem = true;
	};
	
	case (_item in _alcoholList): {
		if(player getVariable ["alkohol", false]) exitWith {};
		if(!([false, _item, 1] call life_fnc_handleInv)) exitWith {};
			private _promille = if(_item == "wodka") then {3} else {1};
			[] spawn life_fnc_useAlcohol;
			[_promille] spawn life_fnc_promille;
			_removeItem = true;
	};
	
	case (_item isEqualTo "redgull") : {
		if(REDGULL_TIMER || REDGULL) exitWith {};
		if(!([false, _item, 1] call life_fnc_handleInv)) exitWith {};
			titleText ["Du kannst nun für 5 Minuten sprinten", "PLAIN"];
			REDGULL = true;
			REDGULL_TIMER = true;
			_removeItem = true;
			if(!isNil "REDGULL_THREAD") then {terminate REDGULL_THREAD;};
			REDGULL_THREAD = [] spawn {sleep 1; REDGULL_TIMER = false; sleep ((5 * 60) - 1);REDGULL = false;};
	};
	
    case (_item isEqualTo "boltcutter"): {
		if(!(cursorObject in [zenti_part_2, zenti_part_3])) exitWith {};
			[cursorObject] spawn life_fnc_zentiBolt;
			closeDialog 0;
    };
	
	case (_item isEqualTo "schloss"): {
		if(typeOf cursorObject != "Land_BackAlley_01_l_gate_F") exitWith {["Du kannst dieses Schloss nur dafür benutzen um Zellentüren abzuschliesen.", "Z Inv"] spawn life_fnc_message;};
        if(playerSide != west) exitWith {["Nur Polizisten können Zellentüren wieder abschliesen.", "Z Inv"] spawn life_fnc_message;};
        if(!([false, _item, 1] call life_fnc_handleInv)) exitWith {};
		closeDialog 0;
		[player, _item, [cursorObject]] remoteExec ["HC_fnc_useItem", HC_LIFE];
		["Du hast die Zellentür wieder abgeschlossen. Zivilisten können sie nun nicht mehr öffnen!", "Z Inv"] spawn life_fnc_message;
    };

    case (_item isEqualTo "blastingcharge"): {
		if(!(cursorObject isEqualTo zenti)) exitWith {};
			[] spawn life_fnc_zentiCharge;
			closeDialog 0;
    };

    case (_item isEqualTo "defusekit"): {
		closeDialog 0;
        [cursorObject] spawn life_fnc_defuseKit;
    };
	
	case (_item isEqualTo "medikit") : {
		closeDialog 0;
		[] spawn life_fnc_mediKit;
	};
	
	case (_item isEqualTo "firstaidkit") : {
		closeDialog 0;
		[] spawn life_fnc_healAction;
	};
	
	case (_item == "defibrilator"): {
		if(!(cursorObject isKindOf "Man") || alive cursorObject) exitWith {};
			[cursorObject] spawn life_fnc_defi;
    };
	
	case (_item isEqualTo "card"): {
        {_x setVariable ["bis_disabled_Door_1", 0];}foreach [zelle_1, zelle_2, zelle_3, zelle_4, zelle_5, schranke_1, schranke_2, schranke_3, schranke_4, schranke_5, schranke_6, schranke_7, schranke_8];
		if(!([false, _item, 1] call life_fnc_handleInv)) exitWith {};
		_removeItem = true;
		["Du hast nun Zugriff auf alle Schranken und Zellen!", false, "slow"] call life_fnc_showNotification;
		["Diese Keykarte gibt dir Zugriff über alle Zellentüren und Schranken in den Polizei HQ's.", "Z Inv"] spawn life_fnc_message;
    };
	
    case (_item isEqualTo "spikeStrip"): {
        if(player getVariable ["nagelbander", false]) exitWith {}; 
        if(!([false, _item, 1] call life_fnc_handleInv)) exitWith {};
            [] spawn life_fnc_spikeStrip;
			_removeItem = true;
            closeDialog 0;
    };

    case (_item isEqualTo "fuelFull"): {
        if(!isNull objectParent player) exitWith {};
			[] spawn life_fnc_jerryRefuel;
			closeDialog 0;
    };

    case (_item isEqualTo "fuelEmpty"): {
		if(!isNull objectParent player) exitWith {};
			[] spawn life_fnc_jerrycanRefuel;
			closeDialog 0;
    };

    case (_item isEqualTo "lockpick"): {
		if(!isNull objectParent player) exitWith {};
			[] spawn life_fnc_lockpick;
			closeDialog 0;
    };

    default {["Dieses Item ist nicht benutzbar. Du kannst im Handbuch nachschauen welche Items man benutzen kann!", "Nicht benutzbar"] spawn life_fnc_message;};
};

if(_removeItem) then {[player, _item] remoteExec ["HC_fnc_useItem", HC_LIFE];};

[] call life_fnc_openZInv;
[] call life_fnc_hudUpdate;