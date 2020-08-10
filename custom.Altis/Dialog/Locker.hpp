class Locker {
	idd = 398000;
	
	class ControlsBackground {
		class Text_Background: RscBackground {
			idc = -1;
			x = 0.220572 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.558855 * safezoneW;
			h = 0.737 * safezoneH;
		};
		
		class Text_Sider1: RscSider {
			idc = -1;
			x = 0.497916 * safezoneW + safezoneX;
			y = 0.237852 * safezoneH + safezoneY;
			w = 0.001 * safezoneW;
			h = 0.539 * safezoneH;
		};
		
		class Text_Info1: Trans_TextHeader {
			idc = 398101;
			text = "Helme:";
			x = 0.26593 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.203372 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info2: Trans_TextHeader {
			idc = 398102;
			text = "Brillen:";
			x = 0.52686 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.207209 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_TextHeader {
			idc = 398103;
			text = "Erweiterung der Sicht:";
			x = 0.52686 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.207209 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info4: Trans_TextHeader {
			idc = 398104;
			text = "Westen:";
			x = 0.52686 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.207209 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info5: Trans_TextHeader {
			idc = 398105;
			text = "Kleidungen:";
			x = 0.26593 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.203372 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info6: Trans_TextHeader {
			idc = 398106;
			text = "Backpack";
			x = 0.26593 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.203372 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Text_Info7: Trans_TextHeader {
			idc = 398107;
			text = "Primär Waffen";
			x = 0.277442 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.161163 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info8: Trans_TextHeader {
			idc = 398108;
			text = "Pistolen:";
			x = 0.277442 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.161163 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info9: Trans_TextHeader {
			idc = 398109;
			text = "Aufsätze:";
			x = 0.277442 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.161163 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info10: Trans_TextHeader {
			idc = 398110;
			text = "Magazine:";
			x = 0.277442 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.161163 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info11: Trans_TextHeader {
			idc = 398111;
			text = "Primär Waffen";
			x = 0.530698 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.103605 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info12: Trans_TextHeader {
			idc = 398112;
			text = "Pistolen:";
			x = 0.530698 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.103605 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info13: Trans_TextHeader {
			idc = 398113;
			text = "Aufsätze:";
			x = 0.530698 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.103605 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info14: Trans_TextHeader {
			idc = 398114;
			text = "Magazine:";
			x = 0.530698 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.103605 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info15: Trans_TextHeader {
			idc = 398115;
			text = "Schliessfach Inventar:";
			x = 0.277442 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.180349 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info16: Trans_TextHeader {
			idc = 398116;
			text = "Dein Inventar:";
			x = 0.542209 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.180349 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls {
	
		class Btn_Tab1: Merimar_RscButtonMenu {
			idc = 398002;
			text = "";
			onButtonClick = "[0] call life_fnc_lockerTab;";
			x = 0.250581 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.145814 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Btn_Tab2: Merimar_RscButtonMenu {
			idc = 398003;
			text = "";
			onButtonClick = "[1] call life_fnc_lockerTab;";
			x = 0.43093 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.144888 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Btn_Tab3: Merimar_RscButtonMenu {
			idc = 398004;
			text = "Items";
			onButtonClick = "[2] call life_fnc_lockerTab;";
			x = 0.611279 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.144888 * safezoneW;
			h = 0.044 * safezoneH;
		};	

		class Edit_countLocker: Merimar_RscEdit {
			idc = 398005;
			text = "1";
			x = 0.453429 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0258729 * safezoneW;
			h = 0.033 * safezoneH;
		};	

		class Edit_countPlayer: Merimar_RscEdit {
			idc = 398006;
			text = "1";
			x = 0.712158 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0258729 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class List_HelmetList: RscPictureListBox {
			idc = 398007;
			x = 0.26593 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.134539 * safezoneW;
			h = 0.11 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};
		class List_GlassesList: RscPictureListBox {
			idc = 398008;
			x = 0.52686 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.134539 * safezoneW;
			h = 0.11 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};
		
		class List_BinocularList: RscPictureListBox {
			idc = 398009;
			x = 0.52686 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.134539 * safezoneW;
			h = 0.11 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};
		
		class List_UniformList: RscPictureListBox {
			idc = 398010;
			x = 0.26593 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.134539 * safezoneW;
			h = 0.11 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};
		
		class List_VestList: RscPictureListBox {
			idc = 398011;
			x = 0.52686 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.134539 * safezoneW;
			h = 0.11 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};
		
		class List_BackpackList: RscPictureListBox {
			idc = 398012;
			x = 0.26593 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.134539 * safezoneW;
			h = 0.11 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_Helmet: Picture_RscListBox {
			idc = 398013;
			x = 0.407907 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0613954 * safezoneW;
			h = 0.11 * safezoneH;
			sizeEx = ((0.195 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_Glasses: Picture_RscListBox {
			idc = 398014;
			x = 0.672674 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0613954 * safezoneW;
			h = 0.11 * safezoneH;
			sizeEx = ((0.195 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};
		
		class List_Binocular: Picture_RscListBox {
			idc = 398015;
			x = 0.672674 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0613954 * safezoneW;
			h = 0.11 * safezoneH;
			sizeEx = ((0.195 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};
		
		class List_Uniform: Picture_RscListBox {
			idc = 398016;
			x = 0.407907 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0613954 * safezoneW;
			h = 0.11 * safezoneH;
			sizeEx = ((0.195 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_Vest: Picture_RscListBox {
			idc = 398017;
			x = 0.672674 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0613954 * safezoneW;
			h = 0.11 * safezoneH;
			sizeEx = ((0.195 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_Backpack: Picture_RscListBox {
			idc = 398018;
			x = 0.407907 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.062095 * safezoneW;
			h = 0.11 * safezoneH;
			sizeEx = ((0.195 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_pWeapons: RscPictureListBox {
			idc = 398019;
			x = 0.277493 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.160412 * safezoneW;
			h = 0.088 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_sWeapons: RscPictureListBox {
			idc = 398020;
			x = 0.277493 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.160412 * safezoneW;
			h = 0.088 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_Attachments: RscPictureListBox {
			idc = 398021;
			x = 0.277493 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.160412 * safezoneW;
			h = 0.088 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_Magazines: RscPictureListBox {
			idc = 398022;
			x = 0.277493 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.160412 * safezoneW;
			h = 0.088 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
			onMouseButtonDblClick = "_this call life_fnc_lockerDBClick;";
		};

		class List_primaryWeapon: Picture_RscListBox {
			idc = 398023;
			x = 0.531048 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.103492 * safezoneW;
			h = 0.088 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_secondaryWeapon: Picture_RscListBox {
			idc = 398024;
			x = 0.531048 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.103492 * safezoneW;
			h = 0.088 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_handgunWeapon: Picture_RscListBox {
			idc = 398025;
			x = 0.531048 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.103492 * safezoneW;
			h = 0.088 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_playerMagazines: RscPictureListBox {
			idc = 398026;
			x = 0.531048 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.160412 * safezoneW;
			h = 0.088 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
			onMouseButtonDblClick = "_this call life_fnc_lockerDBClick;";
		};

		class List_primarySilencer: Picture_RscListBox {
			idc = 398027;
			x = 0.655238 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0310475 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = ((0.08 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_primaryScope: Picture_RscListBox {
			idc = 398028;
			x = 0.701809 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0310475 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = ((0.08 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_primaryPointer: Picture_RscListBox {
			idc = 398029;
			x = 0.655238 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0310475 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = ((0.08 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_primaryBipod: Picture_RscListBox {
			idc = 398030;
			x = 0.701809 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0310475 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = ((0.08 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_secondarySilencer: Picture_RscListBox {
			idc = 398031;
			x = 0.655238 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0310475 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = ((0.08 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_secondaryScope: Picture_RscListBox {
			idc = 398032;
			x = 0.701809 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0310475 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = ((0.08 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_secondaryPointer: Picture_RscListBox {
			idc = 398033;
			x = 0.655238 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0310475 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = ((0.08 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_secondaryBipod: Picture_RscListBox {
			idc = 398034;
			x = 0.701809 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0310475 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = ((0.08 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_handgunSilencer: Picture_RscListBox {
			idc = 398035;
			x = 0.655238 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0310475 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = ((0.08 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_handgunScope: Picture_RscListBox {
			idc = 398036;
			x = 0.701809 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0310475 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = ((0.08 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};
		class List_handgunPointer: Picture_RscListBox {
			idc = 398037;
			x = 0.655238 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0310475 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = ((0.08 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};
		class List_handgunBipod: Picture_RscListBox {
			idc = 398038;
			x = 0.701809 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0310475 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = ((0.08 * 0.55) * safeZoneH);
			onLBDrop = "_this call life_fnc_lockerDrop; true";
		};

		class List_Locker: RscPictureListBox {
			idc = 398039;
			x = 0.277493 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.180349 * safezoneW;
			h = 0.484 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
			onMouseButtonDblClick = "_this call life_fnc_lockerDBClick;";
		};

		class List_Player: RscPictureListBox {
			idc = 398040;
			x = 0.541397 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.180349 * safezoneW;
			h = 0.484 * safezoneH;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
			onMouseButtonDblClick = "_this call life_fnc_lockerDBClick;";
		};
	};	
};