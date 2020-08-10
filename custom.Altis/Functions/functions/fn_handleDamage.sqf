private _unit = _this select 0;
private _part = _this select 1;
private _damage = _this select 2;
private _source = _this select 3;
private _projectile = _this select 4;

if(!(isNull _unit)) then {
if((vehicle _source) != _source && _source isKindOf "Man" && (time - life_anfahr_timer) > 2 && _unit != _source) then {
[] spawn {player allowDamage false;sleep 2;player allowDamage true;};
life_anfahr_timer = time;
[player, "amovppnemstpsraswrfldnon", true] remoteExecCall ["life_fnc_healSync", -2];
["", format["Du wurdest von %1 angefahren", name _source]] spawn life_fnc_message;
};

if((vehicle _source) != _source && _source isKindOf "Man" && _unit != _source) then {_damage = 0.95;};

if(!(isNull _source)) then {
private _curWep = currentWeapon _source;
if(!(isNull objectParent _source)) exitWith {};
if(!(_curWep in ["hgun_P07_F", "hgun_P07_khk_F", "hgun_P07_snds_F", "hgun_P07_khk_Snds_F"])) exitWith {};
_damage = getDammage _unit;

if(life_istazed || life_isknocked || _unit distance _source > 35 || ((side _unit) == west && (side _source) == west)) exitWith {};
if(isNull objectParent player) then {
if(typeOf (vehicle player) == "B_Quadbike_01_F") then {
player action ["Eject",vehicle player];
[_unit, _source] spawn life_fnc_tazed;
}else {
[_unit, _source] spawn life_fnc_tazed;
};
}else {
[_unit, _source] spawn life_fnc_tazed;
};
};

if(time - NO_DAMAGE < 10) then {
_damage = 0;
};
	
if(isNull _source) then {
private _bomb = getNumber (configfile >> "CfgAmmo" >> _projectile >> "explosive");
if(_bomb isEqualTo 1 && !(_projectile in WHITELIST)) then {
_damage = 0;
NO_DAMAGE = time;
};
};

[] spawn life_fnc_hudUpdate;
};
_damage;