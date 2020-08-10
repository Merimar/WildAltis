class Ubahn {
	idd = 3600;
	
	class controlsBackground {
		class Picture_Background: RscPicture {
			idc = -1;
			text = "Images\Dialog\Interaction.jpg";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.44 * safezoneH;
		};		
	};
	
	class controls {
		class List_Spawns: Trans_List {
			idc = 3601;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.319 * safezoneH;
		};

		class Btn_Ubahn: Trans_Button {
			idc = 3602;
			text = "Ubahn benutzen";
			onButtonClick = "[] spawn life_fnc_useUbahn";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
		};	
	};
};