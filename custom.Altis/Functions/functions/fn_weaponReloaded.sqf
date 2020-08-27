params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
private _bad = false;
if(count _newMagazine isEqualTo 0) exitWith {};

_newMagazine = _newMagazine select 0;

if(!(_weapon in ["arifle_MX_SW_F", "arifle_MX_SW_khk_F", "arifle_MX_SW_Black_F"]) && _newMagazine in ["100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_khaki_mag","100Rnd_65x39_caseless_black_mag","100Rnd_65x39_caseless_mag_Tracer","100Rnd_65x39_caseless_khaki_mag_tracer","100Rnd_65x39_caseless_black_mag_tracer"]) then {
_unit setAmmo [_weapon, 0];
_bad = true;
};

if(!(_weapon in ["arifle_RPK12_F", "arifle_RPK12_lush_F", "arifle_RPK12_arid_F"]) && _newMagazine in ["75Rnd_762x39_Mag_F","75Rnd_762x39_Mag_Tracer_F","75rnd_762x39_AK12_Mag_F","75rnd_762x39_AK12_Mag_Tracer_F","75rnd_762x39_AK12_Lush_Mag_F","75rnd_762x39_AK12_Lush_Mag_Tracer_F","75rnd_762x39_AK12_Arid_Mag_F","75rnd_762x39_AK12_Arid_Mag_Tracer_F"]) then {
_unit setAmmo [_weapon, 0];
_bad = true;
};

if(_bad) then {["Du kannst dieses Magazin nicht in diese Waffe laden", "Magazin verboten"] spawn life_fnc_message;};
[player, _weapon, _oldMagazine, _newMagazine] remoteExec ["HC_fnc_weaponReloaded", HC_LIFE];