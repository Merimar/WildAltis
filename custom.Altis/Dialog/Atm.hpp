class Atm {
	idd = 3850;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Bankkonto verwalten";};

		class Text_SiderV1: RscSiderVertical {
			idc = 1104;
			x = 0.401958 * safezoneW + safezoneX;
			y = 0.214926 * safezoneH + safezoneY;
			h = 0.561 * safezoneH;
		};

		class Text_Info1: Trans_TextHeader {
			idc = 1001;
			text = "Dein Bankkonto:";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.15125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = 1003;
			text = "Spielerliste:";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.34375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_TextHeader {
			idc = 1002;
			text = "Gebe hier die Summe ein:";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.15125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_TextHeader {
			idc = 1009;
			text = "Gang Funktionen:";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.15125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info5: Trans_TextHeader {
			idc = 1010;
			text = "Support Funktionen:";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.15125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class Text_Konto: Trans_StructuredText {
			idc = 3851;
			text = "Konto: €100.00";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Cash: Trans_StructuredText {
			idc = 3852;
			text = "Cash: €100.00";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;	
		};
		
		class Edit_Money: Trans_Edit {
			idc = 3853;
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.15125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class List_Players: Trans_List {
			idc = 3854;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.34375 * safezoneW;
			h = 0.484 * safezoneH;
		};

		class Btn_MaxAbheben: Trans_Button {
			idc = 3855;
			text = "MAX";
			onButtonClick = "[true] call life_fnc_bankMio";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.048125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Abheben: Trans_Button {
			idc = 3856;
			text = "Abheben";
			onButtonClick = "[] call life_fnc_bankWithdraw";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.048125 * safezoneW;
			h = 0.033 * safezoneH;
		};	

		class Btn_MaxEinzahlen: Trans_Button {
			idc = 3857;
			text = "MAX";
			onButtonClick = "[false] call life_fnc_bankMio";
			x = 0.341875 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.048125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Einzahlen: Trans_Button {
			idc = 3858;
			text = "Einzahlen";
			onButtonClick = "[] call life_fnc_bankDeposit";
			x = 0.341875 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.048125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Transfer: Trans_Button {
			idc = 3859;
			text = "Überweisen";
			onButtonClick = "[] spawn life_fnc_bankTransfer";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.34375 * safezoneW;
			h = 0.033 * safezoneH;
		};


		class Btn_AbhebenGang: Trans_Button {
			idc = 3860;
			text = "Abheben Gang";
			onButtonClick = "[] spawn life_fnc_gangWithdraw";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.15125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_EinzahlenGang: Trans_Button {
			idc = 3861;
			text = "Einzahlen Gang";
			onButtonClick = "[] spawn life_fnc_gangDeposit";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.15125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Support: Trans_Button {
			idc = 3862;
			text = "Supportcode Einlösen";
			onButtonClick = "[] call life_fnc_supportCodeMenu";
			x = 0.23875 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.15125 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};