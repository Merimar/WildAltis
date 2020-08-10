disableSerialization;
private _display = findDisplay 1150;
private _index = lbCurSel 1151;
private _item = lbData [1151, _index];

private _farmToolEdit = _display displayCtrl 1153;
private _distanceEdit = _display displayCtrl 1154;
private _farmSkillEdit = _display displayCtrl 1155;
private _processSkillEdit = _display displayCtrl 1156;
private _infosEdit = _display displayCtrl 1157;
private _ausEdit = _display displayCtrl 1158;
private _wirdEdit = _display displayCtrl 1159;

if(_index isEqualTo -1 || _item == "") exitWith {};

private _fields = getArray (missionConfigFile >> "CfgFarmRoutes" >> _item >> "fields");
private _processors = getArray (missionConfigFile >> "CfgFarmRoutes" >> _item >> "processors");
private _vendors = getArray (missionConfigFile >> "CfgFarmRoutes" >> _item >> "vendors");
private _gatherItem = getText (missionConfigFile >> "CfgFarmRoutes" >> _item >> "gatherItem");
private _gatherTool = getText (missionConfigFile >> "CfgFarmRoutes" >> _item >> "gatherTool");
private _extraInfos = if((getText (missionConfigFile >> "CfgFarmRoutes" >> _item >> "infoText")) != "") then {getText (missionConfigFile >> "CfgFarmRoutes" >> _item >> "infoText")} else {"Zu dieser Route gibt es keine extra Informationen"};
private _gatherSkill = getText (missionConfigFile >> "CfgFarmRoutes" >> _item >> "gatherSkill");
private _processSkill = getText (missionConfigFile >> "CfgFarmRoutes" >> _item >> "processSkill");
private _input = getArray (missionConfigFile >> "CfgFarmRoutes" >> _item >> "processInput");
private _output = getArray (missionConfigFile >> "CfgFarmRoutes" >> _item >> "processOutput");

private _gatherToolName = if(_gatherTool != "") then {getText (missionConfigFile >> "Items" >> _gatherTool >> "name")} else {localize "STR_Farm4"};
private _skillFarm = [_gatherSkill] call life_fnc_getSkillLevel;
private _skillProcess = [_processSkill] call life_fnc_getSkillLevel;
private _aus = [];
private _wird = [];

{
private _items = _x select 0;
private _list = _x select 1;

{_list pushBack format ["%1 %2", _x select 1, getText (missionConfigFile >> "Items" >> _x select 0 >> "name")];}forEach _items;
}forEach [[_input, _aus], [_output, _wird]];

private _distance = 100000;

{
private _curField = markerPos _x;
{
private _curProc = markerPos _x;
{
private _curVendor = markerPos _x;
private _dist1 = _curField distance _curProc;
private _dist2 = _curProc distance _curVendor;
private _finalDistance = _dist1 + _dist2;
if(_finalDistance < _distance) then {_distance = _finalDistance;};
}forEach _vendors;
}forEach _processors;
}forEach _fields;

_farmToolEdit ctrlSetText _gatherToolName;
_distanceEdit ctrlSetText format ["%1 km lang", [_distance] call life_fnc_numberText];
_farmSkillEdit ctrlSetText str _skillFarm;
_processSkillEdit ctrlSetText str _skillProcess;
_infosEdit ctrlSetText _extraInfos;
_ausEdit ctrlSetText (_aus joinString ", ");
_wirdEdit ctrlSetText (_wird joinString ", ");

if(count _input isEqualTo 0) then {_ausEdit ctrlSetText "";};
if(count _output isEqualTo 0) then {_wirdEdit ctrlSetText "Geld";};