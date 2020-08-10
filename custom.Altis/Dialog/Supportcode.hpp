class supportcode {
    idd = 444000;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
		class Text_Background: RscBackground {
			idc = -1;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.132 * safezoneH;
		};

		class Text_Header: RscHeader {
			idc = -1;
			text = $STR_Sup1;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Send: Merimar_RscButtonMenu {
			idc = -1;
			text = $STR_Sup2;
			onButtonClick = "[] call life_fnc_supportCode";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
	
	class controls {
		class Edit_Eingabe: Merimar_RscEdit {
			idc = 444001;
			text = "Gebe hier deinen Supportcode ein";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
	



