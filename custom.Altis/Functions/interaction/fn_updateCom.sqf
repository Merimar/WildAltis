if("ItemGPS" in (assignedItems player)) then {
_info = player getVariable ["Communication", [false, false]];
_gps = _info select 0;
_radio = _info select 1;
//if(!_gps) then {player setVariable ["Communication", [true, _radio], true];};
};

if("ItemRadio" in (assignedItems player)) then {
_info = player getVariable ["Communication", [false, false]];
_gps = _info select 0;
_radio = _info select 1;
//if(!_radio) then {player setVariable ["Communication", [_gps, true], true];};
};