disableSerialization;
private _display = findDisplay 4200;
private _list = _display displayCtrl 4201;
private _combo = _display displayCtrl 4202;
private _group = group player;
private _indexList = lbCurSel 4201;
private _indexCombo = lbCurSel 4202;

if(GANG_CUR_ACTION == "INVITE") exitWith {};
if(_indexList isEqualTo -1 || _indexCombo isEqualTo -1) exitWith {["", "Du musst jemanden auswählen"] spawn life_fnc_message;};

private _promotion = parseNumber (_combo lbText _indexCombo);
_action = ["Möchtest du den Rang dieses Spielers wirklich ändern?", "Rangänderung", "Ja", "Nein"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

if(GANG_CUR_ACTION == "OFFLINE") exitWith {
private _pArray = call compile format["%1", _list lbData _indexList];
private _pName = _pArray select 0;
private _pID = _pArray select 1;
private _pSideID = _pArray select 2;

private _playerRang = [player, _group] call life_fnc_getGangRank;
private _unitRank = [objNull, _group, _pID, _pSideID] call life_fnc_getGangRank;

_bad = false;
if(_promotion isEqualTo 6) then {
_action = ["Bist du sicher dass dieser Spieler der neue Leader sein soll. Du verlierst deinen Rang danach", "Neuer Leader", "Ja", "Nein"] call BIS_fnc_guiMessage;
if(!_action) then {_bad = true;};
};
if(_bad) exitWith {};
if(_unitRank >= _playerRang) exitWith {["", "Keine Rechte!"] spawn life_fnc_message;};

["Du hast den Rang geändert", "Rangänderung"] spawn life_fnc_message;
[player, _pArray, _group, _promotion] remoteExec ["HC_fnc_gangOfflinePromote", HC_LIFE];
closeDialog 0;
GANG_CUR_ACTION = "";
};

private _unit = call compile format ["%1", _list lbData _indexList];
if(isNull _unit) exitWith {["", "Der Spieler ist offline"] spawn life_fnc_message;};

private _playerRang = [player, _group] call life_fnc_getGangRank;
private _unitRank = [_unit, _group] call life_fnc_getGangRank;

_bad = false;
if(_unitRank >= _playerRang || _promotion > _playerRang) exitWith {["", "Keine Rechte!"] spawn life_fnc_message;};
if(_promotion isEqualTo 6) then {
_action = ["Bist du sicher dass dieser Spieler der neue Leader sein soll. Du verlierst deinen Rang danach", "Neuer Leader", "Ja", "Nein"] call BIS_fnc_guiMessage;
if(!_action) then {_bad = true;};
};
if(_bad) exitWith {};

[format ["Du hast den Rang des Spielers %1 auf %2 geändert", name _unit, _promotion], "Rangänderung"] spawn life_fnc_message;
[player, _unit, _group, _promotion] remoteExec ["HC_fnc_gangPromote", HC_LIFE];