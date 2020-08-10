createDialog "Garage";  
disableSerialization;

private _display = findDisplay 2800;
private _list = _display displayCtrl 2801;
private _buyBtn = _display displayCtrl 2803;
private _sellBtn = _display displayCtrl 2804;
private _updateBtn = _display displayCtrl 2805;
private _header = _display displayCtrl 2806;

_header ctrlSetText "Versicherungskaufmann";
_buyBtn ctrlSetText "Kaufen";
_buyBtn buttonSetAction "[] spawn life_fnc_insuranceBuy";
_updateBtn buttonSetAction "[] call life_fnc_insuranceUpdate";
_list ctrlSetEventHandler ["LBSelChanged", "[] call life_fnc_insuranceLBChange"];
_sellBtn ctrlShow false;