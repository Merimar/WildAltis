class Locker {
	idd = 398000;
	
	class ControlsBackground {
		class Picture_Background: BackgroundPicture {};
		class Text_Title: Trans_Header {idc = -1; text = "Schließfach";};
		
		class Text_SiderV1: RscSiderVertical {
			idc = -1;
			x = 0.493813 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			h = 0.66 * safezoneH;
		};
		
		class Text_Info1: Trans_TextHeader {
			idc = 398115;
			text = "Schließfach:";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Text_Info2: Trans_TextHeader {
			idc = 398116;
			text = "Spielerinventar:";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls {
		class List_Locker: Trans_List {
			idc = 398039;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
			onMouseButtonDblClick = "_this call life_fnc_lockerDBClick;";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.627 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class List_Inventar: Trans_List {
			idc = 398040;
			onLBDrop = "_this call life_fnc_lockerDrop; true";
			onMouseButtonDblClick = "_this call life_fnc_lockerDBClick;";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.627 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
	};
};