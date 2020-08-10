disableSerialization;
private _display = findDisplay 4000;
private _index = lbCurSel 4003;

if(_index isEqualTo -1) exitWith {};
HEXAGON_D = parseNumber (lbData [4003, _index]);

private _settings = profileNamespace getVariable ["WildAltis_Settings", []];
_settings set [6, HEXAGON_D];
profileNamespace setVariable ["WildAltis_Settings", _settings];
saveProfileNamespace;