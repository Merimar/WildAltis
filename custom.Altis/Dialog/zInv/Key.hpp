class Key {
	idd = 1200;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Button_Close: Trans_CloseButton {};
		class Text_Title: Trans_Header {text = "Schlüsselbund";};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du Spielern Schlüssel für deine Fahrzeuge geben:"; 
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.53625 * safezoneW;
			h = 0.022 * safezoneH;
		};	

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Deine Schlüssel:";
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.53625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};	
	class controls {
		class List_Keys: Trans_List {
			idc = 1201;
			colorBackground[] = {0,0,0,0};
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.53625 * safezoneW;
			h = 0.418 * safezoneH;
		};

		class Combo_Players: Trans_Combo {
			idc = 1202;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.53625 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Button_Give: Trans_Button {
			idc = 1203;
			text = "Schlüssel Geben"; 
			onButtonClick = "[] call life_fnc_keyGive;";
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Button_Update: Trans_Button {
			idc = 1204;
            text = "Aktualisieren";
            onButtonClick = "[] call life_fnc_openKeychain;";
			x = 0.39 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};	
};
				


