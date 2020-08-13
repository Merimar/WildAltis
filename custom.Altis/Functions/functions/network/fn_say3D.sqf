private _object = param [0, objNull, [objNull]];
private _sound = param [1, "", [""]];

if(isNull _object) exitWith {};
if(_sound isEqualTo "");

_object say3D _sound;