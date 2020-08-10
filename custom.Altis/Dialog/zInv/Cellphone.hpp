class Cellphone {
    idd = 1000;

    class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Nachrichtensystem";};

		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.426781 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			h = 0.187 * safezoneH;
		};

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du nach einem Spieler suchen:";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.546562 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Hier findest du alle Nachrichten die dir bereits geschickt worden sind:";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.546562 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Empfänger auswählen:";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_TextHeader {
			idc = -1;
			text = "Gebe hier deine Nachricht ein:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info5: Trans_Text {
			idc = -1;
			text = "Position senden";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
	
	class controls {
		class List_Players: Trans_List {
			idc = 1001;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.546562 * safezoneW;
			h = 0.154 * safezoneH;
		};

		class List_Messages: Trans_List {
			idc = 1002;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.143 * safezoneH;
			onLBSelChanged = "[] call life_fnc_cellphoneLBChange;";
		};

		class Edit_Search: Trans_Edit {
			idc = 1003;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.381563 * safezoneW;
			h = 0.033 * safezoneH;
			onKeyUp = "[1000, 1001, 1003] call life_fnc_searchFunction";
		};

		class Edit_Message: Trans_MultiEdit {
			idc = 1004;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.099 * safezoneH;
		};

		class List_Selection: Trans_List {
			idc = 1005;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.154 * safezoneH;
		};

		class Control_Text: Life_RscControlsGroup {
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.187 * safezoneH;
			class HScrollbar: HScrollbar {height = 0;};
			class controls {
				class Text_Message: Trans_StructuredText {
					idc = 1006;
					text = "";
					x = 0;
					y = 0;
					w = 0.355967 * safeZoneW;
					h = 1.5;
				};
			};
		};

		class Checkbox_Position: Trans_Checkbox {
			idc = 1007;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Update: Trans_Button {
			idc = 1008;
			text = "Aktualisieren";
			onButtonClick = "[] call life_fnc_openCellphone;";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Delete: Trans_Button {
			idc = 1009;
			text = "Löschen";
			onButtonClick = "[] call life_fnc_cellphoneRemove";
			x = 0.226718 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Send: Trans_Button {
			idc = 1010;
			text = "Nachricht senden";
			onButtonClick = "[] call life_fnc_sendMessage;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};