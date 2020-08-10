["Verlasse alle aktuellen RP Ereignisse und verlasse den Server. Finde dich anschliesend im Support ein!", "Du wurdest in den Support gerufen", 30] spawn life_fnc_message;

private _info = (findDisplay 46) ctrlCreate ["Life_RscStructuredText", -1]; 
_info ctrlSetStructuredText parseText "Admin Information<br/>-------------------<br/>!FINDE DICH <t color = '#FF0000'>UMGEHEND</t> IM SUPPORT EIN!"; 
_info ctrlSetFont "TahomaB"; 
_info ctrlSetPosition [(0.234479 * safezoneW + safezoneX) + 0.04, (0.423 * safezoneH + safezoneY) + 0.09, 0.208802 * safezoneW, 0.1 * safezoneH]; 
_info ctrlSetBackgroundColor [0, 0, 0, 0]; 
_info ctrlSetFade 0; 
_info ctrlCommit 0; 
_info ctrlSetFade 1; 
_info ctrlCommit 35; 
sleep 35; 
ctrlDelete _info; 