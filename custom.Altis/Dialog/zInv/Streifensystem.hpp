class Streifensystem {
	idd = 1300;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Streifensystem";};	

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Trage dich hier in deine Streife ein:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Diese Spieler sind schon in der Streife:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class List_Patrols: Trans_List {
			idc = 1301;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.473 * safezoneH;
		};

		class Combo_Patrols: Trans_Combo {
			idc = 1302;
			onLBSelChanged = "[] call life_fnc_streifensystemLBChange;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Einloggen: Trans_Button {
			idc = 1303;
			text = "Einloggen";
			onButtonClick = "[false] call life_fnc_streifensystemEintragen;";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Ausloggen: Trans_Button {
			idc = 1304;
			text = "Ausloggen";
			onButtonClick = "[true] call life_fnc_streifensystemEintragen;";
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};