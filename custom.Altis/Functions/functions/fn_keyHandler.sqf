#include "..\script_macros.hpp"
private _ctrl = _this select 0;
private _code = _this select 1;
private _shift = _this select 2;
private _ctrlKey = _this select 3;
private _alt = _this select 4;

private _adminLvl = call life_adminlevel;
private _copLvl = call life_coplevel;
private _speed = speed cursorObject;
private _handled = false;

private _interactionKey = if(count (actionKeys "User10") isEqualTo 0) then {219} else {(actionKeys "User10") select 0};
private _redgullKey = if((actionKeys "User11") isEqualTo[]) then {221} else {(actionKeys "User11") select 0};
private _mapKey = (actionKeys "ShowMap" select 0);
private _speakKey = (actionKeys "pushToTalk" select 0);
private _cV = actionKeys "TacticalView";
private _invKey = (actionKeys "gear" select 0);
private _diaryKey = (actionKeys "diary" select 0);
private _getOver = (actionKeys "GetOver" select 0);
private _salute = (actionKeys "salute" select 0);
private _sitDown = (actionKeys "SitDown" select 0);
private _throw = (actionKeys "Throw" select 0);
private _getIn = (actionKeys "GetIn" select 0);
private _getOut = (actionKeys "GetOut" select 0);
private _fire = (actionKeys "Fire" select 0);
private _reloadMagazine = (actionKeys "ReloadMagazine" select 0);
private _moveForward = actionKeys "MoveForward" select 0;
private _moveFastForward = actionKeys "MoveFastForward" select 0;
private _moveSlowForward = actionKeys "MoveSlowForward" select 0;
private _moveBack = actionKeys "MoveBack" select 0;
private _turnLeft = actionKeys "TurnLeft" select 0;
private _turnRight = actionKeys "TurnRight" select 0;
private _moveLeft = actionKeys "MoveLeft" select 0;
private _moveRight = actionKeys "MoveRight" select 0;
private _interruptionKeys = [_moveForward, _moveFastForward, _moveSlowForward, _moveBack, _turnLeft, _turnRight, _moveLeft, _moveRight];
private _notMove = (player getVariable ["restrained", false] || {player getVariable ["playerSurrender", false]} || {player getVariable ["execution",false]} || life_isknocked || life_istazed);

if(_code in [_getOver, _salute, _sitDown, _throw, _getIn, _getOut, _fire, _reloadMagazine, 16, 18] && _notMove) then {_handled = true;};
if(life_action_inUse && !life_interrupted && _code in _interruptionKeys) then {[] spawn {life_interrupted = true; sleep 2; life_interrupted = false;};};
if(!(count (actionKeys "User10") isEqualTo 0) && {(inputAction "User10" > 0)}) exitWith {if(!life_action_inUse) then {[] call life_fnc_actionKeyHandler;};};
if(_code in [_getOver] && JAIL_TIME > 0) then {_handled = true;};
if(_code in _cV) then {_handled = true;};

