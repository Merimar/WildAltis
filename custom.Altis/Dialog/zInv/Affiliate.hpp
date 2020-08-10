class Affiliate {
	idd = 1050;
	
	class controlsBackground {
		class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Affiliate";};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Diese Spieler haben deinen Code eingegeben:";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.541406 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Erstell hier deinen eigenen Code:";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.541406 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class List_Units: Trans_List {
			idc = 1051;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.541406 * safezoneW;
			h = 0.44 * safezoneH;
		};

		class Edit_Code: Trans_Edit {
			idc = 1052;
			tooltip = "Gib diesen Code anderen Leute, oder löse Ihre Codes hier ein";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Create: Blue_Button {
			idc = 1053;
			text = "Generieren";
			tooltip = "Generiere einen Affiliate Code";
			onButtonClick = "[] call life_fnc_getAffiliate;";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Send: Trans_Button {
			idc = 1054;
			text = "Code einloesen";
			onButtonClick = "[] call life_fnc_checkAffiliate;";
			tooltip = "Löse einen Affiliate Code von anderen Leuten ein";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};