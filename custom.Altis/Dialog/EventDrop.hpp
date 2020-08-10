class life_eventdrop_menu {
idd = 170000;
name = "life_eventdrop_menu";
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
		
		class Text_ItemDrop: Life_RscText {
			idc = -1;
			text = "Items Dropen";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.183333 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
		
		class Text_Header: Life_RscText {
			idc = -1;
			text = "WildAltis Item Drop Menu";
			font = "TahomaB";
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.5,0.5,-1,0.8};
		};
		
		class Text_Amount: Life_RscText {
			idc = -1;
			text = "Anzahl:";
			x = 0.488542 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0.5,-1,0.6};
		};
	};
	
	class controls {
		class Btn_dropItems: Life_RscButtonMenu {
			idc = 170001;
			text = "Items Dropen";
			onButtonClick = "[] call life_fnc_dropItemMod;";
			x = 0.488542 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.160417 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class List_Items: Life_RscListbox {
			idc = 170002;
			font = "PuristaMedium";
			sizeEx = 0.035;
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.183333 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		
		class Edit_Amount: Life_RscEdit {
			idc = 170003;
			text = "10";
			sizeEx = 0.035;
			x = 0.557292 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};