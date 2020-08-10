MARKT_ARRAY = [];
MARKT_SERVER_ARRAY = [];
MARKT_WERT = 0;
CANCEL_EVENT = false;

private _marktItems = ("true" configClasses(missionConfigFile >> "Items"));

{
private _isFarmItem = getText (_x >> "type") == "MARKT";
private _buyPrice = getNumber (_x >> "buyPrice");
private _sellPrice = getNumber (_x >> "sellPrice");
private _illegal = getNumber (_x >> "illegal") isEqualTo 1;
if(_isFarmItem) then {
MARKT_ARRAY pushBack [configName _x, _buyPrice, _sellPrice, _illegal, 1, 0, -1];
MARKT_WERT = MARKT_WERT + _sellPrice;
};
}forEach _marktItems;

MAKRT_MULTIPLIER = round(random(5));

for "_int" from 0 to 1 step 0 do {
publicVariable "MARKT_ARRAY";
MARKT_SERVER_ARRAY = +MARKT_ARRAY;
sleep (10 * 60);
private _random = round(random(5));
if(_random isEqualTo 0) then {MAKRT_MULTIPLIER = round(random(5));};
};