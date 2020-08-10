if(isNull findDisplay 1150) then {createDialog "Farm";};

private _display = findDisplay 1150;
private _itemList = _display displayCtrl 1151;
lbClear _itemList;

private _config = "true" configClasses (missionConfigFile >> "CfgFarmRoutes");

{
if((configName _x) != "Stone") then {
private _name = getText (_x >> "name");
private _isLegal = (getNumber (missionConfigFile >> "Items" >> getText (_x >> "gatherItem") >> "illegal")) isEqualTo 0;
if(!_isLegal) then {_name = format ["%1 (Illegal)", _name];};
_itemList lbAdd _name;
_itemList lbSetData [(lbSize _itemList)-1, configName _x];
};
}forEach _config;

_itemList lbSetCurSel 0;
CUR_MARKER_ROUTE = 0;