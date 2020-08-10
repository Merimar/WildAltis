class Settings {
	idd = 4000;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Einstellungen";};
		
		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du deine Sichtweite einstellen (Kann deine FPS verbessern):";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.546562 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du das Gras austellen und dein Gear fixxen:";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.546562 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_TextHeader {
			idc = -1;
			text = "Hier kannst du dein Hexagon modifizieren:";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.546562 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_Text {
			idc = -1;
			text = "Sichweite Luft:";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Info5: Trans_Text {
			idc = -1;
			text = "Sichweite Auto:";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Info6: Trans_Text {
			idc = -1;
			text = "Sichweite Boden:";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Info7: Trans_Text {
			idc = -1;
			text = "Gras ausstellen";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Info8: Trans_Text {
			idc = -1;
			text = "Spielernamen unterm Hexagon anstellen";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.19 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Text_Info9: Trans_Text {
			idc = -1;
			text = "Hexagon Größe";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
	
	class controls {
		class Checkbox_Gras: Trans_Checkbox {
			idc = 4001;
			onCheckedChanged = "['grass', _this select 1] call life_fnc_settingsCheckbox;";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Checkbox_Namen: Trans_Checkbox {
			idc = 4002;
			onCheckedChanged = "['name', _this select 1] call life_fnc_settingsCheckbox;";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Combo_Size: Trans_Combo {
			idc = 4003;
			onLBSelChanged = "[] call life_fnc_settingsCombo;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class Text_ColorPreview: Trans_Text {
			idc = 4004;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.176 * safezoneH;
			colorBakground[] = {1,1,1,1};
		};

		class Picture_Helmet: RscPicture {
			idc = 4005;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class Picture_Glasses: RscPicture {
			idc = 4006;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class Picture_Uniform: RscPicture {
			idc = 4007;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class Picture_West: RscPicture {
			idc = 4008;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class Picture_Rucksack: RscPicture {
			idc = 4009;
			x = 0.665 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class Slider_Luft: life_RscXSliderH {
			idc = 4010;
			onSliderPosChanged = "[2, _this select 1] call life_fnc_settingsSlider;";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Slider_Auto: life_RscXSliderH {
			idc = 4011;
			onSliderPosChanged = "[1, _this select 1] call life_fnc_settingsSlider;";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Slider_Boden: life_RscXSliderH {
			idc = 4012;
			onSliderPosChanged = "[0, _this select 1] call life_fnc_settingsSlider;";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Slider_Rot: life_RscXSliderH {
			idc = 4013;
			onSliderPosChanged = "[3, _this select 1] call life_fnc_settingsSlider;";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.044 * safezoneH;
			colorActive[] = {0.86,0.07,0.188,1};
			color[] = {0.86,0.07,0.188,1};
		};

		class Slider_Grun: life_RscXSliderH {
			idc = 4014;
			onSliderPosChanged = "[4, _this select 1] call life_fnc_settingsSlider;";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.044 * safezoneH;
			colorActive[] = {0,0.54,0,1};
			color[] = {0,0.54,0,1};
		};

		class Slider_Blau: life_RscXSliderH {
			idc = 4015;
			onSliderPosChanged = "[5, _this select 1] call life_fnc_settingsSlider;";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.044 * safezoneH;
			colorActive[] = {0.39,0.58,0.92,1};
			color[] = {0.39,0.58,0.92,1};
		};

		class Edit_Luft: Trans_Edit {
			idc = 4016;
            onKeyUp = "[_this select 0, _this select 1, 'air'] call life_fnc_settingsEdit;";
			onChar = "[_this select 0, _this select 1, 'air'] call life_fnc_settingsEdit;";
			x = 0.634063 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};

		class Edit_Auto: Trans_Edit {
			idc = 4017;
			onKeyUp = "[_this select 0, _this select 1, 'vehicle'] call life_fnc_settingsEdit;";
			onChar = "[_this select 0, _this select 1, 'vehicle'] call life_fnc_settingsEdit;";
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};

		class Edit_Boden: Trans_Edit {
			idc = 4018;
			onKeyUp = "[_this select 0, _this select 1, 'ground'] call life_fnc_settingsEdit;";
			onChar = "[_this select 0, _this select 1, 'ground'] call life_fnc_settingsEdit;";
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};

		class Edit_Rot: Trans_Edit {
			idc = 4019;
			onKeyUp = "[_this select 0, _this select 1, 'rot'] call life_fnc_settingsEdit;";
			onChar = "[_this select 0, _this select 1, 'rot'] call life_fnc_settingsEdit;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};

		class Edit_Grun: Trans_Edit {
			idc = 4020;
			onKeyUp = "[_this select 0, _this select 1, 'grun'] call life_fnc_settingsEdit;";
			onChar = "[_this select 0, _this select 1, 'grun'] call life_fnc_settingsEdit;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};

		class Edit_Blau: Trans_Edit {
			idc = 4021;
			onKeyUp = "[_this select 0, _this select 1, 'blau'] call life_fnc_settingsEdit;";
			onChar = "[_this select 0, _this select 1, 'blau'] call life_fnc_settingsEdit;";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};

		class Btn_Fix: Trans_Button {
			idc = 4022;
			text = "Gear fixxen";
			onButtonClick = "[] call life_fnc_settingsGearFix;";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};