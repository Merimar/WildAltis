class Farm {
	idd = 1150;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Farmrouten";};
		
		class Sider_V1: RscSiderVertical {
			idc = -1;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			h = 0.616 * safezoneH;
		};

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Informationen zu der Route:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Du kannst dir alle Positionen auf der Map anzeigen lassen:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.340312 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_Text {
			idc = -1;
			text = "Zum Farmen brauchst du:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_Text {
			idc = -1;
			text = "Die kürzeste Route ist:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info5: Trans_Text {
			idc = -1;
			text = "Dein Farmskill:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info6: Trans_Text {
			idc = -1;
			text = "Dein Verarbeitungsskill:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info7: Trans_Text {
			idc = -1;
			text = "Nützliche Informationen:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info8: Trans_Text {
			idc = -1;
			text = "Aus";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info9: Trans_Text {
			idc = -1;
			text = "wird";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.027 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class List_Items: Trans_List {
			idc = 1151;
			sizeEx = 0.04;
			onLBSelChanged = "[] call life_fnc_farmLBChange;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.616 * safezoneH;
		};

		class Map_Map: Life_RscMapControl {
			idc = 1152;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.198 * safezoneH;
		};
		
		class Edit_Tool: Trans_Edit {
			idc = 1153;
			colorBackground[] = {0,0,0,1};
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Edit_Short: Trans_Edit {
			idc = 1154;
			colorBackground[] = {0,0,0,1};
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Edit_FarmSkill: Trans_Edit {
			idc = 1155;
			colorBackground[] = {0,0,0,1};
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Edit_ProcessorSkill: Trans_Edit {
			idc = 1156;
			colorBackground[] = {0,0,0,1};
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Edit_Infos: Trans_Edit {
			idc = 1157;
			colorBackground[] = {0,0,0,1};
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.066 * safezoneH;
		};

		class Edit_Aus: Trans_Edit {
			idc = 1158;
			colorBackground[] = {0,0,0,1};
			x = (0.45875 + 0.02) * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = (0.134062 - 0.02) * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Edit_Wird: Trans_Edit {
			idc = 1159;
			colorBackground[] = {0,0,0,1};
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Btn_Feld: Trans_Button {
			idc = 1160;
			text = "Feld anzeigen";
			onButtonClick = "['fields'] call life_fnc_farmSetMapPosition;";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class Btn_Processor: Trans_Button {
			idc = 1161;
			text = "Verarbeiter anzeigen";
			onButtonClick = "['processors'] call life_fnc_farmSetMapPosition;";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class Btn_Vendor: Trans_Button {
			idc = 1162;
			text = "Verkäufer anzeigen";
			onButtonClick = "['vendors'] call life_fnc_farmSetMapPosition;";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};