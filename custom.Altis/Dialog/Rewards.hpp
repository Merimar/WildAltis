class Rewards {
	idd = 1500;
	
	class controlsBackground {
		class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Belohnung - Manager";};

		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.452551 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.00515754 * safezoneW;
			h = 0.66 * safezoneH;
		};

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Alle verfügbaren Belohnungen";
			x = 0.221493 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.221774 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Dein aktueller Fortschritt:";
			x = 0.469055 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.304295 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du sehen wie lange in Folge du online warst:";
			x = 0.469055 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.304295 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du alle Informationen zu einer Belohnung sehen:";
			x = 0.469055 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.304295 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info5: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du deine Belohnung einfordern:";
			x = 0.469055 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.304295 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Beauty1: Trans_TextHeader {
			idc = -1;
			x = 0.469055 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.123781 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.5, 0.3, 0.5, 0.3};
		};

		class Text_Beauty2: Trans_TextHeader {
			idc = -1;
			x = 0.654726 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.118623 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.5, 0.3, 0.5, 0.3};
		};
	};
	
	class controls {
		class List_Rewards: Trans_List {
			idc = 1501;
			onLBSelChanged = "[] call life_fnc_rewardLBChange;";
			x = 0.221493 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.221774 * safezoneW;
			h = 0.627 * safezoneH;
		};

		class Progress_Bar: RscProgress {
			idc = 1502;
			x = 0.469055 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.304295 * safezoneW;
			h = 0.044 * safezoneH;
			colorFrame[] = {0, 0, 0, 1};
		};

		class Text_Counter: Trans_TextHeader {
			idc = 1503;
			x = 0.597993 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_Description: Trans_StructuredText {
			idc = 1504;
			x = 0.469055 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.304295 * safezoneW;
			h = 0.352 * safezoneH;
		};

		class Btn_Claim: Trans_Button {
			idc = 1505;
			text = "Belohnung einfordern";
			onButtonClick = "[] spawn life_fnc_claimReward;";
			x = 0.469055 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.304295 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};