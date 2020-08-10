class ZInv {
	idd = 4350;
	
	class controlsBackground {
		class Picture_Background: RscPicture {
			idc = -1;
			text = "Images\Dialog\player_inv.jpg";
			x = 0.215941 * safezoneW + safezoneX;
			y = 0.113221 * safezoneH + safezoneY;
			w = 0.566481 * safezoneW;
			h = 0.739284 * safezoneH;
		};
	};
	
	class controls {
		class List_Items: Trans_List {
			idc = 4351;
			colorBackground[] = {0,0,0,0.5};
			x = 0.373697 * safezoneW + safezoneX;
			y = 0.303074 * safezoneH + safezoneY;
			w = 0.167813 * safezoneW;
			h = 0.254074 * safezoneH;
		};

		class List_Lizenzen: Trans_List {
			idc = 4352;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.025;
			x = 0.217448 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.111041 * safezoneW;
			h = 0.0966668 * safezoneH;
		};

		class Combo_Players: Trans_Combo {
			idc = 4353;
			colorBackground[] = {0,0,0,0.5};
			x = 0.60026 * safezoneW + safezoneX;
			y = 0.490741 * safezoneH + safezoneY;
			w = 0.131875 * safezoneW;
			h = 0.0281481 * safezoneH;
		};

		class Edit_Amount: Trans_Edit {
			idc = 4354;
			text = "1";
			colorBackground[] = {0,0,0,1};
			x = 0.600989 * safezoneW + safezoneX;
			y = 0.529296 * safezoneH + safezoneY;
			w = 0.130833 * safezoneW;
			h = 0.0272221 * safezoneH;
		};

		class Text_Konto: Trans_Text {
			idc = 4355;
			text = "€100.000";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_Cash: Trans_Text {
			idc = 4356;
			text = "€100.000";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.611852 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_Gewicht: Trans_Text {
			idc = 4357;
			text = "0 / 24";
			x = 0.226042 * safezoneW + safezoneX;
			y = 0.671296 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Update: Trans_CloseButton {
			idc = 4358;
			onButtonClick = "[] spawn life_fnc_umgebungschecker;";
			x = 0.599479 * safezoneW + safezoneX;
			y = 0.436111 * safezoneH + safezoneY;
			w = 0.132396 * safezoneW;
			h = 0.0327778 * safezoneH;
		};

		class Btn_FAQ: Trans_CloseButton {
			idc = 4359;
			onButtonClick = "[] call life_fnc_openFAQ;";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.236926 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.0320741 * safezoneH;
		};

		class Btn_Bugreport: Trans_CloseButton {
			idc = 4360;
			onButtonClick = "[] call life_fnc_openBugtracker;";
			x = 0.226563 * safezoneW + safezoneX;
			y = 0.286111 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.0320741 * safezoneH;
		};

		class Btn_Farmrouten: Trans_CloseButton {
			idc = 4361;
			onButtonClick = "[] call life_fnc_openFarm;";
			x = 0.226041 * safezoneW + safezoneX;
			y = 0.336111 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.0320741 * safezoneH;
		};

		class Btn_Ausweis: Trans_CloseButton {
			idc = 4362;
			onButtonClick = "[] call life_fnc_showID;";
			x = 0.226562 * safezoneW + safezoneX;
			y = 0.386111 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.0320741 * safezoneH;
		};

		class Btn_Affiliate: Trans_CloseButton {
			idc = 4363;
			onButtonClick = "[] call life_fnc_openAffiliate;";
			x = 0.226041 * safezoneW + safezoneX;
			y = 0.433334 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.0320741 * safezoneH;
		};

		class Btn_Cellphone: Trans_CloseButton {
			idc = 4364;
			onButtonClick = "[] call life_fnc_openCellphone;";
			x = 0.350521 * safezoneW + safezoneX;
			y = 0.732407 * safezoneH + safezoneY;
			w = 0.0886458 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Key: Trans_CloseButton {
			idc = 4365;
			onButtonClick = "[] call life_fnc_openKeychain;";
			x = 0.449479 * safezoneW + safezoneX;
			y = 0.733333 * safezoneH + safezoneY;
			w = 0.0886458 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Settings: Trans_CloseButton {
			idc = 4366;
			onButtonClick = "[] call life_fnc_openSettings;";
			x = 0.548438 * safezoneW + safezoneX;
			y = 0.733334 * safezoneH + safezoneY;
			w = 0.0886458 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Gang: Trans_CloseButton {
			idc = 4367;
			onButtonClick = "[] call life_fnc_openGangDialog;";
			x = 0.35052 * safezoneW + safezoneX;
			y = 0.80463 * safezoneH + safezoneY;
			w = 0.0886458 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Skill: Trans_CloseButton {
			idc = 4368;
			onButtonClick = "[] call life_fnc_openSkills;";
			x = 0.448959 * safezoneW + safezoneX;
			y = 0.803704 * safezoneH + safezoneY;
			w = 0.0886458 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Markt: Trans_CloseButton {
			idc = 4369;
			onButtonClick = "[] call life_fnc_openMarkt;";
			x = 0.548437 * safezoneW + safezoneX;
			y = 0.803703 * safezoneH + safezoneY;
			w = 0.0886458 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_GiveMoney: Trans_CloseButton {
			idc = 4370;
			onButtonClick = "[] call life_fnc_giveMoney;";
			x = 0.586979 * safezoneW + safezoneX;
			y = 0.591667 * safezoneH + safezoneY;
			w = 0.0683334 * safezoneW;
			h = 0.0337037 * safezoneH;
		};

		class Btn_GiveItem: Trans_CloseButton {
			idc = 4371;
			onButtonClick = "[] call life_fnc_giveItem;";
			x = 0.67552 * safezoneW + safezoneX;
			y = 0.590741 * safezoneH + safezoneY;
			w = 0.0683334 * safezoneW;
			h = 0.0337037 * safezoneH;
		};

		class Btn_Use: Trans_CloseButton {
			idc = 4372;
			onButtonClick = "[] call life_fnc_useItem;";
			x = 0.377187 * safezoneW + safezoneX;
			y = 0.591926 * safezoneH + safezoneY;
			w = 0.0683334 * safezoneW;
			h = 0.0337037 * safezoneH;
		};

		class Btn_Remove: Trans_CloseButton {
			idc = 4373;
			onButtonClick = "[] call life_fnc_removeItem;";
			x = 0.465625 * safezoneW + safezoneX;
			y = 0.590741 * safezoneH + safezoneY;
			w = 0.0683334 * safezoneW;
			h = 0.0337037 * safezoneH;
		};

		class Btn_Cop1: Trans_Button {
			idc = 4374;
			x = 0.350208 * safezoneW + safezoneX;
			y = 0.768148 * safezoneH + safezoneY;
			w = 0.0886458 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Cop2: Trans_Button {
			idc = 4375;
			x = 0.449167 * safezoneW + safezoneX;
			y = 0.768741 * safezoneH + safezoneY;
			w = 0.0886458 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Cop3: Trans_Button {
			idc = 4376;
			x = 0.548646 * safezoneW + safezoneX;
			y = 0.768407 * safezoneH + safezoneY;
			w = 0.0886458 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Cop4: Trans_Button {
			idc = 4377;
			x = 0.670156 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0886458 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Cop5: Trans_Button {
			idc = 4378;
			x = 0.670156 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0886458 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Cop6: Trans_Button {
			idc = 4379;
			x = 0.670156 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0886458 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};