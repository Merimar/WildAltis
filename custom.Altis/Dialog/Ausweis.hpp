class Ausweis {
    idd = 100000;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
		class Text_BackgroundPicture: RscPicture {
			idc = -1;
			text = "Images\Dialog\Spawnscreen.jpg";
			x = -0.0122839 * safezoneW + safezoneX;
			y = -0.00600001 * safezoneH + safezoneY;
			w = 1.01422 * safezoneW;
			h = 1.012 * safezoneH;
		};
		
		class Text_Background: RscBackground {
			idc = -1;
			x = 0.293017 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.413967 * safezoneW;
			h = 0.572 * safezoneH;
		};

		class Text_Sider1: RscSider {
			idc = -1;
			x = 0.293017 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.413967 * safezoneW;
			h = 0.0055 * safezoneH;
		};

		class Text_Name: RscTopic {
			idc = -1;
			text = "Name";
			x = 0.293017 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.413967 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Adresse: RscTopic {
			idc = -1;
			text = "Adresse";
			x = 0.293017 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.413967 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Daten: RscTopic {
			idc = -1;
			text = "Daten Abschicken";
			x = 0.293017 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.413967 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Vorname: RscDescription {
			idc = -1;
			text = "Vorname:";
			x = 0.303366 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0517458 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Nachname: RscDescription {
			idc = -1;
			text = "Nachname (Keine Pflicht):";
			x = 0.489651 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.103492 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Land: RscDescription {
			idc = -1;
			text = "Land:";
			x = 0.303366 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0517458 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Provinz: RscDescription {
			idc = -1;
			text = "Provinz:";
			x = 0.489651 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.062095 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Wohnort: RscDescription {
			idc = -1;
			text = "Wohnort:";
			x = 0.303366 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0517458 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Strase: RscDescription {
			idc = -1;
			text = $STR_STREET;
			x = 0.303366 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0517458 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Hausnummer: RscDescription {
			idc = -1;
			text = "Hausnummer:";
			x = 0.489651 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.062095 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Postleitzahl: RscDescription {
			idc = -1;
			text = "Postleitzahl:";
			x = 0.489651 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.062095 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Tip: RscDescriptionStructured {
			idc = -1;
			text = $STR_TIP;
			x = 0.603492 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0931425 * safezoneW;
			h = 0.088 * safezoneH;
		};
	};
	
	class Controls {
		class Text_Header: RscHeader {
			idc = 100001;
			x = 0.293017 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.413967 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Edit_Vorname: Merimar_RscEdit {
			idc = 100002;
			x = 0.365461 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.113841 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Edit_Nachname: Merimar_RscEdit {
			idc = 100003;
			x = 0.603492 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0931425 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Edit_Postleitzahl: Merimar_RscEdit {
			idc = 100004;
			x = 0.562095 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.062095 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Edit_Strase: Merimar_RscEdit {
			idc = 100005;
			x = 0.365461 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.113841 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Combo_Land: Merimar_RscCombo {
			idc = 100006;
			x = 0.365461 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.113841 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Combo_Provinz: Merimar_RscCombo {
			idc = 100007;
			x = 0.562095 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.113841 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Combo_Wohnort: Merimar_RscCombo {
			idc = 100008;
			x = 0.365461 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.113841 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Combo_Hausnummer: Merimar_RscCombo {
			idc = 100009;
			x = 0.562095 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.062095 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Btn_Beantragen: Merimar_RscButtonMenu {
			idc = 100010;
			text = "Ausweis beantragen";
			onButtonClick = "[] spawn life_fnc_ausweisCreate;";
			x = 0.313715 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.12419 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class Btn_Lobby: Merimar_RscButtonMenuClose {
			idc = 100011;
			text = $STR_BACKTOLOBBY;
			onButtonClick = "closeDialog 0; [""Abort"",true,false] call BIS_fnc_endMission;";
			x = 0.458603 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.12419 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};