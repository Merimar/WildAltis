class life_mod_menu {
idd = 100000;
name = "life_mod_menu";
movingEnable = false;
enableSimulation = false;

	class controlsBackground {
		class Text_Background: Life_RscText {
			idc = -1;
			x = 0.0588542 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.888021 * safezoneW;
			h = 0.693 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		
		class Text_Header: Life_RscText {
			idc = -1;
			text = "WildAltis Event Tool";
			font = "TahomaB";
			x = 0.0588542 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.888021 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0.5,0.5,-1,0.8};
		};
		
		class Text_PlayerActions: Life_RscText {
			idc = -1;
			text = "Player Actions"; 
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
		
		class Text_EventActions: Life_RscText {
			idc = -1;
			text = "Event Actions"; 
			x = 0.436979 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
		
		class Text_VehicleActions: Life_RscText {
			idc = -1;
			text = "Vehicle Actions"; 
			x = 0.591667 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
		
		class Text_MenuActions: Life_RscText {
			idc = -1;
			text = "Tool Einstellungen"; 
			x = 0.591667 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};

		class Text_pList: Life_RscText {
			idc = -1;
			text = "Spieler Liste"; 
			x = 0.740625 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.194792 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
		
		class Text_tList: Life_RscText {
			idc = -1;
			text = "Team Liste";
			x = 0.0645833 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.194792 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
	};
	
	class controls {
		class Btn_TeleportMap: Life_RscButtonMenu {
			idc = 100001;
			text = "Map Teleport"; 
			onButtonClick = "[] spawn life_fnc_mapTeleport;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};

		class Btn_TpTo: Life_RscButtonMenu {
			idc = 100002;
			text = "TP To Player";
			onButtonClick = "[] call life_fnc_TpTo;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_TpHere: Life_RscButtonMenu {
			idc = 100003;
			text = "TP Here Player";
			onButtonClick = "[] call life_fnc_TpHere;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Heal: Life_RscButtonMenu {
			idc = 100004;
			text = "Heal Player"; 
			onButtonClick = "[] call life_fnc_healPlayerMod;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Kill: Life_RscButtonMenu {
			idc = 100005;
			text = "Kill Player"; 
			onButtonClick = "[] call life_fnc_killPlayerMod;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Strip: Life_RscButtonMenu {
			idc = 100006;
			text = "Strip Player"; 
			onButtonClick = "[] call life_fnc_stripPlayerMod;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Godmode: Life_RscButtonMenu {
			idc = 100007;
			text = "God Mode (Selbst)"; 
			onButtonClick = "[] call life_fnc_godMode;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Safezone: Life_RscButtonMenu {
			idc = 100008;
			text = "Event Safezone"; 
			onButtonClick = "[] spawn life_fnc_eventSafezone;";
			x = 0.436979 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Scrollrad: Life_RscButtonMenu {
			idc = 100009;
			text = "Event Scrollrad";
			onButtonClick = "createDialog ""life_scrollrad_menu""";
			x = 0.436979 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Setup: Life_RscButtonMenu {
			idc = 100010;
			text = "Event Einstellungen";
			onButtonClick = "[] call life_fnc_openSetup;";
			x = 0.436979 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Message: Life_RscButtonMenu {
			idc = 100011;
			text = "Event Nachricht";
			onButtonClick = "createDialog ""life_eventmessage_menu""";
			x = 0.436979 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Vehicle: Life_RscButtonMenu {
			idc = 100012;
			text = "Event Fahrzeuge";
			onButtonClick = "[] call life_fnc_openVehicleMod;";
			x = 0.436979 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Gear: Life_RscButtonMenu {
			idc = 100013;
			text = "Event Gear";
			onButtonClick = "[] call life_fnc_openGearMenu;";
			x = 0.436979 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Countdown: Life_RscButtonMenu {
			idc = 100014;
			text = "Event Countdown";
			onButtonClick = "[] call life_fnc_openCountdownMenu;";
			x = 0.436979 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Impound: Life_RscButtonMenu {
			idc = 100015;
			text = "Fahrzeuge in der Nähe einparken (10m)"; 
			onButtonClick = "[] call life_fnc_impoundRadius;";
			x = 0.591667 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_pActionControll: Life_RscButtonMenu {
			idc = 100016;
			text = "Player Action freigeben";
			onButtonClick = "[1] call life_fnc_controlSection;";
			x = 0.591667 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0.1,-1,0.8};
		};
		
		class Btn_eActionControll: Life_RscButtonMenu {
			idc = 100017;
			text = "Event Action freigeben"; 
			onButtonClick = "[2] call life_fnc_controlSection;";
			x = 0.591667 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0.1,-1,0.8};
		};
		
		class Btn_vActionControll: Life_RscButtonMenu {
			idc = 100018;
			text = "Vehicle Action freigeben"; 
			onButtonClick = "[3] call life_fnc_controlSection;";
			x = 0.591667 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0.1,-1,0.8};
		};
		
		class Btn_WhitelistPlayer: Life_RscButtonMenu {
			idc = 100019;
			text = "Spieler freischalten";
			onButtonClick = "[] call life_fnc_listPlayerMod;";
			x = 0.591667 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0,1,0.5};
		};
		
		class Btn_ecActionControll: Life_RscButtonMenu {
			idc = 100020;
			text = "Event Control freigeben";
			onButtonClick = "[4] call life_fnc_controlSection;";
			x = 0.591667 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0.1,-1,0.8};
		};
		
		class Btn_Close: Life_RscButtonMenu {
			idc = -1;
			text = "Schließen"; 
			onButtonClick = "closeDialog 0;";
			x = 0.0588542 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0859375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class List_Player: Life_RscListbox {
			idc = 100021;
			font = "PuristaMedium";
			sizeEx = 0.035;
			onMouseButtonClick = "player setVariable [""List"", false, true];";
			x = 0.740625 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.194792 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class List_Team: Life_RscListbox {
			idc = 100022;
			font = "PuristaMedium";
			sizeEx = 0.035;
			onMouseButtonClick = "player setVariable [""List"", true, true];";
			x = 0.0645833 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.194792 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
};