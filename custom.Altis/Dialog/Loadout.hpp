class Loadout {
	idd = 3750;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Loadout";};
		
		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.447407 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			h = 0.649 * safezoneH;
		};

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Informationen über das Loadout";
			x = 0.458751 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du dein Loadout laden und speichern";
			x = 0.458751 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class List_Loadouts: Trans_List {
			idc = 3751;
			onLBSelChanged = "_this call life_fnc_loadoutLBChange;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.649 * safezoneH;
		};

		class Text_LoadoutInfo: Trans_StructuredText {
			idc = 3752;
			x = 0.458751 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.418 * safezoneH;
		};

		class Btn_Save: Trans_Button {
			idc = 3753;
			text = "Loadout speichern";
			onButtonClick = "[] spawn life_fnc_saveLoadout";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Load: Trans_Button {
			idc = 3754;
			text = "Loadout kaufen";
			onButtonClick = "[] spawn life_fnc_getLoadout";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};