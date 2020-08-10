disableSerialization;
private _display = findDisplay 1000;
private _listUnits = _display displayCtrl 1001;
private _message = ctrlText 1004;
private _comboSelection = _display displayCtrl 1005;
private _checkbox = cbChecked (_display displayCtrl 1007);
private _index = lbCurSel _listUnits;
private _selection = lbCurSel _comboSelection;

if(_selection isEqualTo -1) exitWith {};
private _messageType = _comboSelection lbValue _selection;
private _unitData = _listUnits lbData _index;
private _allowed = toArray ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 0123456789ÄäÖöÜüß!#€()[]*+,-./<=>?@:&§^');
private _msgArray = toArray (_message);

if(_messageType != 7 && count _message < 3) exitWith {["", "Die Nachricht muss mind. 3 Zeichen lang sein"] spawn life_fnc_message;};
if(_messageType isEqualTo 7 && ((group player) getVariable ["gang_name", ""]) == "") exitWith {["Du musst in einer Gang sein!"] spawn life_fnc_message;};

private _target = objNull;
private _targetName = "";
private _exit = false;

{if(!(_x in _allowed)) exitwith {_exit = true;};}forEach _msgArray;
if(_exit) exitWith {["", "In deiner Nachricht befinden sich nicht erlaubte Zeichen"] spawn life_fnc_message;};
if((time - life_action_delay) < 15) exitWith {["", "Warte 15 Sekunden bis du eine neue Nachricht schreibst"] spawn life_fnc_message;};
life_action_delay = time;

switch (_messageType) do {

	//Nachricht an Spieler
	case 0 : {
		if(_index isEqualTo -1) exitWith {_exit = true;};
		private _unit = call compile format ["%1", _unitData];
		if(isNull _unit) exitWith {_exit = true;};
		_target = _unit;
		_targetName = name _unit;
	};
	
	//Nachricht an Polizei
	case 1 : {
		_target = west;
		_targetName = "die Polizei";
	};
	
	//Nachricht an Feuerwehr
	case 2 : {
		_target = independent;
		_targetName = "die Feuerwehr";
	};
	
	//Nachricht an Gang
	case 3 : {
		if(_index isEqualTo -1) exitWith {_exit = true;};
		private _unit = call compile format ["%1", _unitData];
		if(isNull _unit) exitWith {_exit = true;};
		_target = units (group _unit);
		_targetName = (group _unit) getVariable ["gang_name", name _unit];
	};
	
	//Nachricht an Admins
	case 4 : {
		_target = [] call life_fnc_getAdmins;
		_targetName = "die Admins";
	};
	
	//Polizeinachricht an Alle
	case 5 : {
		_target = -2;
		_targetName = "alle Spieler";
	};
	
	//Feuerwehrnachricht an Alle
	case 6 : {
		_target = -2;
		_targetName = "alle Spieler";
	};
	
	//GE Ankündigung
	case 7 : {
		_target = -2;
		_targetName = "alle Spieler";
	};
	
	//Admin an Alle
	case 8 : {
		_target = -2;
		_targetName = "alle Spieler";
	};
	
	//Admin an Spieler
	case 9 : {
		_target = -2;
		_targetName = "den Spieler";
	};


};

private _position = if(_checkbox) then {mapGridPosition player} else {"Unbekannt"};

if(_exit) exitWith {};
if(_messageType != 7) then {[_message, format ["Du hast %1 eine Nachricht gesendet", _targetName]] spawn life_fnc_message;};
if(_messageType isEqualTo 1) then {[_message, west, _position] call life_fnc_newEmergency;};
if(_messageType isEqualTo 2) then {[_message, independent, _position] call life_fnc_newEmergency;};

closeDialog 0;
[player, _messageType, _message, _checkbox, _target, _targetName] remoteExecCall ["HC_fnc_sendMessage", HC_LIFE];