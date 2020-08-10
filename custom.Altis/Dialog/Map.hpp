class Map {
	idd = 4800;
	movingEnable = 1;
	
	class controlsBackground {
		class Picture_Background: RscPicture {
			idc = -1;
			text = "Images\Dialog\Map.jpg";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.198 * safezoneH;
		};

		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			h = 0.176 * safezoneH;
		};

		class Text_SiderH1: RscSiderHorizontal {
			idc = -1;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
		};

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Allgemeine Marker:";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Fraktions Marker:";
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_Text {
			idc = -1;
			text = $STR_Map1;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_Text {
			idc = -1;
			text = "Allgemein:";
			x = 0.144219 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info5: Trans_Text {
			idc = -1;
			text = "DP Missions:";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info6: Trans_Text {
			idc = -1;
			text = "Shops:";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info7: Trans_Text {
			idc = -1;
			text = "Illegal:";
			x = 0.144219 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info8: Trans_Text {
			idc = -1;
			text = "Legal:";
			x = 0.144219 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info9: Trans_Text {
			idc = -1;
			text = "Rebell:";
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info10: Trans_Text {
			idc = -1;
			text = "Polizei:";
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info11: Trans_Text {
			idc = -1;
			text = "Feuerwehr:";
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class Slider_Size: life_RscXSliderH {
			idc = 4801;
			onSliderPosChanged = "[_this select 1] call life_fnc_mapMarkerSlider;";
			x = 0.066875 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Box_Allgemein: Trans_Checkbox {
			idc = 4802;
			onCheckedChanged = "['Generell', _this select 1] call life_fnc_mapMarkerCheckbox;";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Box_Polizei: Trans_Checkbox {
			idc = 4803;
			onCheckedChanged = "['Polizei', _this select 1] call life_fnc_mapMarkerCheckbox;";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Box_Feuerwehr: Trans_Checkbox {
			idc = 4804;
			onCheckedChanged = "['Medic', _this select 1] call life_fnc_mapMarkerCheckbox;";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Box_Rebell: Trans_Checkbox {
			idc = 4805;
			onCheckedChanged = "['Rebell', _this select 1] call life_fnc_mapMarkerCheckbox;";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Box_Shops: Trans_Checkbox {
			idc = 4806;
			onCheckedChanged = "['Shops', _this select 1] call life_fnc_mapMarkerCheckbox;";
			x = 0.0823437 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Box_Legal: Trans_Checkbox {
			idc = 4807;
			onCheckedChanged = "['Legal', _this select 1] call life_fnc_mapMarkerCheckbox;";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Box_Illegal: Trans_Checkbox {
			idc = 4808;
			onCheckedChanged = "['Illegal', _this select 1] call life_fnc_mapMarkerCheckbox;";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Box_DP: Trans_Checkbox {
			idc = 4809;
			onCheckedChanged = "['DP', _this select 1] call life_fnc_mapMarkerCheckbox;";
			x = 0.0823437 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Btn_Reset: Blue_Button {
			idc = 4810;
			text = "Reset";
			onButtonClick = "[] call life_fnc_mapMarkerReset;";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};