class Markt {
	idd = 1250;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Marktpreise";};
		
		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			h = 0.649 * safezoneH;
		};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Informationen um aktuellen Kurs:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Aktuelle Marktevents:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_Text {
			idc = -1;
			text = "Alter Verkaufspreis:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_Text {
			idc = -1;
			text = "Aktueller Verkaufspreis:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info5: Trans_Text {
			idc = -1;
			text = "Kurs:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info6: Trans_Text {
			idc = -1;
			text = "Marktevent Bonus von";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info7: Trans_Text {
			idc = -1;
			text = "Prozent";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Text_Info8: Trans_Text {
			idc = -1;
			text = "Läuft ab in";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class List_Items: Trans_List {
			idc = 1251;
			onLBSelChanged = "[] call life_fnc_marktLBChange;";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.605 * safezoneH;
		};

		class Image_Arrow: RscPicture {
			idc = 1252;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.088 * safezoneH;
		};

		class Edit_Old: Trans_Edit {
			idc = 1253;
			colorBackground[] = {0,0,0,1};
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Edit_New: Trans_Edit {
			idc = 1254;
			colorBackground[] = {0,0,0,1};
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Edit_Kurs: Trans_Edit {
			idc = 1255;
			colorBackground[] = {0,0,0,1};
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Edit_Event: Trans_MultiEdit {
			idc = 1256;
			colorBackground[] = {0,0,0,1};
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.11 * safezoneH;
		};

		class Edit_Bonus: Trans_Edit {
			idc = 1257;
			colorBackground[] = {0,0,0,1};
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Edit_Time: Trans_Edit {
			idc = 1262;
			text = "00:00 Minuten";
			colorBackground[] = {0,0,0,1};
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Btn_Update: Trans_Button {
			idc = 1258;
			text = "Marktpreise aktualisieren";
			onButtonClick = "[] call life_fnc_openMarkt";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Kurs: Blue_Button {
			idc = 1259;
			text = "Kurs Manuell setzen";
			onButtonClick = "[] spawn life_fnc_setFarmKurs";
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Btn_Start: Trans_Button {
			idc = 1260;
			text = "Marktevent auslösen";
			onButtonClick = "[] spawn life_fnc_triggerFarmEvent";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Stop: Trans_Button {
			idc = 1261;
			text = "Marktevent beenden";
			onButtonClick = "[] spawn life_fnc_endFarmEvent";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};