class Lackierer {
	idd = 3700;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Lackierer";};
		
		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.44225 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			h = 0.627 * safezoneH;
		};

		class Text_SiderH1: RscSiderHorizontal {
			idc = -1;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
		};

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Informationen über das Fahrzeug:";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du deinen Skin ändern:";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du deine Folie ändern:";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class List_Vehicles: Trans_List {
			idc = 3701;
			onLBSelChanged = "[] call life_fnc_lackiererLBChange;";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.583 * safezoneH;
		};

		class Combo_Skin: Trans_Combo {
			idc = 3702;
			onLBSelChanged = "[0] call life_fnc_lackiererComboChange;";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Combo_Folie: Trans_Combo {
			idc = 3703;
			onLBSelChanged = "[1] call life_fnc_lackiererComboChange;";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_VehicleInfo: Trans_StructuredText {
			idc = 3704;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.264 * safezoneH;
		};

		class Text_Preis: Trans_StructuredText {
			idc = 3705;
			text = "Preis: €0";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.044 * safezoneH;
			class Attributes {
				font = "PuristaMedium";
				color = "#FFFFFF";
				align = "center";
				shadow = 0;
			};
		};

		class Btn_Skin: Trans_Button {
			idc = 3706;
			text = "Skin ändern";
			onButtonClick = "[] call life_fnc_applySkin;";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Folie: Trans_Button {
			idc = 3707;
			text = "Folie ändern";
			onButtonClick = "[] call life_fnc_applyMaterial;";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};