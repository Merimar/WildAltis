private _requestName = param [0, "", [""]];
private _title = format ["%1 benötigt medizinische Hilfe", _requestName];

["MedicalRequestEmerg", [_title]] call BIS_fnc_showNotification;