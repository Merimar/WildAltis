#include "..\script_macros.hpp"

if(AUSWEIS_TIMER) exitWith {};
AUSWEIS_TIMER = true;
[] spawn {
sleep 10;
AUSWEIS_TIMER = false;
};

_targets = playableUnits select {_x distance player < 5};

if(count _targets isEqualTo 0) exitWith {};

_vorname = AUSWEIS select 1;
_nachname = AUSWEIS select 2;
_plz = AUSWEIS select 3;
_strase = AUSWEIS select 4;
_land = AUSWEIS select 5;
_provinz = AUSWEIS select 6;
_ort = AUSWEIS select 7;
_hausnummer = AUSWEIS select 8;
_spielzeit = format ["%1 h", round (life_playtime / 60)];
_uid = str life_uid;
_face = face player;

[_vorname, _nachname, _land, _provinz, _ort, _plz, _strase, _hausnummer, _uid, _spielzeit, _face] remoteExec ["life_fnc_getID", _targets];

_msg = format["Du hast %1 Leuten deinen Ausweis gezeigt", count _targets];
MSG(_msg);