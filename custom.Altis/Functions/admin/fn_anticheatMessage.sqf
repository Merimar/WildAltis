private _msg = param [0, ""];
if(_msg == "" || !(remoteExecutedOwner isEqualTo HC_LIFE)) exitWith {};
systemChat _msg;