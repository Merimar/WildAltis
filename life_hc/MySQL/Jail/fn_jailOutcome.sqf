private _unit = param [0, objNull, [objNull]];
private _outcome = param [1, "NORMAL", [""]];

private _isHacker = [[_outcome], _unit, remoteExecutedOwner, "fn_jailOutcome"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _sideID = [side _unit] call HC_fnc_getSideID;

private _vehicleName = if(isNull objectParent _unit) then {"Kein Fahrzeug"} else {getText (configFile >> "CfgVehicles" >> typeOf objectParent _unit >> "displayName")};
private _nearPlayers = _unit nearEntities ["Man", 20];
private _friends = [];
{_friends pushback (format ["%1 (%2 - %3)", name _x, getPlayerUID _x, side _x]);}forEach _nearPlayers;
private _friends = if(count _nearPlayers isEqualTo 0) then {"NIEMAND"} else {_friends joinString ", "};

switch (_outcome) do {
	case "DEAD" : {};
	
	case "STONE" : {
		_unit setPos (markerPos "jail_marker_yard");
		private _msg = format ["Der Spieler %1 (%2 - %3) hat genügend Steine gesammelt um auf den Hof zu kommen", name _unit, getPlayerUID _unit, side _unit];
		["JailLog", _msg] call HC_fnc_Log;
	};
	
	case "FLEE" : {
		[_unit, "FLEE_PRISON"] call HC_fnc_fahndungHandle;
		[getPlayerUID _unit, side _unit, 0] call HC_fnc_handleArrested;
		private _query = format ["UPDATE player_jail SET deleted_at = now() WHERE prisoner_id = '%1' AND side_id = '%2'", getPlayerUID _unit, _sideID];
		[_query, 1] call HC_fnc_asyncCall;
		private _msg = format ["Der Spieler %1 (%2 - %3) ist aus dem Gefängnis ausgebrochen (FAHRZEUG: %4 FREUNDE: %5)", name _unit, getPlayerUID _unit, side _unit, _vehicleName, _friends];
		["JailLog", _msg] call HC_fnc_Log;
		[0, format ["%1 ist aus dem Gefängnis ausgebrochen", name _unit]] remoteExec ["life_fnc_broadcast", -2];
	};
	
	case "NORMAL" : {
		[getPlayerUID _unit, "rebel", false] call HC_fnc_handleLicenses;
		[getPlayerUID _unit, 0] call HC_fnc_handleArrested;
		private _query = format ["UPDATE player_jail SET deleted_at = now() WHERE prisoner_id = '%1' AND side_id = '%2'", getPlayerUID _unit, _sideID];
		[_query, 1] call HC_fnc_asyncCall;
		private _msg = format ["Der Spieler %1 (%2 - %3) hat seine Zeit im Gefängnis abgesessen", name _unit, getPlayerUID _unit, side _unit];
		["JailLog", _msg] call HC_fnc_Log;
		private _housePositions = nearestObjects [markerPos "Spawn_Kavala", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F","Land_House_Small_01_F"], 500];
		private _house = selectRandom _housePositions;
		private _bPos = [_house] call life_fnc_getBuildingPositions;
		{_bPos = _bPos - [(_house buildingPos _x)];}forEach (_house getVariable ["slots",[]]);
		_unit setPosATL (selectRandom _bPos);
	};
};

