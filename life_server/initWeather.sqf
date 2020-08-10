private _cloud = false;
private _rain = false;
private _wind = false;
private _thunder = false;

private _cloudRandom = round (random 100) + 1;
private _rainRandom = round (random 100) + 1;
private _windRandom = round (random 100) + 1;
private _thunderRandom = round (random 100) + 1;

private _isWeather = round (random 100) + 1;

if(_isWeather <= 10) then {
skipTime -24;
86400 setFog 0;

if(_cloudRandom > 60) then {86400 setOvercast 1; _cloud = true;};
if(_rainRandom > 60 && _cloud) then {86400 setRain 1; _rain = true;};
if(_windRandom > 30 && _cloud) then {setWind [10, 10, true]; _wind = true;};
if(_thunderRandom > 30 && _rain) then {86400 setLightnings 1; _thunder = true;};

skipTime 24;
};

for "_int" from 0 to 1 step 0 do {
0 setFog 0;
sleep (15 * 60);
};
