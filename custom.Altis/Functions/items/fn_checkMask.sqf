["Dir wurde eine Maske über den Kopf gestülpt", "Maske"] spawn life_fnc_message;

private _name = "ColorCorrections";
private _priority = 1500;
private _effect = [0, 0.4, 0, [0, 0, 0, 0], [0, 0, 0, 0], [1, 1, 1, 0]];
private _handle = 0;

while {
	_handle = ppEffectCreate [_name, _priority];
	_handle < 0
} do {
	_priority = _priority + 1;
};

_handle ppEffectEnable true;
_handle ppEffectAdjust _effect;
_handle ppEffectCommit 1;

waitUntil {!(player getVariable ["mask", false]) || !(player getVariable ["restrained", false])};

_handle ppEffectEnable false;
ppEffectDestroy _handle;
["Die Maske wurde dir wieder abgenommen", "Maske"] spawn life_fnc_message;