class VehicleShop {
	idd = 4450;
	onUnload = "[] call life_fnc_vehicleShopEnd3DPreview;";
	
	class controlsBackground {
		class Picture_Background: RscPicture {
			idc = 4459;
			text = "Images\Dialog\Vehicleshop.jpg";
			x = 0.00500001 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.214884 * safezoneW;
			h = 0.825 * safezoneH;
		};

		class Text_SiderH1: RscSiderHorizontal {
			idc = -1;
			x = 0.011875 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.199375 * safezoneW;
		};

		class Text_SiderH2: RscSiderHorizontal {
			idc = -1;
			x = 0.011875 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.199375 * safezoneW;
		};

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Fahrzeuge:";
			x = 0.011875 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.199375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Fahrzeug Informationen:";
			x = 0.011875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.199375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_Text {
			idc = -1;
			text = "Mietpreis:";
			x = 0.011875 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.09625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_Text {
			idc = -1;
			text = "Kaufpreis:";
			x = 0.115 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.09625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
				
		class List_Vehicles: Trans_List {
			idc = 4451;
			onLBSelChanged = "[] call life_fnc_vehicleShopLBChange";
			x = 0.011875 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.199375 * safezoneW;
			h = 0.297 * safezoneH;
		};
		
		class Progress_Bar: Raska_Life_RscProgress {
			idc = 4452;
			x = 0.011875 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.199375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBar[] = {0.835, 0.462, 0.023, 1};
		};
		
		class Text_Progress: Trans_Text {
			idc = 4453;
			text = "";
			x = 0.039375 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class Text_VehicleInfo: Trans_StructuredText {
			idc = 4454;
			x = 0.011875 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.199375 * safezoneW;
			h = 0.209 * safezoneH;
		};
		
		class Text_Mietpreis: Trans_Text {
			idc = 4455;
			text = "";
			colorText[] = {0.55,1,0.6,1};
			x = 0.011875 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.09625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Kaufpreis: Trans_Text {
			idc = 4456;
			text = "";
			colorText[] = {0.55,1,0.6,1};
			x = 0.115 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.09625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Btn_Back: Trans_Button {
			idc = 4457;
			text = "Zurück";
			x = 0.011875 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.089375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Next: Trans_Button {
			idc = 4458;
			text = "Weiter";
			x = 0.121875 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.089375 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};	
};