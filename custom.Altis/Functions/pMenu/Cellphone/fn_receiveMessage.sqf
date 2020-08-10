private _selection = param [0, 0, [0]];
private _message = param [1, "", [""]];
private _playerName = param [2, "", [""]];

private _messageType = "";
private _notificationType = "";

switch (_selection) do {
case 0 : {_messageType = format ["Du hast eine Nachricht von %1 bekommen", _playerName]; _notificationType = "TextMessage";};
case 1 : {_messageType = format ["Neuer Polizeinotruf von %1", _playerName]; _notificationType = "PoliceDispatch";};
case 2 : {_messageType = format ["Neuer Feuerwehrnotruf von %1", _playerName]; _notificationType = "MedicDispatch";};
case 3 : {_messageType = format ["Du hast eine Nachricht an deine Gang von %1 bekommen", _playerName]; _notificationType = "TextMessage";};
case 4 : {_messageType = format ["Neuer Adminnotruf von %1", _playerName]; _notificationType = "AdminDispatch";};
case 5 : {_messageType = "Warnung von der Polizei"; _notificationType = "PoliceMessage";};
case 6 : {_messageType = "Warnung von der Feuerwehr";; _notificationType = "MedicMessage";};
case 7 : {_messageType = "Ankündigung Gangeroberung"; _notificationType = "TextMessage";};
case 8 : {_messageType = "Adminnachricht"; _notificationType = "AdminMessage";};
case 9 : {_messageType = "Du hast eine Nachricht von einem Admin bekommen"; _notificationType = "AdminMessage";};
case 10 : {_messageType = format ["Dein Notruf wurde von %1 beantwortet", _playerName]; _notificationType = "PoliceMessage";};
case 11 : {_messageType = format ["Dein Notruf wurde %1 beantwortet", _playerName]; _notificationType = "MedicMessage";};
};

LIFE_MESSAGE_SAVE pushBack [_playerName, _message, time];

[_notificationType, [_messageType]] call bis_fnc_showNotification;
[_message, _messageType, 15] spawn life_fnc_message;