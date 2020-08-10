private _houseName = getText (configFile >> "CfgVehicles" >> typeOf CURRENT_HOUSE_TARGET >> "displayName");
private _housePrice = getNumber (missionConfigFile >> "CfgHouses" >> typeOf CURRENT_HOUSE_TARGET >> "price");

[format ["Folgende Informationen konnten herausgefunden werden:<br/><br/>Name: %1<br/>Preis: %2", _houseName, [_housePrice] call life_fnc_numberText], "Hausinformationen"] spawn life_fnc_message;
closeDialog 0;