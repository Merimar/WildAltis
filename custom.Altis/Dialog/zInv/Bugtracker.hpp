class Bugtracker {
	idd = 4050;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Bugtracker";};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Wenn du einen Bug gefunden hast kannst du ihn uns hier mitteilen:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.556875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Spamnachrichten oder Trolls werden bestraft:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.556875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class Edit_Message: Trans_MultiEdit {
			idc = 4051;
			colorBackground[] = {0,0,0,1};
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.556875 * safezoneW;
			h = 0.55 * safezoneH;
		};

		class Btn_Send: Trans_Button {
			idc = 4052;
			text = "Bugreport abschicken";
			onButtonClick = "[] call life_fnc_sendBugreport;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.556875 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};