class Tresor {
	idd = 3650;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Tresor";};

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Fahrzeuge in deiner Nähe (Nur Tank Fahrzeuge):";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Hie siehst du wie viel Gift noch in deine Fahrzeuge passt:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Vefolge wieviel Gift sich noch im Tresor befindet:";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class List_Vehicles: Trans_List {
			idc = 3651;
			onLBSelChanged = "[] call life_fnc_zentiLBChange";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.253 * safezoneH;
		};

		class Progress_Bar: Raska_Life_RscProgress {
			idc = 3652;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.044 * safezoneH;
			colorBar[] = {0.863,0.078,0.231,1};
		};

		class Text_ProgressInfo: Trans_StructuredText {
			idc = 3653;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			class Attributes {align = "center";};
		};

		class Text_VehicleInfo: Trans_StructuredText {
			idc = 3654;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.187 * safezoneH;
		};

		class Btn_Fill: Trans_Button {
			idc = 3655;
			text = "Fahrzeug befüllen";
			onButtonClick = "[] spawn life_fnc_zentiFuelVehicle";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};