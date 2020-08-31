private _houseType = param [0, false];
private _group = group player;
private _gangName = _group getVariable ["gang_name", ""];
private _gangBank = _group getVariable ["gang_bank", 0];
private _leader = (_group getVariable ["gang_owner", ""]) == getPlayerUID player;
private _housePrice = getNumber (missionConfigFile >> "CfgHouses" >> typeOf CURRENT_HOUSE_TARGET >> "price");
private _allHouses = bank_obj getVariable ["gang_houses", []];
private _countGangHouses = {((_x getVariable ["gang_information", [-2, "-1", "", []]]) select 1) == _gangName} count _allHouses;
private _countPlayerHouses = {(((_x getVariable ["gang_information", [-2, "-1", "", []]]) select 0) isEqualTo -2) && (((_x getVariable ["gang_information", [-2, "-1", "", []]]) select 2) == getPlayerUID player)} count _allHouses;

if((_houseType && _gangName == "") || (_houseType && _gangBank < _housePrice) || (_houseType && _countGangHouses >= 1) || (_houseType && !_leader)) exitWith {["Du erfüllst die Bedingungen für einen Hauskauf nicht. Denke daran dass du das Geld auf deinem Gangkonto haben musst!", "Haus kaufen"] spawn life_fnc_message;};
if((!_houseType && PLAYER_HOUSE_COUNT >= 2) || (!_houseType && BANK < _housePrice)) exitWith {["Du erfüllst die Bedingungen für einen Hauskauf nicht. Denke daran dass du das Geld auf deinem Konto haben musst!", "Haus kaufen"] spawn life_fnc_message;};
if(_houseType && "Garage" in (typeOf CURRENT_HOUSE_TARGET)) exitWith {["Du kannst keine Garagen als Ganghaus kaufen.", "Ganghaus"] spawn life_fnc_message;};

private _action = [format ["Möchtest du dieses Haus wirklich für €%1 kaufen?", [_housePrice] call life_fnc_numberText], "Haus kaufen", "Ja", "Abbrechen"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

[player, CURRENT_HOUSE_TARGET, _houseType] remoteExec ["HC_fnc_houseBuy", HC_LIFE];
closeDialog 0;

NO_INTERACTION = true;