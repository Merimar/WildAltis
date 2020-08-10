private _vehicle = param [0, objNull, [objNull]];
if(isNull _vehicle) exitWith {};

_vehicle removeAllEventHandlers "handleDamage";

_vehicle addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];	
	if(isNull _source) then {
		_bomb = getNumber (configfile >> "CfgAmmo" >> _projectile >> "explosive");
		if(_bomb isEqualTo 1 && !(_projectile in ["FuelExplosion"])) then {_damage = 0;};
	};
	_damage;
}];