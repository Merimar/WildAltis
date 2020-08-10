class life_eventsetup_menu {
idd = 120000;
name = "life_eventsetup_menu";
movingEnable = false;
enableSimulation = false;

	class controlsBackground {
		class Text_Background: Life_RscText {
			idc = -1;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		
		class Text_Setup: Life_RscText {
			idc = -1;
			text = "Einstellungen"; 
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
		
		class Text_Header: Life_RscText {
			idc = -1;
			text = "WildAltis Event Einstellungen";
			font = "TahomaB";
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.5,0.5,-1,0.8};
		};
		
		class Text_Marker: Life_RscText {
			idc = -1;
			text = "Event Marker anschalten"; 
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0.5,0,0.5};
		};
	};
	
	class controls {
		class Btn_startEvent: Life_RscButtonMenu {
			idc = 120001;
			text = "Event Starten"; 
			onButtonClick = "[] call life_fnc_startEvent;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_endEvent: Life_RscButtonMenu {
			idc = 120002;
			text = "Event Beenden"; 
			onButtonClick = "[] call life_fnc_endEvent;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Edit_startMessage: Life_RscEdit {
			idc = 120003;
			text = "Ankündigungs Text hier eingeben";
			sizeEx = 0.035;
			lineSpacing = 1;
			style = 16;
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.11 * safezoneH;
		};
		
		class Edit_endMessage: Life_RscEdit {
			idc = 120004;
			text = "Beenden Text hier eingeben";
			sizeEx = 0.035;
			lineSpacing = 1;
			style = 16;
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.11 * safezoneH;
		};
		
		class Check_Marker: Life_Merimarbox {
			idc = 120005;
			sizeEx = 0.04;
			onCheckedChanged = "_s = if((_this select 1) isEqualTo 1) then { true } else { false }; bank_obj setVariable [""event_marker"", _s, true];";
			x = 0.43125 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0286458 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};