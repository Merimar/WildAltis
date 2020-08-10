class Trunk {
	idd = 3500;
	
	class controlsBackground {
        class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {text = "Kofferraum";};

		class Text_Info1: Trans_TextHeader {
			idc = -1;
			text = "Kofferraum:";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info2: Trans_TextHeader {
			idc = -1;
			text = "Inventar:";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_SiderH1: RscSiderHorizontal {
			idc = -1;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
		};
		class Text_SiderH2: RscSiderHorizontal {
			idc = -1;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
		};

		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.493813 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			h = 0.572 * safezoneH;
		};
	};
	
	class controls {
		class List_Kofferraum: Trans_List {
			idc = 3501;
			colorBackground[] = {0.5,0.5,0.5,0.1};
			onMouseButtonDblClick = "[true] call life_fnc_vehTakeItem;";
			onLBSelChanged = "_this call life_fnc_trunkLBChange;";
			colorSelect[] = {0.835, 0.462, 0.023, 1};
			colorSelect2[] = {0.69, 0.313, 0.862, 1};
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.484 * safezoneH;
		};

		class List_Inventar: Trans_List {
			idc = 3502;
			colorBackground[] = {0.5,0.5,0.5,0.1};
			onMouseButtonDblClick = "[true] call life_fnc_vehStoreItem;";
			onLBSelChanged = "_this call life_fnc_trunkLBChange;";
			colorSelect[] = {0.835, 0.462, 0.023, 1};
			colorSelect2[] = {0.69, 0.313, 0.862, 1};
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.484 * safezoneH;
		};

		class Edit_Amount: Trans_Edit {
			idc = 3503;
			text = "1";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.541406 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Text_Kofferraum: Trans_StructuredText {
			idc = 3504;
			text = "Quad Bike [Gewicht - 0/25]";
			colorBackground[] = {0,0,0,0};
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes {
				font = "PuristaMedium";
				color = "#FFFFFF";
				align = "left";
			};
		};

		class Text_Inventar: Trans_StructuredText {
			idc = 3505;
			text = "Igor Nitro [Gewicht - 0/25]";
			colorBackground[] = {0,0,0,0};
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes {
				font = "PuristaMedium";
				color = "#FFFFFF";
				align = "left";
			};
		};

		class Btn_Umlagern: Trans_Button {
			idc = 3506;
			text = "Umlagern";
			onButtonClick = "[] call life_fnc_relocate;";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.541406 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};