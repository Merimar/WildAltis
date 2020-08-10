private _unit = param [0, objNull, [objNull]];
private _className = param [1, "", [""]];
private _amount = param [2, 0, [0]];
private _type = param [3, 1, [0]];

private _isHacker = [[_className], _unit, remoteExecutedOwner, "fn_dropItemMod", true] call HC_fnc_checkSQLBreak;
if(_isHacker || _className == "" || _amount == 0) exitWith {};

private _weaponHolder = createVehicle ["GroundWeaponHolder_Scripted", getPos _unit, [], 0, "can_collide"];
private _displayName = ([_className] call HC_fnc_fetchCfgDetails) select 1;
_weaponHolder setVariable ["eventContainer", true];

if(_type isEqualTo 1) then {_weaponHolder addWeaponCargoGlobal [_className, _amount];};
if(_type isEqualTo 2) then {_weaponHolder addMagazineCargoGlobal [_className, _amount];};
if(_type isEqualTo 3) then {_weaponHolder addItemCargoGlobal [_className, _amount];};
if(_type isEqualTo 4) then {_weaponHolder addBackpackCargoGlobal [_className, _amount];};

["AdminLog", format ["Der Spieler %1 (%2 - %3) hat %3 %4 gedroppt!", name _unit, getPlayerUID _unit, side _unit, _amount, _displayName]] call HC_fnc_Log;