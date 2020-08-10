class Itemshop {
	idd = 5050;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {idc = 5059; text = "Markt";};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "LADEN INVENTAR";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "DEIN INVENTAR";
			x = 0.555 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.497916 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			h = 0.528 * safezoneH;
		};

		class Text_SiderH1: RscSiderHorizontal {
			idc = -1;
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.5225 * safezoneW;
		};
	};
	
	class controls {	
		class List_Shop: Trans_List {
			idc = 5051;
			onMouseButtonDblClick = "[true] call life_fnc_virt_buy;";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.207209 * safezoneW;
			h = 0.473 * safezoneH;
		};

		class List_Player: Trans_List {
			idc = 5052;
			onMouseButtonDblClick = "[true] call life_fnc_virt_sell;";
			x = 0.554041 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.207209 * safezoneW;
			h = 0.473 * safezoneH;
		};

		class Edit_Shop: Trans_Edit {
			idc = 5053;
			text = "1";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Edit_Player: Trans_Edit {
			idc = 5054;
			text = "1";
			x = 0.555 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Btn_Buy: Trans_Button {
			idc = 5055;
			text = "Kaufen";
			onButtonClick = "[false] spawn life_fnc_virt_buy;";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.075625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Btn_Buy10: Trans_Button {
			idc = 5056;
			text = "10 x Kaufen";
			onButtonClick = "[true] spawn life_fnc_virt_buy;";
			x = 0.369375 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.075625 * safezoneW;
			h =	0.022 * safezoneH;
		};

		class Btn_Sell: Trans_Button {
			idc = 5057;
			text = "Verkaufen";
			onButtonClick = "[false] call life_fnc_virt_sell;";
			x = 0.555 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.075625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Btn_SellAll: Trans_Button {
			idc = 5058;
			text = "Alles Verkaufen";
			onButtonClick = "[true] call life_fnc_virt_sell;";
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.075625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};