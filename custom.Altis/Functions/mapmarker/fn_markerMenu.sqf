disableSerialization;

waitUntil {visibleMap};

(findDisplay 46) createDisplay "Map";
private _display = findDisplay 4800;
private _slider = _display displayCtrl 4801;
private _boxGenerell = _display displayCtrl 4802;
private _boxPolizei = _display displayCtrl 4803;
private _boxMedic = _display displayCtrl 4804;
private _boxRebell = _display displayCtrl 4805;
private _boxShops = _display displayCtrl 4806;
private _boxLegal = _display displayCtrl 4807;
private _boxIllegal = _display displayCtrl 4808;
private _boxDP = _display displayCtrl 4809;
private _btnReset = _display displayCtrl 4810;

_slider sliderSetRange [0.1, 2.5];
_slider sliderSetSpeed [0.1, 0.1];
_slider sliderSetPosition MAP_MARKER_SLIDER;

{
(_x select 1) cbSetChecked (_x select 0);
}forEach [[MAP_MARKER_GENERELL, _boxGenerell], [MAP_MARKER_POLIZEI, _boxPolizei], [MAP_MARKER_MEDIC, _boxMedic], [MAP_MARKER_REBELL, _boxRebell], [MAP_MARKER_SHOPS, _boxShops], [MAP_MARKER_LEGAL, _boxLegal], [MAP_MARKER_ILLEGAL, _boxIllegal], [MAP_MARKER_DP, _boxDP]];

waitUntil {!visibleMap};
_display closeDisplay 1;