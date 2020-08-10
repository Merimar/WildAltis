class ChopShop {
	idd = 39400;
	
	class controlsBackground {
		class Picture_Background: RscPicture {
			idc = -1;
			text = "Images\Dialog\Interaction.jpg";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.44 * safezoneH;
		};

		class Text_Info1: Trans_StructuredText {
			idc = -1;
			text = "Fahrzeuge:";
			colorBackground[] = {0,0,0,0};
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				font = "PuristaMedium";
				color = "#FFFFFF";
				align = "center";
			};
		};	
	};
	
	class controls {
		class List_Vehicles: Trans_List {
			idc = 39401;
			sizeEx = 0.04;
			onLBSelChanged = "_this call life_fnc_chopShopSelection";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.253 * safezoneH;
		};

		class Text_Price: Trans_StructuredText {
			idc = 39402;
			text = "Preis: 0";
			colorBackground[] = {0,0,0,0};
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				font = "PuristaMedium";
				color = "#FFFFFF";
				align = "left";
			};
		};

		class Btn_Sell: Trans_Button {
			idc = 39403;
			text = "Verkaufen";
			onButtonclick = "[] spawn life_fnc_chopShopSell";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};