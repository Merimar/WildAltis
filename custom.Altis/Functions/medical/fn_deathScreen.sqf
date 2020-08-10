disableSerialization;
private _canAdrenalin = param [0, false, [false]];

private _display = findDisplay 7300;
private _informationText = _display displayCtrl 7301;
private _RespawnBtn = _display displayCtrl 7303;
private _adrenalinBtn = _display displayCtrl 7304;
_adrenalinBtn ctrlEnable _canAdrenalin;
private _bloodTime = time;

waitUntil {!(isNil "life_corpse")};

waitUntil {
	private _numberMedics = {(side _x) isEqualTo independent && alive _x && _x != player} count playableUnits;
	private _nearestMedic = objNull;
	
	_display displaySetEventHandler ["keyDown", "_this call life_fnc_displayHandler"];
	
	{
	if(side _x isEqualTo independent && _x != player && alive _x) then {
	if(!isNull _nearestMedic) then {
	if(_x distance life_corpse < _nearestMedic distance life_corpse) then {_nearestMedic = _x;};
	}else {_nearestMedic = _x;};
	};
	}forEach (playableUnits - [player]);
	
	private _notruf = player getVariable ["notruf_medic", ""];
	private _auftrag = if(_notruf == "") then {"Nein"} else {_notruf};
	_nearestMedic = if(isNull _nearestMedic) then {"Kein Medic online"} else {format["%1 (%2m)",name _nearestMedic, round (_nearestMedic distance life_corpse)]};
	
	_normalText = format ["<t color='#D1D1D1'>%1</t><br/><br/><t color='#3498DB'>Medics online: %2</t><br/><br/><t color='#3498DB'>%3: %4</t><br/><br/><t color='#3498DB'>Auftrag angenommen: %5</t><br/><br/><t color='#3498DB'>Du bist tot seit: %6</t>", localize "STR_MedicText", _numberMedics, localize "STR_Medic2Text", _nearestMedic, _auftrag, [(time - _bloodTime),"MM:SS"] call BIS_fnc_secondsToString];
	_informationText ctrlSetStructuredText parseText _normalText;
    sleep 1;
    (isNull (findDisplay 7300))
};