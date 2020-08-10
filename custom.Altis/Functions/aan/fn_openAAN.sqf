disableSerialization;
if(isNull findDisplay 3700) then {createDialog "AAN";};
private _display = findDisplay 3700;
private _header = _display displayCtrl 3701;
private _message = _display displayCtrl 3702;
private _sendBtn = _display displayCtrl 4703;

_sendBtn ctrlEnable (CASH >= 100000 && !AAN_NEWS);
_message ctrlSetText "Hier deine Nachricht eingeben";
_header ctrlSetText "Hier deinen Titel eingeben";