disableSerialization;

if(isNull findDisplay 1550) exitWith {};

private _display = findDisplay 1550;
private _rewardList = _display displayCtrl 1551;
private _activateBtn = _display displayCtrl 1552;

private _index = lbCurSel _rewardList;
if(_index isEqualTo -1) exitWith {};

_activateBtn ctrlEnable false;

private _rewardClass = _rewardList lbData _index;
private _rewardType = getText (missionConfigFile >> "CfgRewards" >> _rewardClass >> "type");

switch (_rewardType) do {
	case "VEHICLE_ABO": { 
		[player, 0, VEHICLE_SPAWNPOINT, _rewardClass] remoteExec ["HC_fnc_spawnVehicle", HC_Life];
	};
	case "ITEM_ABO": {
		[player, LIFE_INTERACTION_OBJECT, _rewardClass] remoteExec ["HC_fnc_activateItemAbo", HC_Life];
	};
	default { };
};

closeDialog 0;