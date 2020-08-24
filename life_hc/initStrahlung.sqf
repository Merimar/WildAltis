STRAHLUNG = [];

for "_int" from 0 to 1 step 0 do {

{
if(_x in STRAHLUNG && uniform _x == "U_C_CBRN_Suit_01_Wdl_F") then {STRAHLUNG = STRAHLUNG - [_x];};

if(alive _x && (_x inArea "Zone_Verstrahlt_1" || _x inArea "Zone_Verstrahlt_2" || _x inArea "Zone_Verstrahlt_3" || _x inArea "Zone_Verstrahlt_4" || _x inArea "Zone_Verstrahlt_5")) then {
if(_x in STRAHLUNG) then {
STRAHLUNG = STRAHLUNG - [_x];
_x setDamage 1;
["Du bist durch eine zu hohe Ladung an Strahlung gestorben.", "Verstrahltes Gebiet"] remoteExec ["life_fnc_message", _x];
["StrahlungLog", format ["Der Spieler %1 (%2 - %3) ist durch Radioaktivität gestorben", name _x, getPlayerUID _x, side _x]] call HC_fnc_Log;
};

if(uniform _x != "U_C_CBRN_Suit_01_Wdl_F") then {STRAHLUNG pushBack _x;};
}else {
STRAHLUNG = STRAHLUNG - [_x];
};
}forEach playableUnits;

sleep 60;
};