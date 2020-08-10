disableSerialization;
private _index = lbCurSel 170002;
if(_index isEqualTo -1) exitWith {};

private _item = lbData [170002, _index];
private _type = lbValue [170002, _index];
private _amount = parseNumber (ctrlText 170003);

if(_amount <= 0) exitWith {};

[player, _item, _amount, _type] remoteExec ["HC_fnc_dropItemMod", HC_LIFE];