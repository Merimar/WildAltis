private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _mode = param [3, 0];

if (_pID isEqualTo "" || _pSide isEqualTo sideUnknown) exitWith {};

switch (_mode) do {
    case 0: {
		private _input = param [2, objNull];
		private _keyArray = _input select {!isNull _x && {!(_x isKindOf "House")}};
        missionNamespace setVariable [format ["%1_KEYS_%2", _pID, _pSide], _keyArray];
    };

    case 1: {
        private _input = param [2, objNull];
        if(isNull _input) exitWith {};
        _keyArray = missionNamespace getVariable [format ["%1_KEYS_%2", _pID, _pSide], []];
        _keyArray pushBack _input;
        _keyArray = _keyArray - [objNull];
        missionNamespace setVariable [format ["%1_KEYS_%2", _pID, _pSide], _keyArray];
    };

    case 2: {
        _keyArray = missionNamespace getVariable [format ["%1_KEYS_%2", _pID, _pSide], []];
        _keyArray = _keyArray - [objNull];
        missionNamespace setVariable [format ["%1_KEYS_%2", _pID, _pSide], _keyArray];
    };
};