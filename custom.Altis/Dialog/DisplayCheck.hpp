class life_display_check {
idd = 108000;
name= "life_display_check";
movingEnable = 0;
enableSimulation = 1;

	class controlsBackground {
		class Hintergrund: Life_RscText {
			idc = -1;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
	};
	
	class controls {
		class List_Hacks: Life_RscListbox {
			idc = 108001;
			font = "PuristaMedium";
			sizeEx = 0.035;
			onLBSelChanged = "[] call life_fnc_showHacks;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};

		class Text_Hacks: Life_RscStructuredText {
			idc = 108002;
			x = 0.505729 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.211979 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
};




