private _logType = param [0, ""];
private _logTitle = param [1, ""];
private _logOrigin = param [2, ""];
private _time = param [3, ""];
private _unit = param [4, objNull];
private _logInformation = param [5, []];
private _infoArray = [format["""%1"":""%2""", "time", _time], format["""%1"":""%2""", "category", _logType], format["""%1"":""%2""", "type", _logTitle], format["""%1"":""%2""", "origin", _logOrigin]];
private _dataArray = [];

_positionToJSON = {
private _pos = _this select 0;
private _pPosX = _pos select 0;
private _pPosY = _pos select 1;
private _pPosZ = _pos select 2;
private _pPos = format ["{ ""x"":%1, ""y"":%2, ""z"":%3 }", _pPosX, _pPosY, _pPosZ];
_pPos;
};

_objToJSON = {
private _obj = _this select 0;
private _pName = name _obj;
private _pID = getPlayerUID _obj;
private _pSide = side _obj;
private _pPos = [getPos _obj] call _positionToJSON;
private _return = format ["{ ""name"":""%1"", ""id"":""%2"", ""side"":""%3"", ""position"":%4 }", _pName, _pID, _pSide, _pPos];
_return;
};

{
private _xHeader = format ["""%1""", _x select 0];
private _xInfo = _x select 1;
switch (true) do {
case (_xInfo isEqualType "") : {_xInfo = format["""%1""", _xInfo];};
case (_xInfo isEqualType 0) : {_xInfo = format["%1", _xInfo];};
case (_xInfo isEqualType true) : {_xInfo = format["%1", toLower (str (_xInfo))];};
case (_xInfo isEqualType objNull) : {_xInfo = [_xInfo] call _objToJSON;};
case (_xInfo isEqualType []) : {
private _xxArray = [];
{
_xxxInfo = if(_x isEqualType objNull) then {[_x] call _objToJSON}else {format["""%1""", _x]};
_xxArray pushBack (format["""%1"":%2", _forEachIndex, _xxxInfo]);
}forEach _xInfo;
_xInfo = format ["{ %1 }", _xxArray joinString ", "];
};
};
private _text = format ["%1:%2", _xHeader, _xInfo];
_dataArray pushBack _text;
}forEach _logInformation;

private _player = format ["""player"":%1", [_unit] call _objToJSON];
_infoArray pushBack _player;

private _data = format ["""data"":{ %1 }", _dataArray joinString ", "];
_infoArray pushBack _data;

private _result = _infoArray joinString ", ";
_result = format ["{ %1 }", _result];
_result;

