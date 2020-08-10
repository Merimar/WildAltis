class TextOverDialog {
    onLoad = "uiNamespace setVariable ['TextOver', _this select 0]";
	idd = 4400;
    duration = 4;
    fadein = 0;
    fadeout = 2;
	
	class controlsBackground {};

	class controls {
		class Message : Trans_Text {
			idc = 4401;
			text = "";
			sizeEx = 0.06;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.066 * safezoneH;	
		};
	};
};