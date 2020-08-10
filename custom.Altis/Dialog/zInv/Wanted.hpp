class Wanted {
	idd = 3900;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Button_Close: Trans_CloseButton {};
		class Text_Title: Trans_Header {text = "Fahndungsliste";};

		class Text_SiderV1: RscSiderVertical 
		{
			idc = -1;
			x = 0.496438 * safezoneW + safezoneX;
			y = 0.225926 * safezoneH + safezoneY;
			h = 0.396 * safezoneH;
		};

		class Text_Sider1: RscSiderHorizontal {
			idc = -1;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.254375 * safezoneW;
		};

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Straftaten:";
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.53625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Informationen:";
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Zusätzliche Notizen:";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_Text {
			idc = -1;
			text = "Strafe in €:";
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info5: Trans_Text {
			idc = -1;
			text = "Haftstrafe";
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info6: Trans_Text {
			idc = -1;
			text = "Monate";
			x = 0.39 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.055 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info7: Trans_Text {
			idc = -1;
			text = "Strafe in %:";
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info8: Trans_Text {
			idc = -1;
			text = "Pflichtticket:";
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls {		
		class List_Players: Trans_List {
			idc = 3901;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.352 * safezoneH;
		};		

		class List_Crimes: Trans_List {
			idc = 3902;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.22 * safezoneH;
		};	

		class Edit_Money: Trans_Edit {
			idc = 3903;
			x = 0.300625 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Edit_Percentage: Trans_Edit {
			idc = 3904;
			x = 0.300625 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Edit_Jail: Trans_Edit {
			idc = 3905;
			x = 0.300625 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};	

		class Edit_Message: Trans_Edit {
			idc = 3906;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_Pflicht: Trans_Edit {
			idc = 3907;
			x = 0.300625 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Control_Info: Life_RscControlsGroup {
			idc = 3908;
			colorBackground[] = {0.5,0.5,0.5,0.1};
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.254375 * safezoneW;
			h = 0.121 * safezoneH;
			class Controls {};
		};

		class Btn_Update: Trans_Button {
			idc = 3909;
			text = "Aktualisieren";
			onButtonClick = "[] spawn life_fnc_fahndungUpdate;";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Send: Trans_Button {
			idc = 3910;
			text = "Notiz Senden";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Cancel: Trans_Button {
			idc = 3911;
			text = "Abbrechen";
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};