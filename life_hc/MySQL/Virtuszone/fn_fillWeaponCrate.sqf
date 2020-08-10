private _veh = param [0, objNull];
private _chance = [["arifle_Zafir_F",2], ["srifle_EBR_F",5], ["srifle_LRR_F",2], ["srifle_LRR_tna_F",2], ["LMG_Mk200_F",3], ["arifle_Katiba_F",10], ["arifle_Katiba_F",10], ["arifle_MX_F",10], ["arifle_MX_khk_F",10], ["arifle_MX_SW_F",8], ["arifle_MX_SW_khk_F",8], ["arifle_Mk20_F",10], ["arifle_MXM_F",10], ["arifle_MXM_khk_F",10], ["arifle_SPAR_01_khk_F",10], ["arifle_SPAR_01_snd_F",10], ["arifle_SPAR_03_snd_F",7], ["arifle_SPAR_03_khk_F",7], ["arifle_MXC_khk_F",10], ["arifle_MXC_F",10], ["arifle_TRG21_F",10], ["arifle_TRG21_F",10], ["SMG_02_F",10], ["srifle_DMR_04_Tan_F",3], ["srifle_DMR_07_hex_F",6], ["srifle_DMR_07_ghex_F",6], ["LMG_03_F",5], ["arifle_AK12_lush_F",5], ["arifle_AK12_arid_F",5], ["arifle_AKM_F",5], ["arifle_AKS_F",9], ["arifle_ARX_hex_F",7], ["arifle_ARX_ghex_F",9], ["arifle_CTAR_hex_F",10], ["arifle_CTAR_ghex_F",10], ["arifle_CTARS_hex_F",7], ["arifle_CTARS_ghex_F",7], ["SMG_05_F",11], ["SMG_02_F",11], ["srifle_DMR_01_F",8], ["srifle_DMR_03_khaki_F",2], ["srifle_DMR_03_tan_F",2], ["srifle_DMR_03_multicam_F",2], ["srifle_DMR_03_woodland_F",2], ["arifle_MSBS65_F",2], ["arifle_MSBS65_camo_F",2], ["arifle_MSBS65_sand_F",2], ["arifle_MSBS65_Mark_F",2], ["arifle_MSBS65_Mark_camo_F",2], ["arifle_MSBS65_Mark_sand_F",2], ["SMG_01_F",12], ["hgun_PDW2000_F",12], ["hgun_PDW2000_F",12], ["srifle_DMR_06_camo_F",7], ["srifle_DMR_06_olive_F",7], ["srifle_DMR_06_camo_F",7], ["srifle_DMR_06_hunter_F",7], ["srifle_DMR_02_camo_F",6], ["srifle_DMR_02_sniper_F",6], ["arifle_RPK12_lush_F",8], ["arifle_RPK12_arid_F",8], ["SMG_03_TR_camo",4], ["SMG_03_TR_hex",4], ["SMG_03_TR_khaki",4], ["SMG_03C_TR_camo",4], ["SMG_03C_TR_hex",4], ["SMG_03C_TR_khaki",4], ["hgun_Rook40_F",14], ["hgun_Pistol_01_F",14]];

{
private _className = _x select 0;
private _perc = _x select 1;
private _random = round(random(100));
if(_random < _perc) then {
private _ammo = (getArray (configfile >> "CfgWeapons" >> _classname >> "magazines")) param [0, "30Rnd_65x39_caseless_mag_Tracer"];
_veh addWeaponCargoGlobal [_className, 1];
_veh addMagazineCargoGlobal [_ammo, 5 * round (random (2) + 1)];
};
}forEach _chance;