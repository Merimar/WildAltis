class playerHUD {
idd = 44000;
duration = 10e10;
movingEnable = 0;
name = "playerHUD";
onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";

	class controlsBackground {};
	
	class controls {
		class Text_Date: Life_RscText {
			idc = 44001;
			text = "";
			font = "PuristaSemiBold";
			x = 0.893268 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.103492 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0.82,0.82,0.82,1};
		};

		class Text_Name: Life_RscText {
			idc = 44002;
			text = "";
			font = "PuristaSemiBold";
			x = 0.00323986 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.206983 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0.82,0.82,0.82,1};
		};
		
		class Bar_Durst: Raska_Life_RscProgress {
			idc = 44003;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			colorBar[] = {0.067,0.416,0.69,1};
			colorFrame[] = {0,0,0,0};
		};		
			
		class Bar_Hunger: Raska_Life_RscProgress {
			idc = 44004;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			colorBar[] = {0.282,0.717,0.282,1};
			colorFrame[] = {0,0,0,0};
		};

		class Bar_Leben: Raska_Life_RscProgress {
			idc = 44005;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			colorBar[] = {0.863,0.07,0.189,1};
			colorFrame[] = {0,0,0,0};
		};
		
		class Bar_Ausdauer: Raska_Life_RscProgress {
			idc = 44006;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			colorBar[] = {0.863,0.612,0.071,1};
			colorFrame[] = {0,0,0,0};
		};
		
		class Picture_Ausdauer: RscPicture {
			idc = -1;
			text = "Images\Dialog\Ausdauer.paa";
			x = 0.866094 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class Picture_Leben: RscPicture {
			idc = -1;
			text = "Images\Dialog\Leben.paa";
			x = 0.866094 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Picture_Hunger: RscPicture {
			idc = -1;
			text = "Images\Dialog\Hunger.paa";
			x = 0.866094 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class Picture_Durst: RscPicture {
			idc = -1;
			text = "Images\Dialog\Durst.paa";
			x = 0.866094 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class Text_Durst: Life_RscText {
			idc = 44007;
			text = "100";
			font = "PuristaMedium";
			colorText[] = {0.82,0.82,0.82,1};
			x = 0.87125 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class Text_Hunger: Life_RscText {
			idc = 44008;
			text = "100";
			font = "PuristaMedium";
			colorText[] = {0.82,0.82,0.82,1};
			x = 0.87125 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class Text_Leben: Life_RscText {
			idc = 44009;
			text = "100";
			font = "PuristaMedium";
			colorText[] = {0.82,0.82,0.82,1};
			x = 0.87125 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class Text_Ausdauer: Life_RscText {
			idc = 44010;
			text = "100";
			font = "PuristaMedium";
			colorText[] = {0.82,0.82,0.82,1};
			x = 0.87125 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};