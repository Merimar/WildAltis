class Spawnmenu {
idd = 38500;

	class controlsBackground {
		class Text_Background: RscPicture {
			idc = -1;
			text = "Images\Dialog\Spawnscreen.jpg";
			x = -0.0122839 * safezoneW + safezoneX;
			y = -0.00600001 * safezoneH + safezoneY;
			w = 1.01422 * safezoneW;
			h = 1.012 * safezoneH;
		};
		
		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			h = 0.638 * safezoneH;
		};

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Verfügbare Spawnpunkte:";
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Hier siehst du welchen Spawnpunkt du aktuell ausgewählt hast:";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du sehen wo der Spawnpunkt sich auf der Map befindet:";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class Controls {
		class List_Spawns: Trans_List {
			idc = 38501;
			onLBSelChanged = "[] call life_fnc_spawnPointSelected;";
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.605 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0};
		};

		class Map_Map: Life_RscMapControl {
			idc = 38502;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.517 * safezoneH;
		};

		class Text_CurrentSpawn: Trans_Text {
			idc = 38503;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Spawn: Trans_Button {
			idc = 38504;
			text = "Spawnen!";
			onButtonClick = "[] call life_fnc_spawnConfirm";
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};