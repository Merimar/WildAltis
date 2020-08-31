disableSerialization;

private _vehType = _this select 0;
private _spawnPoint = _this select 1;

VEHICLE_SPAWNPOINT = _spawnPoint;
VEHICLE_TYPE = _vehType;

if(isNull findDisplay 1550) then {createDialog "Rewardbox";};

private _display = findDisplay 1550;
private _rewardList = _display displayCtrl 1551;
private _activateBtn = _display displayCtrl 1552;

private _allRewards = "true" configClasses (missionConfigFile >> "CfgRewards");

private _activeRewards = [];

{
	_type = getText (_x >> "type");
	_block = true;
	{
		if((_x select 0) == _type) exitWith {_block = false;};
	} forEach _activeRewards;
	if(_block && _type in ["VEHICLE_ABO", "VIRT_ABO", "ITEM_ABO", "PAYCHECK", "SKILL", "PREMIUM"]) then {
		_activeRewards pushBack [_type, []];
	};
} forEach _allRewards;

{
	private _rewardClass = configName _x;
	private _rewardType = getText (_x >> "type");

	private _hasRedeemed = ({_x select 0 == _rewardClass && _x select 1} count DAILY_REWARD_LIST) isEqualTo 1;

	if(_hasRedeemed) then {
		{
			if((_x select 0) == _rewardType) then {
				_array = [_rewardType, (_x select 1) + [_rewardClass]];
				_activeRewards set [_forEachIndex, _array];
			};
		} forEach _activeRewards;
	};
} forEach _allRewards;

{
	_rewardtype = _x select 0;
	_rewardarray = _x select 1;
		if((count _rewardarray) > 0) then {
		_rewardtypename = switch (_rewardtype) do {
			case "VEHICLE_ABO" : {"Fahrzeuge"};
			case "VIRT_ABO" : {"Virtuelle Items"};
			case "ITEM_ABO" : {"Items"};
			case "PAYCHECK" : {"Paycheck"};
			case "SKILL" : {"Skills"};
			case "PREMIUM" : {"Premium"};
		};
		_index = _rewardList lbAdd format ["--------%1--------", _rewardtypename];
		_rewardList lbSetData [_index, ""];

		{
			_rewardclass = _x;
			_rewardtext = switch (_rewardtype) do {
				case "VEHICLE_ABO" : {
					_status = "NICHT AUSGEPARKT";
					{
						if(((_x getVariable ["dbInfo", ["", sideUnknown, -1, ""]]) select 3) == _rewardclass) exitWith {
							_status = "AUSGEPARKT";
						};
					} forEach life_vehicles;
					format["%1 [%2]", getText (configFile >> "CfgVehicles" >> ((getArray (missionConfigFile >> "CfgRewards" >> _rewardclass >> "value")) select 0) >> "displayName"), _status]
				};
				case "VIRT_ABO" : {_arr = getArray (missionConfigFile >> "CfgRewards" >> _rewardclass >> "value"); format["%1x %2", _arr select 1, getText (configFile >> "Items" >> (_arr select 0) >> "name")]};
				case "ITEM_ABO" : {_arr = getArray (missionConfigFile >> "CfgRewards" >> _rewardclass >> "value"); format["%1x %2", _arr select 1, getText (configFile >> "CfgWeapons" >> (_arr select 0) >> "displayName")]};
				case "PAYCHECK" : {format["+%1€", getArray (missionConfigFile >> "CfgRewards" >> _rewardclass >> "value") select 0]};
				case "SKILL" : {_arr = getArray (missionConfigFile >> "CfgRewards" >> _rewardclass >> "value"); format["%1 +%2 Punkte", localize ("STR_Skill_" + (_arr select 0)), _arr select 1]};
				case "PREMIUM" : {format["Premium Level %1", getArray (missionConfigFile >> "CfgRewards" >> _rewardclass >> "value") select 0]};
			};
			_index = _rewardList lbAdd _rewardtext;
			switch (_rewardtype) do {
				case "VEHICLE_ABO": { _rewardList lbSetData [_index, _rewardclass]; };
				default { _rewardList lbSetData [_index, ""]; };
			};
		} forEach _rewardarray;
	};
} forEach _activeRewards;