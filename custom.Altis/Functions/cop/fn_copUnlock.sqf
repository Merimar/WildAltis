private _close = if(playerSide isEqualTo west) then {0} else {1};

{
_x setVariable ["bis_disabled_Door_0", _close];
_x setVariable ["bis_disabled_Door_1", _close];
_x setVariable ["bis_disabled_Door_2", _close];
_x setVariable ["bis_disabled_Door_3", _close];
_x setVariable ["bis_disabled_Door_4", _close];
_x setVariable ["bis_disabled_Door_5", _close];
_x setVariable ["bis_disabled_Door_6", _close];
_x animate ["Door_0_rot", 0];
_x animate ["Door_1_rot", 0];
_x animate ["Door_2_rot", 0];
_x animate ["Door_3_rot", 0];
_x animate ["Door_4_rot", 0];
_x animate ["Door_5_rot", 0];
_x animate ["Door_6_rot", 0];
}forEach [zenti_part_2, zenti_part_3];