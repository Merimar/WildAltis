class Admin {
	idd = 3800;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Admin Menu";};
		
		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			h = 0.66 * safezoneH;
		};

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Admin Level 2 Funktionen:";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Admin Level 3 Funktionen:";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Admin Level 4 Funktionen:";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_TextHeader {
			idc = -1;
			text = "Admin Level 5 Funktionen:";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class List_Players: Trans_List {
			idc = 3801;
			tooltip = "Doppelklick auf einen Spieler zum spectaten";
			onMouseButtonDblClick = "[] call life_fnc_adminSpectate;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.605 * safezoneH;
		};

		class Edit_Search: Trans_Edit {
			idc = 3802;
			onKeyUp = "[3800, 3801, 3802, 'Admin'] call life_fnc_searchFunction";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_Money: Trans_Edit {
			idc = 3803;
			tex = "0";
			colorBackground[] = {0,0,0,1};
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Combo_Backup: Trans_Combo {
			idc = 3804;
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Informationen: Trans_Button {
			idc = 3805;
			text = "Spieler Informationen";
			onButtonClick = "[] call life_fnc_adminInfo;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Supporter: Trans_Button {
			idc = 3806;
			text = "Supporter im Dienst AN / AUS";
			onButtonClick = "[] call life_fnc_adminSupporter;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Invisible: Trans_Button {
			idc = 3807;
			text = "Unsichtbar AN / AUS";
			onButtonClick = "[] call life_fnc_adminInvisible;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Btn_Teleport: Trans_Button {
			idc = 3808;
			text = "Zu Spieler Teleportieren";
			onButtonClick = "[] call life_fnc_adminTeleport;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_SupportRufen: Trans_Button {
			idc = 3809;
			text = "Spieler in den Support rufen";
			onButtonClick = "[] call life_fnc_adminTellSupport;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Freeze: Trans_Button {
			idc = 3810;
			text = "Spieler Einfrieren";
			onButtonClick = "[] call life_fnc_adminFreeze;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Money: Trans_Button {
			idc = 3811;
			text = "Spieler Geld geben";
			onButtonClick = "[] call life_fnc_adminMoney;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Backup: Trans_Button {
			idc = 3812;
			text = "Server Backup laden";
			onButtonClick = "[] call life_fnc_adminBackup;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};