HC_UID = nil;

diag_log "Headless client init!";

"life_HC_isActive" addPublicVariableEventHandler {
    if(_this select 1) then {
        HC_UID = getPlayerUID hc_1;
        HC_Life = owner hc_1;
		HC_LIFE publicVariableClient "MONEY_PICKUP";
        publicVariable "HC_Life";
        diag_log "Headless client is connected and ready to work!";
    };
};

"life_MapHC_isActive" addPublicVariableEventHandler {
    if(_this select 1) then {
        HC_MapUID = getPlayerUID hc_2;
        HC_MAP = owner hc_2;
        publicVariable "HC_MAP";
        diag_log "Headless Map client is connected and ready to work!";
    };
};

HC_DC = ["HC_Disconnected","onPlayerDisconnected", {
        if(!isNil "HC_UID" && {_uid == HC_UID}) then {
            life_HC_isActive = false;
			HC_Life = false;
			life_HC_server_isReady = false;
            publicVariable "life_HC_isActive";
            publicVariable "HC_Life";
			publicVariable "life_HC_server_isReady";
            diag_log "Headless client disconnected! Broadcasted the vars!";
			[] remoteExec ["life_fnc_headlessdc", -2];
        };
		if(!isNil "HC_LogUID" && {_uid == HC_LogUID}) then {
            life_LogHC_isActive = false;
			HC_Log = false;
            publicVariable "life_LogHC_isActive";
            publicVariable "HC_Log";
            diag_log "Headless Log client disconnected! Broadcasted the vars!";
        };
		if(!isNil "HC_MapUID" && {_uid == HC_MapUID}) then {
            life_MapHC_isActive = false;
			HC_MAP = false;
            publicVariable "life_MapHC_isActive";
            publicVariable "HC_MAP";
            diag_log "Headless Map client disconnected! Broadcasted the vars!";
        };
    }
] call BIS_fnc_addStackedEventHandler;