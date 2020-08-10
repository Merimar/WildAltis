class life_scrollrad_menu {
idd = 110000;
name = "life_scrollrad_menu";
movingEnable = false;
enableSimulation = false;

	class controlsBackground {
		class Text_Background: Life_RscText {
			idc = -1;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		
		class Text_Scrollrad: Life_RscText {
			idc = -1;
			text = "Scrollrad"; 
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
		
		class Text_Header: Life_RscText {
			idc = -1;
			text = "WildAltis Scrollrad Menu";
			font = "TahomaB";
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.5,0.5,-1,0.8};
		};
		
		class Text_Strip: Life_RscText {
			idc = -1;
			text = "Spieler Inventar clearen ?"; 
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0.5,0,0.5};
		};
	};
	
	class controls {
		class Btn_Enable: Life_RscButtonMenu {
			idc = 110001;
			text = "Anschalten";
			onButtonClick = "[] call life_fnc_enableScrollrad;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		class Btn_Disable: Life_RscButtonMenu {
			idc = 110002;
			text = "Ausschalten"; 
			onButtonClick = "[] call life_fnc_disableScrollrad;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};	
		
		class Btn_Save: Life_RscButtonMenu {
			idc = 110003;
			text = "Speichern"; 
			onButtonClick = "[] call life_fnc_setMessage;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_setPosition: Life_RscButtonMenu {
			idc = 110004;
			text = "Teleport Position festlegen"; 
			onButtonClick = "[] call life_fnc_setScrollPosition;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};

		class Edit_Message: Life_RscEdit {
			idc = 110005;
			text = "Scrollrad Text";
			sizeEx = 0.035;
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class Check_Strip: Life_Merimarbox {
			idc = 110006;
			sizeEx = 0.04;
			x = 0.288021 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0286458 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};