for "_int" from 0 to 1 step 0 do {

{
private _pID = getPlayerUID _x;
private _pSide = side _x;
private _copLevel = [_pID, "cop"] call HC_fnc_getSpecialLevel;
private _medicLevel = [_pID, "medic"] call HC_fnc_getSpecialLevel;

switch (side _x) do {

    case west: {
		
			if(backpack _x == "B_Bergen_tna_F") then {(unitBackpack _x) setObjectTextureGlobal[0, ""];};
			
			if(_copLevel >= 1 && uniform _x == "U_Rangemaster") then {_x setObjectTextureGlobal [0,"Images\Polizei\CopUniform_1.jpg"];};
			
			if(_copLevel >= 2) then {
				if(_copLevel <= 4) then {
					if(uniform _x == "U_B_CombatUniform_tshirt_mcam_wdL_f") then {
						_x setObjectTextureGlobal [0,"Images\Polizei\CopUniform_2_Kurz2.jpg"];
						_x setObjectTextureGlobal [1,"Images\Polizei\CopUniform_2_Kurz1.jpg"];
					};
				};
				
				if(uniform _x == "U_B_GEN_Commander_F") then {
					_x setObjectTextureGlobal [0,"Images\Polizei\CopUniform_2_Lang.jpg"];
				};
			};
			
			if((_copLevel >= 5 && _copLevel <= 7) || _copLevel isEqualTo 10) then {
				if(uniform _x == "U_B_CombatUniform_tshirt_mcam_wdL_f") then {
					_x setObjectTextureGlobal [0,"Images\Polizei\CopUniform_2_Kurz2.jpg"];
					_x setObjectTextureGlobal [1,"Images\Polizei\CopUniform_3_Kurz1.jpg"];
				};
				
				if(uniform _x == "U_B_Combatuniform_mcam") then {
					_x setObjectTextureGlobal [0,"Images\Polizei\CopUniform_2_Kurz2.jpg"];
				};
			};
			
			if(_copLevel >= 8 && _copLevel <= 9) then {
				if(uniform _x == "U_B_CombatUniform_tshirt_mcam_wdL_f") then {
					_x setObjectTextureGlobal [1,"Images\Polizei\CopUniform_4_Kurz1.jpg"];
					_x setObjectTextureGlobal [0,"Images\Polizei\CopUniform_4_Kurz2.jpg"];
				};
				
				if(uniform _x == "U_B_Combatuniform_mcam") then {
					_x setObjectTextureGlobal [0,"Images\Polizei\CopUniform_4_Kurz2.jpg"];
				};
			};
    };

    case independent: {
		
		if(backpack _x == "B_Bergen_tna_F") then {(unitBackpack _x) setObjectTextureGlobal[0, ""];};
		
        if((uniform _x) == "U_I_CombatUniform") then {
			if(_medicLevel isEqualTo 1) then {
				_x setObjectTextureGlobal [0,"Images\Medic\fw_uniform_lvl8.jpg"];
			};
			if(_medicLevel isEqualTo 2) then {
				_x setObjectTextureGlobal [0,"Images\Medic\fw_uniform_lvl7.jpg"];
			};
			if(_medicLevel isEqualTo 3) then {
				_x setObjectTextureGlobal [0,"Images\Medic\fw_uniform_lvl6.jpg"];
			};
			if(_medicLevel isEqualTo 4) then {
				_x setObjectTextureGlobal [0,"Images\Medic\fw_uniform_lvl5.jpg"];
			};
			if(_medicLevel isEqualTo 5) then {
				_x setObjectTextureGlobal [0,"Images\Medic\fw_uniform_lvl4.jpg"];
			};
			if(_medicLevel isEqualTo 6) then {
				_x setObjectTextureGlobal [0,"Images\Medic\fw_uniform_lvl3.jpg"];
			};
			if(_medicLevel isEqualTo 7) then {
				_x setObjectTextureGlobal [0,"Images\Medic\fw_uniform_lvl2.jpg"];
			};
			if(_medicLevel isEqualTo 8) then {
				_x setObjectTextureGlobal [0,"Images\Medic\fw_uniform_lvl1.jpg"];
			};
			if(_medicLevel > 8) then {
				_x setObjectTextureGlobal [0,"Images\Medic\fw_uniform_lvl3.jpg"];
			};
		};
    };
};

}forEach playableUnits;
sleep 30;
};