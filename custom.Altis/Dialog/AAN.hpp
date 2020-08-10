class AAN {
	idd = 3700;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "AAN News";};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Gebe hier deinen Titel für die Nachricht ein:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.556875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Gebe hier deine Nachricht ein (Eine AAN News Nachricht kostet dich 100.000):";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.556875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class Edit_Titel: Trans_Edit {
			idc = 3701;
			colorBackground[] = {0,0,0,1};
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.556875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_Message: Trans_MultiEdit {
			idc = 3702;
			colorBackground[] = {0,0,0,1};
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.556875 * safezoneW;
			h = 0.473 * safezoneH;
		};

		class Btn_Send: Trans_Button {
			idc = 3703;
			text = "AAN News Nachricht abschicken";
			onButtonClick = "[] spawn life_fnc_sendAAN;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.556875 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
