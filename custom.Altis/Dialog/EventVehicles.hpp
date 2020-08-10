class life_eventvehicle_menu {
idd = 140000;
name = "life_eventvehicle_menu";
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
		
		class Text_LandVehicles: Life_RscText {
			idc = -1;
			text = "Boden Fahrzeuge"; 
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.148958 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
		
		class Text_WaterVehicles: Life_RscText {
			idc = -1;
			text = "Wasser Fahrzeuge"; 
			x = 0.425521 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.148958 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
		
		class Text_Header: Life_RscText {
			idc = -1;
			text = "WildAltis Event Fahrzeuge";
			font = "TahomaB";
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.5,0.5,-1,0.8};
		};
		
		class Text_AirVehicles: Life_RscText {
			idc = -1;
			text = "Luft Fahrzeuge"; 
			x = 0.580208 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.148958 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
	};
	
	class controls {
		class Btn_spawnVehicle: Life_RscButtonMenu {
			idc = 140001;
			text = "Fahrzeug spawnen";
			onButtonClick = "[] call life_fnc_spawnVehicleMod;";
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.148958 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		class List_lList: Life_RscListbox {
			idc = 140002;
			font = "PuristaMedium";
			onMouseButtonClick = "player setVariable [""Event_Vehicle"", 1, true];";
			sizeEx = 0.035;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.148958 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class List_wList: Life_RscListbox {
			idc = 140003;
			font = "PuristaMedium";
			onMouseButtonClick = "player setVariable [""Event_Vehicle"", 2, true];";
			sizeEx = 0.035;
			x = 0.425521 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.148958 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class List_aList: Life_RscListbox {
			idc = 140004;
			font = "PuristaMedium";
			onMouseButtonClick = "player setVariable [""Event_Vehicle"", 3, true];";
			sizeEx = 0.035;
			x = 0.580208 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.148958 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
};