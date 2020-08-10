class life_eventmessage_menu {
idd = 130000;
name = "life_eventmessage_menu";
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
		
		class Text_Message: Life_RscText {
			idc = -1;
			text = "Nachricht";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
		
		class Text_Header: Life_RscText {
			idc = -1;
			text = "WildAltis Event Nachricht"; 
			font = "TahomaB";
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.5,0.5,-1,0.8};
		};
		
		class Text_Repeat: Life_RscText {
			idc = -1;
			text = "Event Nachricht wiederholen ?"; 
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0.5,0,0.4};
		};
	};
	
	class controls {
		class Btn_saveMessage: Life_RscButtonMenu {
			idc = 130001;
			text = "Nachricht speichern"; 
			onButtonClick = "[] call life_fnc_saveMessageMod;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_simpleMessage: Life_RscButtonMenu {
			idc = 130002;
			text = "Nachricht senden";
			onButtonClick = "[] call life_fnc_simpleMessage;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Start: Life_RscButtonMenu {
			idc = 130003;
			text = "Nachricht alle x Minuten senden";
			onButtonClick = "[] spawn life_fnc_repeatMessage;";
			x = 0.373958 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.183333 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Stop: Life_RscButtonMenu {
			idc = 130004;
			text = "Stop";
			onButtonClick = "[] call life_fnc_repeatMessageStop;";
			x = 0.373958 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Edit_startMessage: Life_RscEdit {
			idc = 130005;
			text = "Event Nachricht hier reinschreiben";
			sizeEx = 0.035;
			lineSpacing = 1;
			style = 16;
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.11 * safezoneH;
		};
		
		class Edit_Time: Life_RscEdit {
			idc = 130006;
			text = "5";
			sizeEx = 0.035;
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};