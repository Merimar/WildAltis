class Loot {
	idd = 5100;
	
	class controlsBackground {
		class Picture_Background: RscPicture {
			idc = -1;
			text = "Images\Dialog\Interaction.jpg";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.44 * safezoneH;
		};

		class Sider_H1: RscSiderHorizontal {
			idc = -1;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
		};
	};
	
	class controls {
		class List_Items: Trans_List {
			idc = 5101;
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.253 * safezoneH;
		};

		class Btn_TakeItem: Trans_Button {
			idc = 5102;
			text = "Item nehmen";
			onButtonClick = "[] call life_fnc_takeLootItem";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_TakeMoney: Trans_Button {
			idc = 5103;
			text = "";
			onButtonClick = "[] call life_fnc_takeLootMoney";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
		};	
	};
};