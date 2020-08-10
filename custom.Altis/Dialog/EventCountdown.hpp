class life_eventcountdown_menu {
idd = 160000;
name = "life_eventcountdown_menu";
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
		
		class Text_Countdown: Life_RscText {
			idc = -1;
			text = "Countdown"; 
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.263542 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
			
		class Text_Header: Life_RscText {
			idc = -1;
			text = "WildAltis Countdown";
			font = "TahomaB";
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.5,0.5,-1,0.8};
		};
		
		class Text_Info: Life_RscStructuredText {
			idc = -1;
			text = "Der Event Countdown startet bei Event Beginn !"; 
			x = 0.402604 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.131771 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {1,0.5,-1,0.6};
		};
		
		class Text_Enable: Life_RscText {
			idc = -1;
			text = "Countdown bei Start aktivieren ?"; 
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.160417 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0.5,-1,0.6};
		};
	};
	
	class controls {
		class Btn_setPosition: Life_RscButtonMenu {
			idc = 160001;
			text = "Countdown Position setzen"; 
			onButtonClick = "[] call life_fnc_setCountdownPosition;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.160417 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class Check_Enable: Life_Merimarbox {
			idc = 160002;
			sizeEx = 0.04;
			onCheckedChanged = "[_this select 1] call life_fnc_switchCountdown;";
			x = 0.465625 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0286458 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};