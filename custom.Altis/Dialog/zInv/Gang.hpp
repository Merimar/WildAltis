class GangCreate {
	idd = 4150;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Gangsystem - Gang erstellen";};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Eine Gang zu erstellen kostet €100.000";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class Edit_Gang: Trans_Edit {
			idc = 4151;
			text = "Gangnamen hier eingeben";
			colorBackground[] = {0,0,0,1};
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Btn_Create: Trans_Button {
			idc = 4152;
			text = "Gang erstellen";
			onButtonClick = "[] spawn life_fnc_gangCreate;";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};

class Gang {
	idd = 4200;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Button_Close: Trans_CloseButton {};
		class Text_Title: Trans_Header {text = "Gangsystem - Gang verwalten";};

		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			h = 0.286 * safezoneH;
		};

		class Text_SiderV2: RscSiderVertical {
			idc = -1;
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			h = 0.286 * safezoneH;
		};

		class Text_SiderH1: RscSiderHorizontal {
			idc = -1;
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
		};

		class Text_SiderH2: RscSiderHorizontal {
			idc = -1;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
		};

		class Text_SiderH3: RscSiderHorizontal {
			idc = -1;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
		};
				
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Auflistung aller Gangmitglieder:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.556875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Ganginformationen:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Gangeinstellungen:";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_Text {
			idc = -1;
			text = "Gruppenname:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_Info5: Trans_Text {
			idc = -1;
			text = "Gruppenanführer:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_Info6: Trans_Text {
			idc = -1;
			text = "Gruppenkonto:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_Info7: Trans_Text {
			idc = -1;
			text = "Gruppenrang:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_Info8: Trans_Text {
			idc = -1;
			text = "Max. Gruppenmitglieder:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_Info9: Trans_Text {
			idc = -1;
			text = "Aktuell online:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
	
	class controls {
		class List_Players: Trans_List {
			idc = 4201;
			onMouseButtonDblClick = "_this spawn life_fnc_gangDBClick;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.556875 * safezoneW;
			h = 0.286 * safezoneH;
		};

		class Combo_Promote: Trans_Combo {
			idc = 4202;
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_Name: Trans_Edit {
			idc = 4203;
			colorBackground[] = {0,0,0,1};
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_Leader: Trans_Edit {
			idc = 4204;
			colorBackground[] = {0,0,0,1};
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_Konto: Trans_Edit {
			idc = 4205;
			colorBackground[] = {0,0,0,1};
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_Rang: Trans_Edit {
			idc = 4206;
			colorBackground[] = {0,0,0,1};
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_Max: Trans_Edit {
			idc = 4207;
			colorBackground[] = {0,0,0,1};
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_Online: Trans_Edit {
			idc = 4208;
			colorBackground[] = {0,0,0,1};
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Offline: Blue_Button {
			idc = 4209;
			text = "Offline Spieler";
			onButtonClick = "[] call life_fnc_gangOffline;";
			x = 0.654687 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Btn_Invite: Trans_Button {
			idc = 4210;
			text = "Spieler einladen";
			onButtonClick = "[] spawn life_fnc_gangInvite;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Kick: Trans_Button {
			idc = 4211;
			text = "Spieler kicken";
			onButtonClick = "[] spawn life_fnc_gangKick;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Promote: Trans_Button {
			idc = 4212;
			text = "Spieler befördern";
			onButtonClick = "[] spawn life_fnc_gangPromote;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Upgrade: Trans_Button {
			idc = 4213;
			text = "Gang upgraden";
			onButtonClick = "[] spawn life_fnc_gangUpgrade;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Haus: Trans_Button {
			idc = 4214;
			text = "Gang Haus";
			onButtonClick = "[] call life_fnc_openGangHouse;";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Buffs: Trans_Button {
			idc = 4215;
			text = "Gang Buffs";
			onButtonClick = "[] call life_fnc_openGangBuff;";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Leave: Trans_Button {
			idc = 4216;
			text = "Gang verlassen";
			onButtonClick = "[] spawn life_fnc_gangLeave;";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Disband: Trans_Button {
			idc = 4217;
			text = "Gang auflösen";
			onButtonClick = "[] spawn life_fnc_gangDisband;";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};

class GangBuffs {
	idd = 4250;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Button_Close: Trans_CloseButton {};
		class Text_Title: Trans_Header {text = "Gangsystem - Gang Buffs";};
		
		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			h = 0.66 * safezoneH;
		};		
	};
	
	class controls {
		class List_GangBuffs: Trans_List {
			idc = 4251;
			colorBackground[] = {0,0,0,0};
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.583 * safezoneH;
		};

		class List_ActiveBuffs: Trans_List {
			idc = 4252;
			colorBackground[] = {0,0,0,0};
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.583 * safezoneH;
		};

		class Text_GangBuffs: Trans_Text {
			idc = 4253;
			text = "";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_ActiveBuffs: Trans_Text {
			idc = 4254;
			text = "";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Btn_Activate: Trans_Button {
			idc = 4255;
			text = "Buff aktivieren";
			onButtonClick = "[] call life_fnc_activateBuff;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};

class GangHaus {
	idd = 4300;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Button_Close: Trans_CloseButton {};
		class Text_Title: Trans_Header {text = "Gangsystem - Gang Haus";};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Hier befindet sich euer Ganghaus:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Hier könnt ihr euer Ganghaus upgraden:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_Text {
			idc = -1;
			text = "Gang Markt:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_Info4: Trans_Text {
			idc = -1;
			text = "Gang ATM:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_Info5: Trans_Text {
			idc = -1;
			text = "Gang Garage:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_Info6: Trans_Text {
			idc = -1;
			text = "Gang Generalstore:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
	
	class controls {
		class Map_Haus: Life_RscMapControl {
			idc = 4301;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.352 * safezoneH;
		};

		class Edit_Markt: Trans_Edit {
			idc = 4302;
			colorBackground[] = {0,0,0,1};
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_ATM: Trans_Edit {
			idc = 4303;
			colorBackground[] = {0,0,0,1};
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_Garage: Trans_Edit {
			idc = 4304;
			colorBackground[] = {0,0,0,1};
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_Generalstore: Trans_Edit {
			idc = 4305;
			colorBackground[] = {0,0,0,1};
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_BuyMarkt: Trans_Button {
			idc = 4306;
			text = "Kaufen";
			onButtonClick = "['markt'] spawn life_fnc_gangBuyUpgrade;";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_BuyATM: Trans_Button {
			idc = 4307;
			text = "Kaufen";
			onButtonClick = "['atm'] spawn life_fnc_gangBuyUpgrade;";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_BuyGarage: Trans_Button {
			idc = 4308;
			text = "Kaufen";
			onButtonClick = "['garage'] spawn life_fnc_gangBuyUpgrade;";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_BuyGeneralstore: Trans_Button {
			idc = 4309;
			text = "Kaufen";
			onButtonClick = "['generalstore'] spawn life_fnc_gangBuyUpgrade;";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};