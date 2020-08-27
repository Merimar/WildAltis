#include "..\script_macros.hpp"

if(visibleMap || {!alive player} || {dialog}) exitWith {500 cutText ["","PLAIN"];};

private _ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];

if(isNull _ui) then {
    500 cutRsc["Life_HUD_nameTags","PLAIN"];
    _ui = uiNamespace getVariable ["Life_HUD_nameTags", displayNull];
};

private _units = (nearestObjects [(visiblePosition player), ["Man"], 20]) select {_x != player};

{
	private _text = "";
    private _idc = _ui displayCtrl (78000 + _forEachIndex);
	
    if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && alive _x && isPlayer _x) then {
        _pos = [visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5];
        _sPos = worldToScreen _pos;
        _distance = _pos distance player;
		private _isPremium = _x getVariable ["player_premium", false];

            if (count _sPos > 1 && {_distance < 15}) then {
				_name = name _x;
				_text = "kAusweis";
				
				if((side _x) in [civilian, east]) then {
					_text = if(_x in (units group player)) then {format["<t color='#00FF00'>%1</t>", _name]} else {_name};
					if(_isPremium) then {_text = format ["%1 <img image='Images\Dialog\Diamond.paa' size='1'></img>", _text];};
					
					private _groupName = (group _x) getVariable ["gang_name", "-1"];
					private _neuling = (_x getVariable ["player_playtime", 0]) < 600;
					
					if(_neuling) then {_text = format ["<t color = '#DAF7A6'>Neuling</t><br/>%1", _text];};
					if(_groupName != "-1") then {_text = format ["%1<br/><t size='0.9' color='#B6B6B6'>%2</t>", _text, _groupName];};	
				};
				
				if((side _x) isEqualTo west) then {
					private _levelInfo = _x getVariable ["police_rank", ["-1", "-1"]];
					private _rank = _levelInfo select 0;
					private _icon = _levelInfo select 1;
					private _streife = _x getVariable ["squad", "-1"];
					
					if(_streife in ["ZIV 1", "ZIV 2"]) then {
						_text = _name;
					}else {
						_text = if(_isPremium) then {format ["<img image='%1' size='1'></img> <t size='1.2' color='#0054A4'>%2<br/></t>%3 <img image='Images\Dialog\Diamond.paa' size='1'></img>", _icon, _rank, _name]} else {format ["<img image='%1' size='1'></img> <t size='1.2' color='#0054A4'>%2<br/></t>%3", _icon, _rank, _name]};
					};
				};
				
				if((side _x) isEqualTo independent) then {
					private _rank = _x getVariable ["medic_rank", "-1"];
					_text = if(_isPremium) then {format ["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t><t size='0.8' color='#EDF5F5'>%1</t><br/>%2 <img image='Images\Dialog\Diamond.paa' size='1'></img>", _rank, _name]} else {format ["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t><t size='0.8' color='#EDF5F5'>%1</t><br/>%2", _rank, _name]};
					
				};
				
				if(_x getVariable ["event_join", false]) then {_text = format["<t color='#FF00FF'>Event</t><br/><t color='#00FFFF'>%1</t>", _name];};
				if(_x getVariable ["invisible", false] || !SHOW_NAMES) then {_text = "kAusweis";};
				if(player getVariable ["pTags", false]) then {_text = format["<t color='#FF00FF'>Spieler</t><br/><t color='#00FFFF'>%1</t>", _name];};
				
				if(_text == "kAusweis") then {
					_idc ctrlShow false;
				} else {
					_idc ctrlSetStructuredText parseText _text;
					_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
					_idc ctrlSetScale 0.8;
					_idc ctrlSetFade 0;
					_idc ctrlCommit 0;
					_idc ctrlShow true;
				};
				
				if(_x getVariable ["Duty", false] && {!(_x getVariable ["invisible", false])}) then {
					_text = format["<t size='1' color='#00FF00'>Supporter im Dienst</t><br/><t size='0.8'>%1</t>", _name];
					_idc ctrlSetStructuredText parseText _text;
					_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
					_idc ctrlSetScale 0.8;
					_idc ctrlSetFade 0;
					_idc ctrlCommit 0;
					_idc ctrlShow true;
				};
				
            } else {
                _idc ctrlShow false;
            };
    } else {
        _idc ctrlShow false;
    };
}forEach _units;