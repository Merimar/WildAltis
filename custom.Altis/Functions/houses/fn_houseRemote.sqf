private _geheimZahl = param [0, -1, [0]];
private _houseBuyType = param [1, false];
private _returnCode = param [2, 0];
private _extraInfo = param [3, ""];
private _money = param [4, 0];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

NO_INTERACTION = false;

if(_returnCode isEqualTo 0) exitWith {};

switch (_returnCode) do {

	case 1 : {["", "Das Haus ist bereits gekauft"] spawn life_fnc_message;};
	case 2 : {["", "Deine Gang hat bereits ein Haus gekauft"] spawn life_fnc_message;};
	case 3 : {["", "Du hast bereits 2 Häuser"] spawn life_fnc_message;};
	case 4 : {[_extraInfo, "Ganghaus gekauft"] spawn life_fnc_message;};
	case 5 : {[_extraInfo, "Haus gekauft"] spawn life_fnc_message; BANK = BANK - _money; PLAYER_HOUSE_COUNT = PLAYER_HOUSE_COUNT + 1;};
	case 6 : {["", "Du bist nicht der Gangleader"] spawn life_fnc_message;};
	case 7 : {["", "Du hast das Ganghaus verkauft"] spawn life_fnc_message;};
	case 8 : {["", "Du hast dein Haus verkauft"] spawn life_fnc_message;};
	case 9 : {life_houses pushBack _extraInfo;};
};