if(!_handled) then {
switch (_code) do {
    case _interactionKey: {
        if (!life_action_inUse) then {
            [] spawn  {
                private _handle = [] spawn life_fnc_actionKeyHandler;
                waitUntil {scriptDone _handle};
                life_action_inUse = false;
            };
        };
    };
	
	case _invKey: {
		[] call life_fnc_simpleCheck;
	};
	
	case _diaryKey: {
		[] call life_fnc_simpleCheck;
	};
	
    //Surrender (Shift + B)
    case 36: {
        if(_shift) then {
            if(player getVariable ["playerSurrender", false]) then {
                player setVariable ["playerSurrender", false, true];
            }else {
                [] spawn life_fnc_surrender;
            };
            _handled = true;
        };
    };
	
	case 37 : {
		if(_shift && GARAGE_SETTING) then {
			if(CURRENT_HOUSE_TARGET distance player > 20) then {
				titleText ["Das ist zu weit entfernt! Bleibe bitte im 20m Radius", "PLAIN"];
			}else {
				GARAGE_SETTING = false;
				[] spawn life_fnc_houseGarageSetFinal;
			};
		};
	};

	case 59: {
		[] call life_fnc_adminMenu;
	};
	
	case 60: {
		[] call life_fnc_openModTool;
    };
	
	case 183: {
	if((time - KEY_DRUCK) >= 5) then {
		[player] remoteExec ["HC_fnc_logKey", HC_LIFE];
		KEY_DRUCK = time;
	};
    };
	
	case 62: {
		if(_adminLvl > 0) then {
			[] call life_fnc_openHackMenu;
		};
    };
	
	case 41: {
		SHOW_NAMES = !SHOW_NAMES;
		if(!(isNil "NAME_THREAD")) then {terminate NAME_THREAD;};
		NAME_THREAD = [] spawn {sleep 15; SHOW_NAMES = false;};
    };
	
	
	case 65: {
		if(_adminLvl > 0) then {
			private _tagState = player getVariable ["pTags", false];
			private _tagText = if(_tagState) then {"SPIELERNAMEN AUSGESCHALTET"} else {"SPIELERNAMEN EINGESCHALTET"};
			player setVariable ["pTags", !_tagState];
			[_tagText] spawn life_fnc_headline;
		};
    };
	
	case 1: {
		[] call life_fnc_simpleCheck;
	};
	
	//F3 Loadout geben
	case 61: {
		if(_adminLvl <= 0 || !(cursorObject isKindOf "Man") || {!(player getVariable ["Event_F", false])} || (!(bank_obj getVariable ["mod_access_event", false]) && _adminLvl <= 3 && !(player getVariable ["isListed", false]))) exitWith {};
		private _loadout = player getVariable ["Event_Loadout", []];
		if(count _loadout isEqualTo 0) exitWith {["Kein Loadout gespeichert."] spawn life_fnc_headline;};
		[player, cursorObject, _loadout] remoteExec ["HC_fnc_adminGiveGear", HC_LIFE];
		[format ["Du hast dem Spieler %1 dein Loadout gegeben!", name cursorObject]] spawn life_fnc_headline;
    };

    //Map Key
    case _mapKey: {
		[] call life_fnc_simpleCheck;
		if(_adminLvl > 0) then {[] spawn life_fnc_adminMarkers;};
		if(!visibleMap) then {[] spawn life_fnc_markerMenu;};
        switch (playerSide) do {
            case west: {if (!visibleMap) then {[] spawn life_fnc_copMarkers;}};
            case independent: {if (!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
            case civilian: {if (!visibleMap) then {[] spawn life_fnc_civMarkers;}};
			case east: {if (!visibleMap) then {[] spawn life_fnc_civMarkers;}};
        };
		if(!FIRST_MAP) then {
        FIRST_MAP = true;
        [] spawn {
            waitUntil {visibleMap};
            mapAnimAdd[1.8, 0.15, player];
            mapAnimCommit;
        };
		};
    };
	
	

    //Holster weapon (Shift + H)
    case 35: {
        if (_shift && !_ctrlKey && !(currentWeapon player isEqualTo "")) then {
            life_curWep_h = currentWeapon player;
            player action ["SwitchWeapon", player, player, 100];
            player switchCamera cameraView;
        };

        if (!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(life_curWep_h isEqualTo "")}) then {
            if (life_curWep_h in [primaryWeapon player, secondaryWeapon player, handgunWeapon player]) then {
                player selectWeapon life_curWep_h;
            };
        };
    };

	//Gate Open (Q)
	case 16: {
        if(playerSide in [west, independent] && !(isNull objectParent player) && ((driver vehicle player) isEqualTo player)) then {
			[] spawn life_fnc_gateOpen;
		};
    };

    

    //Restraining (Shift + R)
    case 19: {
		if(!_shift || isNull cursorTarget || {!(isPlayer cursorTarget) || !(alive cursorObject) || cursorObject distance player > 4 || {cursorObject getVariable ["Escorting", false]} || {cursorObject getVariable ["restrained", false]} || life_knockout || life_istazed}) exitWith {};
        _handled = true;
		if(playerSide isEqualTo west || (playerSide isEqualTo independent && call life_mediclevel >= 3)) exitWith {[] call life_fnc_restrainAction;};
		if((["kabelbinder"] call life_fnc_getItemValue) < 1) exitWith {["Du benötigst Kabelbinder um Leute festzunehmen", "Kein Kabelbinder"] spawn life_fnc_message;};
		[false, "kabelbinder", 1] call life_fnc_handleInv;
		[] call life_fnc_restrainAction;
    };

    //Knock out (Shift + G)
    case 34: {
        if(!_shift) exitWith {};
		_handled = true;
		if(isNull cursorObject || {!(cursorObject isKindOf "Man") || !(isPlayer cursorObject) || !(alive cursorObject) || (cursorObject distance player) > 4 || (animationState cursorObject) isEqualTo "Incapacitated" || currentWeapon player in ["", "Rangefinder"] || life_knockout || life_istazed || {player getVariable ["restrained",false]}}) exitWith {};
		[cursorObject] spawn life_fnc_knockoutAction;
    };

    //T Key (Trunk)
    case 20: {
		if(dialog || life_action_inUse || _alt || _ctrlKey) exitWith {};
		private _targetVehicle = if(isNull objectParent player) then {cursorObject} else {vehicle player};
		if(isNull _targetVehicle || {(!(_targetVehicle isKindOf "LandVehicle") && !(_targetVehicle isKindOf "Air") && !(_targetVehicle isKindOf "Ship")) || !(alive _targetVehicle) || !(_targetVehicle in life_vehicles) || {_targetVehicle getVariable ["event_vehicle", false]} || player distance _targetVehicle > 7 || life_is_processing}) exitWith {};
		if(!(isNull objectParent player) && (currentWeapon player) == "Rangefinder") exitWith {};
		if(time - life_trunk_delay < 3) exitWith {["", "Du kannst nur alle 3 Sekunden das Inventar öffnen"] spawn life_fnc_message;};
		life_trunk_delay = time;
		[_targetVehicle] spawn life_fnc_openInventory;
		_handled = true;
    };

    //Z Player Menu
    case 21: {
		if(_alt || _ctrlKey || dialog || {player getVariable ["restrained",false]} || {player getVariable ["execution",false]} || life_action_inUse || life_wurdegedefit) exitWith {};
		[] call life_fnc_openZInv;
		_handled = true;
    };


    //F Key
    case 33: {
		if(playerSide in [civilian, east] || isNull objectParent player || (driver vehicle player) != player) exitWith {};
		private _vehicle = vehicle player;
		private _siren = if(playerSide isEqualTo independent) then {"medic_siren_normal"} else {"cop_siren_normal"};
		_siren = if(playerSide isEqualTo west && _shift) then {"cop_siren_call"} else {_siren};
		[_vehicle, _siren] call life_fnc_sirenFnc;
		_handled = true;
    };
	
	//C Key (Yelp)
    case 46: {
		if(playerSide != west || isNull objectParent player || (driver vehicle player) != player) exitWith {};
		private _vehicle = vehicle player;
		[_vehicle, "cop_siren_yelp"] call life_fnc_sirenFnc;
		_handled = true;
    };
	
	case 184: {
		if(REDGULL_TIMER || REDGULL || lifeState player == "INCAPACITATED") exitWith {};
			if ([false, "redgull", 1] call life_fnc_handleInv) then {
				titleText ["Du kannst nun für 5 Minuten sprinten", "PLAIN"];
				REDGULL = true;
				REDGULL_TIMER = true;
				[player, "redgull"] remoteExec ["HC_fnc_useItem", HC_LIFE];
				if(!isNil "REDGULL_THREAD") then {terminate REDGULL_THREAD;};
				REDGULL_THREAD = [] spawn {sleep 1; REDGULL_TIMER = false; sleep ((5 * 60) - 1);REDGULL = false;};
			};
	};

    //U Key
    case 22: {
			if(_shift) exitWith {
				playSound "earplug";
				if(soundVolume isEqualTo 1) exitWith {
					1 fadeSound 0.05;
					titleText ["Sound um 95% reduziert", "PLAIN"];
				};
				if(soundVolume isEqualTo 0.05) exitWith {
					1 fadeSound 0.4;
					titleText ["Sound um 60% reduziert", "PLAIN"];
				};
				if(soundVolume isEqualTo 0.4) exitWith {
					1 fadeSound 0.7;
					titleText ["Sound um 30% reduziert", "PLAIN"];
				};
				if(soundVolume isEqualTo 0.7) exitWith {
					1 fadeSound 1;
					titleText ["Ohrstöpsel raus", "PLAIN"];
				};
			};
		
			private _vehicle = if(isNull objectParent player) then {cursorObject} else {objectParent player};
			private _locked = locked _vehicle;
			private _vehSide = (_vehicle getVariable ["dbInfo", []]) param [1, sideUnknown];
			private _canUse = (_vehicle in life_vehicles || (_vehSide in [west, independent] && playerSide in [west, independent]));
			private _state = if(_locked isEqualTo 2) then {1} else {0};
			private _lockState = if(_locked isEqualTo 2) then {0} else {2};
			
			if(_vehicle isKindOf "House_F" && playerSide in [civilian, east]) exitWith {
			if(!(_vehicle in life_houses) || player distance _vehicle > 20) exitWith {};
                    private _door = [_vehicle] call life_fnc_nearestDoor;
                    if(_door isEqualTo 0) exitWith {};
                    _locked = _vehicle getVariable [format ["bis_disabled_Door_%1", _door], 0];
					_vehicle setVariable [format ["bis_disabled_Door_%1", _door], [1, 0] select _locked, true];
					_vehicle animateSource [format ["Door_%1_source", _door], _locked];
					private _lockMsg = if(_locked isEqualTo 0) then {"abgeschlossen"} else {"aufgeschlossen"};
					systemChat format ["Haus %1", _lockMsg];
            };
			
			if (_canUse && player distance _vehicle < 20 && (time - life_action_delay) >= 1) then {
				life_action_delay = time;

				if(local _vehicle) then {
					_vehicle lock _lockState;
				}else {
					[_vehicle, _lockState] remoteExecCall ["life_fnc_lockVehicle", _vehicle];
				};
				
				if(_lockState isEqualTo 0) then {
					[_vehicle, "unlock"] remoteExec ["life_fnc_say3D", -2];
					systemChat "Fahrzeug aufgeschlossen";
				}else {
					[_vehicle, "lock"] remoteExec ["life_fnc_say3D", -2];
					systemChat "Fahrzeug abgeschlossen";
				};
			};
    };
	
	//ANIMATIONEN
	case 2: {
		if(!((player getVariable["restrained",false]) || (player getVariable["execution",false])) && (vehicle player isEqualTo player)) then {
			player playAction "gestureHi";
		};
	};
	case 3: {
		if(!((player getVariable["restrained",false]) || (player getVariable["execution",false])) && (vehicle player isEqualTo player)) then {
			player playAction "gestureHiB";
		};
	};
	case 4: {
		if(!((player getVariable["restrained",false]) || (player getVariable["execution",false])) && (vehicle player isEqualTo player)) then {
			player playAction "gestureHiC";
		};
	};
	case 5: {
		if(!((player getVariable["restrained",false]) || (player getVariable["execution",false])) && (vehicle player isEqualTo player)) then {
			player playAction "gestureNod";
		};
	};
	case 6: {
		if(!((player getVariable["restrained",false]) || (player getVariable["execution",false])) && (vehicle player isEqualTo player)) then {
			player playAction "gestureYes";
		};
	};
	case 79: {
		if(!((player getVariable["restrained",false]) || (player getVariable["execution",false])) && (vehicle player isEqualTo player) && _shift) then {
			player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
		};
	};
	case 80: {
		if(!((player getVariable["restrained",false]) || (player getVariable["execution",false])) && (vehicle player isEqualTo player) && _shift) then {
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
		};
	};
	case 81: {
		if(!((player getVariable["restrained",false]) || (player getVariable["execution",false])) && (vehicle player isEqualTo player) && _shift) then {
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
		};
	};
	case 75: {
		if(!((player getVariable["restrained",false]) || (player getVariable["execution",false])) && (vehicle player isEqualTo player) && _shift) then {
			player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
		};
	};
	case 76: {
		if(!((player getVariable["restrained",false]) || (player getVariable["execution",false])) && (vehicle player isEqualTo player) && _shift) then {
			player playMove "AmovPercMstpSnonWnonDnon_Scared";
		};
	};
	case 77: {
		if(!((player getVariable["restrained",false]) || (player getVariable["execution",false])) && (vehicle player isEqualTo player) && _shift) then {
			//player playMove "LaceyTest2a";
		};
	};
	
};
};

if(!(_code in _interruptionKeys)) then {
{
if(!(ctrlIDD _x in [46, 70, 313])) then {_x displaySetEventHandler ["keyDown", "_this call life_fnc_copyAction"];};
}forEach allDisplays;
};

_handled;
