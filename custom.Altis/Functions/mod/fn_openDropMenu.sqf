disableSerialization;
private _type = param [0, 1];

if(isNull findDisplay 170000) then {createDialog "life_eventdrop_menu";};

private _display = findDisplay 170000;
private _itemList = _display displayCtrl 170002;
lbClear _itemList;

private _configType = switch (_type) do {case 1 : {"waffen"};case 2 : {"kleidung"};case 3 : {"items"};};
private _config = getArray (missionConfigFile >> "ModWeapon" >> _configType);

{
private _item = _x param [0, ""];
if(_item != "") then {
	private _itemInfo = [_item] call life_fnc_fetchCfgDetails;
	if(count _itemInfo > 2) then {
		_itemList lbAdd (_itemInfo select 1);
		_itemList lbSetData[(lbSize _itemList)-1, _item];
		_itemList lbSetPicture[(lbSize _itemList)-1, _itemInfo select 2];
		_itemList lbSetValue[(lbSize _itemList)-1, _x select 1];
	};
};
}forEach (_config);