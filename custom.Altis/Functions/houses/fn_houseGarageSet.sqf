GARAGE_SETTING_TYPE = param [0, false];
if(GARAGE_SET_TIMER) exitWith {["Du kannst nur alle 5 Minuten versuchen eine Garage zu setzen", "Garage"] spawn life_fnc_message;};

[] spawn {
GARAGE_SET_TIMER = true;
sleep (5 * 60);
GARAGE_SET_TIMER = false;
};

GARAGE_SETTING = true;
["Stelle dich an die Position wo deine Fahrzeuge ausgeparkt werden sollen. Bleibe hierfür bitte in einem 20m Radius. Denk auch daran auch in die richtige Richtung zu schauen, dass Fahrzeug spawnt in die gleiche Richtung, in die du schaust!<br/><br/>Wenn du eine geeignete Position gefunden hast bestätige deine Auswahl mit: <br/><br/><t color = '#ADCB15'>'Shift + K'</t>", "Garage setzen", 20] spawn life_fnc_message;