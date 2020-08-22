disableSerialization;
if(isNull findDisplay 1250) then {createDialog "Markt";};
private _display = findDisplay 1250;
private _itemList = _display displayCtrl 1251;
private _editMarktEvent = _display displayCtrl 1256;
private _editMarktEventProzent = _display displayCtrl 1257;
private _editTime = _display displayCtrl 1262;
private _btnSet = _display displayCtrl 1259;
private _btnTrigger = _display displayCtrl 1260;
private _btnEnd = _display displayCtrl 1261;

lbClear _itemList;

private _eventMessage = if((bank_obj getVariable ["MarktEventMessage", ""]) != "") then {bank_obj getVariable ["MarktEventMessage", ""]} else {"Aktuell ist alles ruhig am Markt ..."};
private _eventPercentage = bank_obj getVariable ["MarktEventPercentage", 1];
private _eventTime = bank_obj getVariable ["MarktEventTime", time];
_eventTime = [(_eventTime - time),"HH:MM"] call BIS_fnc_secondsToString;

_editMarktEvent ctrlSetText _eventMessage;
_editMarktEventProzent ctrlSetText format ["+ %1%2", (_eventPercentage * 100) - 100, "%"];
_editTime ctrlSetText format ["%1 Stunden", _eventTime];

private _configLegal = "getText (_x >> 'type') == 'MARKT' && (getNumber (_x >> 'illegal')) isEqualTo 0" configClasses (missionConfigFile >> "Items");
private _configNotLegal = "getText (_x >> 'type') == 'MARKT' && (getNumber (_x >> 'illegal')) isEqualTo 1" configClasses (missionConfigFile >> "Items");

{
private _name = getText (_x >> "name");
private _price = [configName _x, "sellPrice"] call life_fnc_getItemPrice;

_itemList lbAdd format ["%1 (€%2)", _name, [_price] call life_fnc_numberText];
_itemList lbSetData [(lbSize _itemList)-1, configName _x];
}forEach _configLegal;

{
private _name = getText (_x >> "name");
private _price = [configName _x, "sellPrice"] call life_fnc_getItemPrice;

_itemList lbAdd format ["%1 (€%2)", _name, [_price] call life_fnc_numberText];
_itemList lbSetData [(lbSize _itemList)-1, configName _x];
_itemList lbSetColor [(lbSize _itemList)-1, [1, 0.1, 0.1, 1]];
}forEach _configNotLegal;

_itemList lbSetCurSel 0;
_btnTrigger ctrlShow (call life_adminlevel >= 5);
_btnEnd ctrlShow (call life_adminlevel >= 5);
_btnSet ctrlShow (call life_adminlevel >= 5);