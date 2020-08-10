class Jail {
	idd = 2000;
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class Picture_Background: RscPicture {
			idc = -1;
			text = "Images\Dialog\Interaction.jpg";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.44 * safezoneH;
		};

		class Sider_1: RscSiderHorizontal {
			idc = -1;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
		};

		class Text_Info1: Trans_Text {
			idc = -1;
			text = "Spieler:";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_Text {
			idc = -1;
			text = "Zeit in Monaten:";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = (0.0670312 + 0.0155) * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class Edit_Player: Trans_Edit {
			idc = 2001;
			sizeEx = 0.04;
			x = (0.489687 + 0.0155) * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Edit_Time: Trans_Edit {
			idc = 2002;
			sizeEx = 0.04;
			text = 10;
			x = (0.489687 + 0.0155) * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Btn_Jail: Trans_Button {
			idc = 2003;
			text = $STR_Jail1;
			onButtonClick = "[CUR_PLAYER_IDC] spawn life_fnc_jailPlayer;";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

};