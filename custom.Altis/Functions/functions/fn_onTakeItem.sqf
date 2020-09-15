#include "..\script_macros.hpp"
private _unit = param [0, objNull];
private _container = param [1, objNull];
private _item = param [2, ""];
private _items = uniformItems player + vestItems player + backpackItems player + [uniform player, vest player, backpack player];

if(isNull _unit || isNull _container || _item isEqualTo "") exitWith {};

private _items = uniformItems player + vestItems player + backpackItems player + [uniform player, vest player, backpack player];

if(!(isNull objectParent player)) then {
private _count = {_item == _x} count _items;
private _index = if((DUPE_ARRAY findIf {_x select 0 == _item}) isEqualTo -1) then {count DUPE_ARRAY} else {DUPE_ARRAY findIf {_x select 0 == _item}};
DUPE_ARRAY set [_index, [_item, _count]];
};

[] call life_fnc_updateCom;

if(!((typeOf _container) isKindOf "AllVehicles") && !((typeOf _container) isKindOf "groundweaponholder")) then {
{
private _con = _x select 1;
clearItemCargo _con;
clearMagazineCargo _con;
clearWeaponCargo _con;
}forEach (everyContainer _container);
};

private _list = ["V_PlateCarrier1_blk","V_PlateCarrier1_rgr","V_PlateCarrier1_rgr_noflag_f","V_PlateCarrier1_tna_f","V_PlateCarrier1_wdl","V_PlateCarrier2_blk","V_PlateCarrier2_rgr","V_PlateCarrier2_tna_f","V_PlateCarrier2_wdl", "V_PlateCarrierSpec_blk","V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_mtp","V_PlateCarrierSpec_tna_f","V_PlateCarrierSpec_wdl","V_PlateCarrierH_CTRG", "arifle_RPK12_lush_F", "arifle_RPK12_arid_F", "arifle_RPK12_F", "LMG_Zafir_F", "MMG_01_hex_F","MMG_01_tan_F", "MMG_02_black_F","MMG_02_camo_F","MMG_02_sand_F", "srifle_DMR_02_F","srifle_DMR_02_sniper_F", "srifle_DMR_02_camo_F","srifle_LRR_F", "srifle_LRR_camo_F","srifle_LRR_tna_F", "srifle_GM6_F","srifle_GM6_camo_F", "srifle_GM6_ghex_F", "srifle_DMR_05_blk_F", "srifle_DMR_05_hex_F", "srifle_DMR_05_tan_f", "LMG_Mk200_F", "LMG_Mk200_black_F", "LMG_03_F", "arifle_MX_SW_F", " arifle_MX_SW_khk_F", "arifle_MX_SW_Black_F", "arifle_SPAR_02_blk_F", "arifle_SPAR_02_khk_F", "arifle_SPAR_02_snd_F", "arifle_CTARS_blk_F", "arifle_CTARS_hex_F", "arifle_CTARS_ghex_F", "srifle_DMR_04_F", "srifle_DMR_04_Tan_F", "U_B_GhillieSuit", "U_O_GhillieSuit", "U_I_GhillieSuit", "U_B_T_Sniper_F", "U_O_T_Sniper_F", "U_B_FullGhillie_lsh", "U_B_FullGhillie_sard", "U_B_FullGhillie_ard", "U_O_FullGhillie_lsh", "U_O_FullGhillie_sard", "U_O_FullGhillie_ard", "U_I_FullGhillie_lsh", "U_I_FullGhillie_sard", "U_I_FullGhillie_ard", "U_B_T_FullGhillie_tna_F", "U_O_T_FullGhillie_tna_F", "_B_CTRG_Soldier_urb_1_F", "U_B_CTRG_Soldier_urb_2_F", "U_B_CTRG_Soldier_urb_3_F", "U_B_CTRG_Soldier_F", " U_B_CTRG_Soldier_2_F", "U_B_CTRG_Soldier_3_F", "U_B_CTRG_1", "U_B_CTRG_2", "U_B_CTRG_3", "U_O_PilotCoveralls"];
if(_item in _list && playerSide isEqualTo civilian) then {
private _wh = "GroundWeaponHolder_Scripted" createVehicle (getPos player);
player action ["DropWeapon", _wh, _item];
["Du kannst diese Waffe nur als Rebell aufheben.", "Nicht für deine Fraktion"] spawn life_fnc_message;
};

_details = [_item] call life_fnc_fetchCfgDetails;
if(((count _details) > 0) && ((_details select 6) == "CfgWeapons") && ((_details select 5) == 801)) then {
	if(!(player isUniformAllowed _item)) then {
		if(uniform player != "") then {
			private _uItems = uniformItems player;
			removeUniform player;
			player removeItemFromBackpack _item;
			player forceAddUniform _item;
			{player addItemToUniform _x} forEach (uniformItems player);
		} else {
			player forceAddUniform _item;
			player removeItemFromBackpack _item;
		};
	};
};

[player, _item, _container] remoteExec ["HC_fnc_takeItem", HC_LIFE];