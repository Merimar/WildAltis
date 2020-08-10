class DeathScreen {
    idd = 7300;
    name = "Life_Death_Screen";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground { 
		class Text_Header: Life_RscText {
			idc = -1;
			text = "Du wurdest schwer verwundet";
			font = "RobotoCondensed";
			x = 0.712158 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.232856 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0.82,0.82,0.82,1};
			colorBackground[] = {0.1,0.1,0.16,1};
		};

		class Text_Sider1: Life_RscText {
			idc = -1;
			text = "";
			x = 0.712158 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.232856 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {0.86,0.07,0.188,1};
		};

		class Text_Sider2: Life_RscText {
			idc = -1;
			text = "";
			x = 0.712158 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.232856 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {0.86,0.07,0.188,1};
		};

		class Text_Sider3: Life_RscText {
			idc = -1;
			text = "";
			x = 0.825999 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.00413967 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.86,0.07,0.188,1};
		};
	};

    class Controls {
		class Text_Information: Life_RscStructuredText {
			idc = 7301;
			text = "Du bist schwer verwundet worden und die Kondition deines Zustands sieht kritisch aus. Deinem aktuellen Blutverlust nach, hast du maximal noch 15 Minuten zu leben. Du hast nun die Moeglichkeit einen Medic zu rufen oder ein neues Leben zu beginnen";
			x = 0.712158 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.232856 * safezoneW;
			h = 0.363 * safezoneH;
			colorBackground[] = {0.1,0.1,0.16,0.7};
			class Attributes {font = "RobotoCondensed";};
		};

		class Btn_Medic: Merimar_RscButtonMenu {
			idc = 7302;
			text = "Medic rufen";
			onButtonClick = "[] spawn life_fnc_requestMedic;";
			x = 0.712158 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.113841 * safezoneW;
			h = 0.044 * safezoneH;
			class Attributes {align = "center";};
		};

		class Btn_Respawn: Merimar_RscButtonMenu {
			idc = 7303;
			text = "Neues Leben";
			onButtonClick = "[] spawn life_fnc_respawned;";
			x = 0.830131 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.115404 * safezoneW;
			h = 0.044 * safezoneH;
			class Attributes {align = "center";};
		};
		
		class Btn_Adrenalin: Merimar_RscButtonMenu {
			idc = 7304;
			text = "Epi-Pen";
			onButtonClick = "[] spawn life_fnc_adrenalin;";
			x = 0.891875 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};