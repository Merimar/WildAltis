private _textArray = [];

for "_int" from 0 to ((count _this) - 1) step 1 do {
private _array = param [_int, []];
private _header = _array param [0, ""];
private _value = _array param [1, ""];
private _isColor = _array param [2, false];
private _color = if(_isColor) then {"#8cff9b"} else {"#FFFFFF"};
_textArray pushBack format ["%1: <t color = '%2'>%3</t>"];
};

private _text = _textArray joinString "<br/>";
_text;