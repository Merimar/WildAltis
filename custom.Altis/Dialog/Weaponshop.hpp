class Weaponshop {
	idd = 5000;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {idc = 5008; text = "Waffenshop";};
		
		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.319939 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			h = 0.099 * safezoneH;
		};		

		class Text_Info1: Trans_Text{
			idc = -1;
			text = "Menge:";
			x = 0.592093 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Optionen";
			x = 0.223721 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.548721 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Waffenliste";
			x = 0.223721 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.548721 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info4: Trans_Text {
			idc = -1;
			text = "Filter:";
			x = 0.592093 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
	class controls {
		class List_Weapons: Trans_List {
			idc = 5001;
			onLBSelChanged = "[] call life_fnc_weaponShopLBChange;";
			colorBackground[] = {0,0,0,0};
			x = 0.223721 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.548721 * safezoneW;
			h = 0.385 * safezoneH;
		};

		class Combo_Filter: Trans_Combo {
			idc = 5002;
			onLBSelChanged = "[] call life_fnc_weaponShopLBFilter;";
			sizeEx = 0.04;
			x = 0.63814 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.134302 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Combo_Amount: Trans_Combo {
			idc = 5003;
			sizeEx = 0.04;			
			x = 0.63814 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.134302 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Text_Preis: Trans_StructuredText {
			idc = 5004;
			text = "Preis:";
			colorBackground[] = {0,0,0,0};
			x = 0.335 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.103605 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Text_Geld: Trans_StructuredText {
			idc = 5005;
			text = "Geld:";
			colorBackground[] = {0,0,0,0};
			x = 0.450116 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.103605 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Picture_Icon: RscPicture {
			idc = 5006;
			x = 0.227558 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0805814 * safezoneW;
			h = 0.099 * safezoneH;
		};
		class Btn_Buy: Trans_Button {
			idc = 5007;
			text = "Kaufen";
			onButtonClick = "[] spawn life_fnc_weaponShopBuy;";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.218721 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};	
};