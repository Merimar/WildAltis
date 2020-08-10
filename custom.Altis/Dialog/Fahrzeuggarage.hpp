class Garage {
	idd = 2800;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {idc = 2806; text = "Garage";};

		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.493125 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			h = 0.484 * safezoneH;
		};

		class Text_SiderV2: RscSiderVertical {
			idc = -1;
			x = 0.493125 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			h = 0.033 * safezoneH;
		};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Deine Fahrzeuge:";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.23375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Fahrzueginformationen:";
			x = 0.518125 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.23375 * safezoneW;
			h = 0.022 * safezoneH;
		};	
		
		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du deine Fahrzeuge verwalten:";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

class controls {
	
		class List_Vehicles: Trans_List {
			idc = 2801;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0};
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.23375 * safezoneW;
			h = 0.451 * safezoneH;
		};	

		class Text_Info: Trans_StructuredText {
			idc = 2802;
			colorBackground[] = {0,0,0,0};
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.23375 * safezoneW;
			h = 0.451 * safezoneH;
		};	

		class Btn_Unimpound: Trans_Button {
			idc = 2803;
			text = "Ausparken";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.11 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Sell: Trans_Button {
			idc = 2804;
			text = "Verkaufen";
			onButtonClick = "[] spawn life_fnc_sellGarage;";
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.11 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Update: Trans_Button {
			idc = 2805;
			text = "Aktualisieren";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.23375 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};