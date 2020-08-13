//RemoteExec Macros
#define RSERV 2
#define RCLIENT -2
#define RANY 0

#define MSG(M) ["", M] spawn life_fnc_message
#define MSG_TITLE(M, H) [M, H] spawn life_fnc_message
#define ERROR(M) [M, "Fehler"] spawn life_fnc_message
#define SIDELINE(M, I) [M, I] spawn life_fnc_sideline
#define HEADLINE(M) [M] spawn life_fnc_headline
#define SKILL_MSG(M) [M, [0.5,0.5,1,1], 2, 0.5] spawn life_fnc_tileMessage; 
#define BROADCAST(var1) [var1, 0] remoteExecCall ["life_fnc_broadcast", -2]
#define BROADCAST(var1,var2) [var1, 0] remoteExecCall ["life_fnc_broadcast", var2]

//Scripting Macros
#define CONST(var1,var2) var1 = compileFinal (if (var2 isEqualType "") then {var2} else {str(var2)})
#define CONSTVAR(var) var = compileFinal (if (var isEqualType "") then {var} else {str(var)})
#define FETCH_CONST(var) (call var)

//Display Macros
#define CONTROL(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define CONTROL_DATA(ctrl) (lbData[ctrl,lbCurSel ctrl])
#define CONTROL_DATAI(ctrl,index) ctrl lbData index

//System Macros
#define LICENSE_VALUE(varName) varName in LICENSES

//Condition Macros
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitWith { _res = true };} forEach _types;_res}

//Config Macros
#define FETCH_CONFIG(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define FETCH_CONFIG2(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define FETCH_CONFIG3(TYPE,CFG,SECTION,CLASS,ENTRY,SUB) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB)
#define FETCH_CONFIG4(TYPE,CFG,SECTION,CLASS,ENTRY,SUB,SUB2) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB >> SUB2)
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define BASE_CONFIG(CFG,CLASS) inheritsFrom(configFile >> CFG >> CLASS)
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)

//Crafting Macros
#define SEC_CHECK (life_istazed || life_isknocked || life_action_inUse || player getVariable ["restrained",false] || player getVariable ["playerSurrender",false])

//UI Macros
#define LIFEdisplay (uiNamespace getVariable ["playerHUD",displayNull])
#define LIFEctrl(ctrl) ((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl ctrl)

#define VEH_NAME(CLASS) if(CLASS isEqualType "") then {getText (configFile >> "CfgVehicles" >> CLASS >> "displayName")} else {getText (configFile >> "CfgVehicles" >> typeOf CLASS >> "displayName")};