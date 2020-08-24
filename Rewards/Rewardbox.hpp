class Rewardbox {
	idd = 1550;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Reward - Box";};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Hier findest du eine Übersicht über alle deine aktiven Belohnunen:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class List_Rewards: Trans_List {
			idc = 1551;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.583 * safezoneH;
		};
		
		class Btn_Action: Trans_Button {
			idc = 1552;
			onButtonClick = "[] spawn life_fnc_rewardActivate;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.033 * safezoneH;
		};		
	};
};