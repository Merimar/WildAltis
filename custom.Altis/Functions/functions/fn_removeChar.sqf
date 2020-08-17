private _message = param [0, "", [""]];

private _messageArray = toArray _message;
private _badChars = toArray "'";
private _newArray = [];
{if(!(_x in _badChars)) then {_newArray pushBack _x;};}forEach _messageArray;
private _newMessage = toString _newArray;
_newMessage;