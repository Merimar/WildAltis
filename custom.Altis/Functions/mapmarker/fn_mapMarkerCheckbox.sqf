private _type = param [0, "", [""]];
private _box = param [1, 0, [0]];

_box = (_box isEqualTo 1);

switch (_type) do {
	case "Generell" : {MAP_MARKER_GENERELL = _box;};
	case "Polizei" : {MAP_MARKER_POLIZEI = _box;};
	case "Medic" : {MAP_MARKER_MEDIC = _box;};
	case "Rebell" : {MAP_MARKER_REBELL = _box};;
	case "Shops" : {MAP_MARKER_SHOPS = _box;};
	case "Legal" : {MAP_MARKER_LEGAL = _box;};
	case "Illegal" : {MAP_MARKER_ILLEGAL = _box;};
	case "DP" : {MAP_MARKER_DP = _box;};
};

{
private _boolean = _x select 0;
private _array = _x select 1;
private _alpha = if(_boolean) then {1} else {0};
{_x setMarkerAlphaLocal _alpha;}forEach _array;
}forEach [[MAP_MARKER_GENERELL, MAP_MARKER_GENERELL_MARKER], [MAP_MARKER_POLIZEI, MAP_MARKER_POLIZEI_MARKER], [MAP_MARKER_MEDIC, MAP_MARKER_MEDIC_MARKER], [MAP_MARKER_REBELL, MAP_MARKER_REBELL_MARKER], [MAP_MARKER_SHOPS, MAP_MARKER_SHOPS_MARKER], [MAP_MARKER_LEGAL, MAP_MARKER_LEGAL_MARKER], [MAP_MARKER_ILLEGAL, MAP_MARKER_ILLEGAL_MARKER], [MAP_MARKER_DP, MAP_MARKER_DP_MARKER]];