private _unit = param [0, objNull];

if(!(isNull _unit)) then {titleText [format ["Der Spieler %1 hat dich unter Drogen gesetzt", name _unit], "PLAIN"];};

closeDialog 0;
sleep 3;

"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

player setVariable ["drugs", true, true];
player setVariable ["drogen", true, true];

for "_i" from 0 to 44 do
{
    "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
    "chromAberration" ppEffectCommit 1;   
    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 3, 1, random 3];
    sleep 1;
};

"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;

player setVariable ["drogen", false, true];

sleep 1200;
player setVariable ["drugs", false, true];
