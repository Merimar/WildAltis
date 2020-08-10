disableSerialization;
private _display = findDisplay (_this select 0);
private _list = _display displayCtrl (_this select 1);
private _search = toLower (ctrlText (_this select 2));
private _otherClass = param [3, ""];
lbClear _list;

private _red = [0.81, 0.34, 0.41, 1];
private _blau = [0, 0.3, 1, 1];
private _pink = [0.3, 0.3, 0.5, 1];
private _gruen = [0, 0.3, 0, 1];
private _orange = [0.73, 0.24, 0.11, 1];

switch (_otherClass) do {

	case "" : {
		private _units = playableUnits select {_x != player && _search in (toLower (name _x))};

		{
			_list lbAdd (name _x);
			_list lbSetData [(lbSize _list)-1, str(_x)];
		}forEach _units;

		if(count _units isEqualTo 0) then {
			_list lbAdd "Keine Spieler gefunden";
			_list lbSetData [(lbSize _list)-1, "-1"];
		};
	};
	
	case "Admin" : {
		private _units = playableUnits select {_search in (toLower (name _x))};

		{
		private _color = switch (side _x) do { case (!(isNull objectParent _x)) : {_orange}; case civilian : {_pink}; case east : {_red}; case west : {_blau}; case independent : {_gruen};};
		private _picture = getText (configFile >> "CfgWeapons" >> (if((primaryWeapon _x) != "") then {primaryWeapon _x} else {uniform _x}) >> "Picture");

		_list lbAdd (name _x);
		_list lbSetData [(lbSize _list)-1, str _x];
		_list lbSetColor [(lbSize _list)-1, _color];
		_list lbSetPicture [(lbSize _list)-1, _picture];
		}forEach _units;
	};
	
	case "Notruf" : {
		private _informationArray = bank_obj getVariable ["Emergency_Calls", []];
		
		{
		private _playerName = _x select 0;
		private _messages = _x select 1;
		private _time = _x select 2;
		private _position = _x select 3;
		private _accepted = _x select 4;
		private _finished = _x select 5;
		private _faction = _x select 6;
		
		if(_faction isEqualTo playerSide && !_finished && _search in (toLower _playerName)) then {
			_list lbAdd _playerName;
			_list lbSetValue [(lbSize _list)-1, _forEachIndex];
		};
		}forEach _informationArray;	
	};
};