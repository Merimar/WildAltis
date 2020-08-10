class LoginScreen {
	idd = 873000;
	
	class ControlsBackground {
		class Picture_Background1: RscPicture {
			idc = -1;
			text = "Images\Dialog\Loadingbar.jpg";
			x = -0.000156274 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 1.012 * safezoneH;
		};
	};
	
	class Controls {
		class Progress_Loading: RscProgress {
			idc = 873001;
			colorBar[] = {0.882, 0.9, 0.917, 1};
			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.70125 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class Picture_Background2: RscPicture {
			idc = -1;
			text = "Images\Dialog\Loading.paa";
			x = -0.000158758 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 1.012 * safezoneH;
		};

		class Text_Joindate: RscTextRed {
			idc = 873002;
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Premium: RscTextRed {
			idc = 873003;
			x = 0.741823 * safezoneW + safezoneX;
			y = 0.677963 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Information: RscDescriptionStructured {
			idc = 873004;
			x = 0.0611978 * safezoneW + safezoneX;
			y = 0.364296 * safezoneH + safezoneY;
			w = 0.38724 * safezoneW;
			h = 0.388704 * safezoneH;
		};

		class Text_Playtime: RscTextRed {
			idc = 873005;
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.593444 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Playercount: RscTextRed {
			idc = 873006;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_UID: RscTextRed {
			idc = 873007;
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Forum: RscTextRed {
			idc = 873008;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Teamspeak: RscTextRed {
			idc = 873009;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.593444 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Picture_LoadingButton: RscPicture {
			idc = 873010;
			text = "Images\Dialog\Lade_Button.paa";
			x = 0.762448 * safezoneW + safezoneX;
			y = 0.840074 * safezoneH + safezoneY;
			w = 0.088177 * safezoneW;
			h = 0.0365926 * safezoneH;
		};

		class Btn_Lobby: Transparent_Button {
			idc = 873011;
			onButtonClick = "closeDialog 0; [""Abort"",true,false] call BIS_fnc_endMission;";
			x = 0.855677 * safezoneW + safezoneX;
			y = 0.837741 * safezoneH + safezoneY;
			w = 0.0896875 * safezoneW;
			h = 0.0420372 * safezoneH;
		};

		class Btn_Join: Transparent_Button {
			idc = 873012;
			text = "Images\Dialog\Lade_Button.paa";
			onButtonClick = "closeDialog 0; [] spawn life_fnc_joinButton;";
			x = 0.762448 * safezoneW + safezoneX;
			y = 0.840074 * safezoneH + safezoneY;
			w = 0.088177 * safezoneW;
			h = 0.0365926 * safezoneH;
		};

		class Text_Progress: RscTextRed {
			idc = 873013;
			x = 0.118437 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.572344 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes {
				font = "PuristaBold";
				color = "#e0e7ea";
				align = "center";
				shadow = 1;
			};
		};
	};
};