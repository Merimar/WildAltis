class Skills {
	idd = 4100;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Skillsystem";};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Wähle eine Skillgruppe aus:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Wähle einen Skill aus um mehr Informationen zu sehen:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du deinen aktuellen Fortschritt sehen:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_TextHeader {
			idc = -1;
			text = "Alle Vorteile des Skills kannst du hier sehen:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info5: Trans_Text {
			idc = -1;
			text = "Aktuelles Level";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.05,0.73333,0.631,0.7};
		};

		class Text_Info6: Trans_Text {
			idc = -1;
			text = "Aktuelle Punkte";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.05,0.73333,0.631,0.7};
		};

		class Text_Info7: Trans_Text {
			idc = -1;
			text = "Punkte zum Levelaufstieg";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.05,0.73333,0.631,0.7};
		};

		class Text_Info8: Trans_Text {
			idc = -1;
			text = "Max. Level Vorteile";
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.05,0.73333,0.631,0.7};
		};

		class Text_Info9: Trans_Text {
			idc = -1;
			text = "Aktuelle Vorteile";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.05,0.73333,0.631,0.7};
		};

		class Text_Info10: Trans_Text {
			idc = -1;
			text = "Nächste Vorteile";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.05,0.73333,0.631,0.7};
		};
	};
	
	class controls {
		class List_Groups: Trans_List {
			idc = 4101;
			onLBSelChanged = "[] call life_fnc_skillGroupChange;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.11 * safezoneH;
		};

		class List_Skills: Trans_List {
			idc = 4102;
			onLBSelChanged = "[] call life_fnc_skillChange;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.165 * safezoneH;
		};

		class Edit_CurrentLevel: Trans_Edit {
			idc = 4103;
			colorBackground[] = {0,0,0,1};
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_CurrentPoints: Trans_Edit {
			idc = 4104;
			colorBackground[] = {0,0,0,1};
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_NextLevelPoints: Trans_Edit {
			idc = 4105;
			colorBackground[] = {0,0,0,1};
			x = 0.5 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Edit_MaxLevelAdvantage: Trans_Edit {
			idc = 4106;
			colorBackground[] = {0,0,0,1};
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_CurrentAdvantage: Trans_StructuredText {
			idc = 4107;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.11 * safezoneH;
		};

		class Text_MaxAdvantage: Trans_StructuredText {
			idc = 4108;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.11 * safezoneH;
		};
	};
};