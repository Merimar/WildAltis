_string = _this select 0;
_count = count _string;
_array = [];
_returnString = "";

for "_int" from 0 to _count step 1 do {
_array pushBack (_string select [_int, 1]);
};

_curVocal = "";
_curIndex = 0;
{
_cur = _x;
if(_curVocal == "") then {
if(_x in ["a", "u", "o", "A", "U", "O"]) then {
_curVocal = _x;
_curIndex = _forEachIndex;
_cur = "";
};
}else {
if(_x == "e") then {
if(_curVocal isEqualTo "a") then {
_cur = localize "STR_AELower";
};
if(_curVocal isEqualTo "u") then {
_cur = localize "STR_UELower";
};
if(_curVocal isEqualTo "o") then {
_cur = localize "STR_OELower";
};
if(_curVocal isEqualTo "A") then {
_cur = localize "STR_AEUpper";
};
if(_curVocal isEqualTo "U") then {
_cur = localize "STR_UEUpper";
};
if(_curVocal isEqualTo "O") then {
_cur = localize "STR_OEUpper";
};
_curVocal = "";
}else {
_returnString = _returnString + _curVocal;
_curVocal = "";
};
};
_returnString =  _returnString + _cur;
}forEach _array;

_returnString;