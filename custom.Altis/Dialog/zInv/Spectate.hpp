class CopSpectate {
	idd = 1350;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Polizei Spectate";};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Als Polizeileitung kannst du hier die Polizisten spectaten:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class List_Players: Trans_List {
			idc = 1351;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.528 * safezoneH;
		};

		class Btn_Spectate: Trans_Button {
			idc = 1352;
			text = "Spectaten";
			onButtonClick = "[] call life_fnc_copSpectate;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};