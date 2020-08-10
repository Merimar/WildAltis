class life_eventgear_menu {
idd = 150000;
name = "life_eventgear_menu";
movingEnable = false;
enableSimulation = false;

	class controlsBackground {
		class Text_Background: Life_RscText {
			idc = -1;
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		
		class Text_Gear: Life_RscText {
			idc = -1;
			text = "Spieler Ausruestung";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.435417 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,0.5,0.4};
		};
		
		class Text_Header: Life_RscText {
			idc = -1;
			text = "WildAltis Gear"; 
			font = "TahomaB";
			x = 0.270833 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.5,0.5,-1,0.8};
		};
		
		class Text_Section: Life_RscText {
			idc = -1;
			text = "Gear Droppen:"; 
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0802083 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0.5,0,0.6};
		};
		
		class Text_Actions: Life_RscText {
			idc = -1;
			text = "Eigenequip:"; 
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0802083 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0.5,0,0.6};
		};
		
		class Text_Give: Life_RscText {
			idc = -1;
			text = "Gear verteilen:"; 
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0802083 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0.5,0,0.6};
		};
		
		class Text_Info: Life_RscStructuredText {
			idc = -1;
			text = "Um den Spielern Gear zu geben, muss das Gear erst selber angezogen und dann gespeichert werden !";
			x = 0.414063 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {1,0.5,-1,0.6};
		};
	};
	
	class controls {
		class Btn_Clothing: Life_RscButtonMenu {
			idc = 150001;
			text = "Kleidung";
			onButtonClick = "[2] call life_fnc_openDropMenu;";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Items: Life_RscButtonMenu {
			idc = 150002;
			text = "Items";
			onButtonClick = "[3] call life_fnc_openDropMenu;";
			x = 0.373958 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Weapons: Life_RscButtonMenu {
			idc = 150003;
			text = "Waffen";
			onButtonClick = "[1] call life_fnc_openDropMenu;";
			x = 0.626042 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Arsenal: Life_RscButtonMenu {
			idc = 150004;
			text = "Arsenal"; 
			onButtonClick = "[] call life_fnc_openArsenal;";
			x = 0.373958 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_Save: Life_RscButtonMenu {
			idc = 150005;
			text = "Gear speichern"; 
			onButtonClick = "[] call life_fnc_saveGearMod;";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_GiveAll: Life_RscButtonMenu {
			idc = 150006;
			text = "Gear an alle geben";
			onButtonClick = "[1] call life_fnc_giveItemMod;";
			x = 0.373958 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_GiveRadius: Life_RscButtonMenu {
			idc = 150007;
			text = "Gear in Radius geben (10m)"; 
			onButtonClick = "[2] call life_fnc_giveItemMod;";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
		
		class Btn_GiveF3: Life_RscButtonMenu {
			idc = 150008;
			text = "Gear mit F3 geben"; 
			onButtonClick = "[3] call life_fnc_giveItemMod;";
			x = 0.626042 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,-1,-1,0.8};
		};
	};
};