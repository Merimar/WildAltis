class FAQ {
	idd = 3950;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Frequently Asked Questions - FAQ";};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Eure meistgefragten Fragen:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Unsere Antwort:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Stellt eure eigenen Fragen:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class List_Questions: Trans_List {
			idc = 3951;
			onLBSelChanged = "[] call life_fnc_FAQLBChange;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.297 * safezoneH;
		};

		class Edit_Answer: Trans_MultiEdit {
			idc = 3952;
			colorBackground[] = {0,0,0,1};
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.121 * safezoneH;
		};

		class Edit_OwnQuestion: Trans_MultiEdit {
			idc = 3953;
			colorBackground[] = {0,0,0,1};
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.066 * safezoneH;
		};

		class Btn_Send: Trans_Button {
			idc = 3954;
			onButtonClick = "[] call life_fnc_sendFAQ;";
			text = "Frage stellen";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};