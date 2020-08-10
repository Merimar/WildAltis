class TicketGive {
    idd = 2650;
    movingEnable = 0;
    enableSimulation = 1;

	class controlsBackground {		
		class Picture_Background: RscPicture {
			idc = -1;
			text = "Images\Dialog\Interaction.jpg";
			x = 0.43113 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.149651 * safezoneW;
			h = 0.451 * safezoneH;
		};	
		
		class Text_Sider1: RscSiderHorizontal {
			idc = -1;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
		};	
		class Text_Info1: Trans_Text {
			idc = -1;
			text = "Ticket €:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.048125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info2: Trans_Text {
			idc = -1;
			text = "Ticket %:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.048125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info3: Trans_Text {
			idc = -1;
			text = "Eigenes Ticket €:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.075625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Info4: Trans_Text {
			idc = -1;
			text = "Eigenes Ticket %:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.075625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Text_Info5: Trans_TextHeader {
			idc = -1;
			text = "Ticketsystem:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Info6: Trans_TextHeader {
			idc = -1;
			text = "Optionen:";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls {
		class List_Crimes: Merimar_RscListBox {
			idc = 2651;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.121 * safezoneH;
			sizeEx = 0.03;
			colorBackground[] = {0.25,0.3,0.32,0.4};
		};	

		class Text_Money: Trans_Text {
			idc = 2652;
			text = "";
			x = 0.493125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Percentage: Trans_Text {
			idc = 2653;
			text = "";
			x = 0.493125 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Edit_Money: Trans_Edit {
			idc = 2654;
			sizeEx = 0.04;
			x = 0.517187 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};	

		class Edit_Percentage: Trans_Edit {
			idc = 2655;
			sizeEx = 0.04;
			x = 0.517187 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Checkbox_Percentage1: Trans_Checkbox {
			idc = 2656;
			x = 0.555 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Checkbox_Percentage2: Trans_Checkbox {
			idc = 2657;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Checkbox_Money1: Trans_Checkbox {
			idc = 2658;
			x = 0.555 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Checkbox_Money2: Trans_Checkbox {
			idc = 2659;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Btn_Ticket: Trans_Button {
			idc = 2660;
			text = "Ticket";
			onButtonClick = "[false] spawn life_fnc_ticketGive;";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.048125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Btn_Force: Trans_Button {
			idc = 2661;
			text = "Zwangsticket";
			onButtonClick = "[true] spawn life_fnc_ticketGive;";
			x = 0.493125 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class TicketPay {
    idd = 2600;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
		class Picture_Background: RscPicture {
			idc = -1;
			text = "Images\Dialog\Interaction.jpg";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.44 * safezoneH;
		};

		class Sider_1: RscSiderHorizontal {
			idc = -1;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
		};

		class Sider_2: RscSiderHorizontal {
			idc = -1;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
		};
	};
	
	class controls {
		class List_Crimes: Merimar_RscListBox {
			idc = 2601;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.132 * safezoneH;
			sizeEx = 0.02;
			colorBackground[] = {0.25,0.3,0.32,0.4};
		};

		class Text_Info: Trans_StructuredText {
			idc = 2602;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.11 * safezoneH;
		};

		class Btn_Ticket: Trans_Button {
			idc = 2603;
			text = "Zahlen";
			onButtonClick = "TICKET_PAYED = true; closeDialog 0;";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Btn_Refuse: Trans_Button {
			idc = 2604;
			text = "Nicht zahlen";
			onButtonClick = "TICKET_PAYED = false; closeDialog 0;";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};