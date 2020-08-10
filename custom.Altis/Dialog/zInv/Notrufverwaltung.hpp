class Notrufsystem {
	idd = 1100;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Notrufverwaltung";};		
		
		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			h = 0.638 * safezoneH;
		};

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Nachricht vom Spieler:";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.355781 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Informationen zum Notruf:";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Antworte dem Spieler:";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_Text {
			idc = -1;
			text = "Zeit:";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info5: Trans_Text {
			idc = -1;
			text = "Angenommen von:";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class List_Players: Trans_List {
			idc = 1101;
			onLBSelChanged = "[] spawn life_fnc_emergencyPlayerLBChange;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.55 * safezoneH;
		};

		class Combo_Presets: Trans_Combo {
			idc = 1102;
			onLBSelChanged = "[] spawn life_fnc_emergencyComboLBChange;";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_Search: Trans_Edit {
			idc = 1103;
			onKeyUp = "[1100, 1101, 1103, 'Notruf'] call life_fnc_searchFunction";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_Time: Trans_Edit {
			idc = 1104;
			colorBackground[] = {0,0,0,1};
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Edit_Bearbeiter: Trans_Edit {
			idc = 1105;
			colorBackground[] = {0,0,0,1};
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Edit_Message: Trans_MultiEdit {
			idc = 1106;
			colorBackground[] = {0,0,0,1};
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.121 * safezoneH;
		};

		class Map_Map: Life_RscMapControl {
			idc = 1107;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.286 * safezoneH;
		};

		class Control_Text: Life_RscControlsGroup {
			idc = -1;
            x = 0.4175 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.355781 * safezoneW;
			h = 0.209 * safezoneH;
            class HScrollbar: HScrollbar {height = 0;};
            class controls {
                class Text_Message: Trans_StructuredText {
                    idc = 1108;
                    text = "";
                    x = 0;
                    y = 0;
                    w = 0.355967 * safeZoneW;
                    h = 1.5;
                };
            };
        };
		
		class Text_Position: Trans_TextHeader {
			idc = 1109;
			text = "Position auf der Map:";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Btn_Update: Trans_Button {
			idc = 1110;
			text = "Aktualisieren";
			onButtonClick = "[] call life_fnc_openEmergencyMenu;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class Btn_SendMessage: Trans_Button {
			idc = 1111;
			text = "Nachricht senden";
			onButtonClick = "[] spawn life_fnc_emergencySendMessage;";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Annehmen: Blue_Button {
			idc = 1112;
			text = "Annehmen";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Btn_Remove: Blue_Button {
			idc = 1113;
			text = $STR_Delete;
			onButtonClick = "[] spawn life_fnc_emergencyRemove;";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};