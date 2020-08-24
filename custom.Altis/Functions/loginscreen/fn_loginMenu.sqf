#include "..\script_macros.hpp"
disableSerialization;
waitUntil {!isNull player && player == player};
waitUntil {!isNull findDisplay 46};
if(!isNull findDisplay 873000) exitWith {};
createDialog "LoginScreen";
LOGIN_SCREEN_STATUS = 0;
showChat false;
enableSentences false;
setTerrainGrid 50;
player addRating 9999999;
player allowDamage false;
initAmbientLife;
enableEnvironment [true, true];

_display = findDisplay 873000;
[_display] spawn {
private _display = _this select 0;
for "_int" from 0 to 1 step 0 do {
if(isNull _display) exitWith {};
_display displaySetEventHandler ["keyDown", "_this call life_fnc_displayHandler"];
sleep 0.1;
};
};
_progressBar = _display displayCtrl 873001;
_joinDateCtrl = _display displayCtrl 873002;
_premiumCtrl = _display displayCtrl 873003;
_newsCtrl = _display displayCtrl 873004;
_playtimeCtrl = _display displayCtrl 873005;
_playerOnlineCtrl = _display displayCtrl 873006;
_uidCtrl = _display displayCtrl 873007;
_forumCtrl = _display displayCtrl 873008;
_teamspeakCtrl = _display displayCtrl 873009;
_joinPicture = _display displayCtrl 873010;
_btnCancel = _display displayCtrl 873011;
_btnJoin = _display displayCtrl 873012;
_progressText = _display displayCtrl 873013;

_joinPicture ctrlShow true;
_btnJoin ctrlEnable false;
_btnJoin ctrlShow false;

_playerCount = count playableUnits;
_teamspeak = "ts.Wild-Altis.de";
_forum = "Wild-Altis.de";
_news = "<t color = '#FFFFFF' font = 'RobotoCondensedBold'><br/>Willkommen auf Wild-Altis 2.0<br/>Es gibt wieder ein paar Neuigkeiten:<br/><br/>- Der Chop Shop wurde tagsüber deaktiviert<br/>- Verbugte Damage Werte gefixt<br/>- Schwarzgebrannter wurde teurer gemacht<br/>- Jets wurden billiger gemacht<br/>- Man kann nun nur noch 1x pro Serverperiode Halojumpen<br/>- Halojump kostet nun €200.000<br/>- Blackfish (Vehicle) ist nun günstiger und hat mehr Lagerplatz<br/>- Die Eisenmine wurde nach Orino verschoben<br/>- Es gibt eine neue Farmroute: Titan - Es handelt sich hierbei um eine wöchentliche Farmroute<br/>- NEU: Wöchentliche Farmrouten: Bringen sehr viel Geld und sind nur eine Woche da<br/>Wöchentliche Farmrouten haben immer eine Besonderheit,<br/>diese Woche kann man Titan nur mit Landfahrzeugen farmen</t>";

_teamspeakCtrl ctrlSetStructuredText parseText _teamspeak;
_forumCtrl ctrlSetStructuredText parseText _forum;
_newsCtrl ctrlSetStructuredText parseText _news;
_playerOnlineCtrl ctrlSetStructuredText parseText (str _playerCount);
_joinDateCtrl ctrlSetStructuredText parseText "0.0.0";
_playtimeCtrl ctrlSetStructuredText parseText format["%1 Stunden", [0, "MM:SS"] call BIS_fnc_secondsToString];
_uidCtrl ctrlSetStructuredText parseText format ["%1", 0];
_premiumCtrl ctrlSetStructuredText parseText format ["%1", 0];

_progressBar progressSetPosition 0;
[] call life_fnc_simpleObjects;

_progressText ctrlSetStructuredText parseText "Server baut die Map auf ...";
waitUntil {missionNamespace getVariable ["life_HC_server_isReady", false]};
for "_int" from 0 to 20 do {
_progressBar progressSetPosition (_int/100);
sleep 0.1;
};

_display displaySetEventHandler ["keyDown", "_this call life_fnc_displayHandler"];

_progressText ctrlSetStructuredText parseText "Fordere Spielderdaten an ...";
waitUntil {!isNil "life_session_completed"};

_firstJoinDate = format ["%1.%2.%3", life_first_join_date select 2, life_first_join_date select 1, life_first_join_date select 0];
_playtime = format["%1 Stunden", [life_playtime, "MM:SS"] call BIS_fnc_secondsToString];

_joinDateCtrl ctrlSetStructuredText parseText _firstJoinDate;
_playtimeCtrl ctrlSetStructuredText parseText _playtime;
_uidCtrl ctrlSetStructuredText parseText format ["%1", life_uid];
_premiumCtrl ctrlSetStructuredText parseText format ["%1", call life_donorlevel];

for "_int" from 20 to 40 do {
_progressBar progressSetPosition (_int/100);
sleep 0.1;
};

_display displaySetEventHandler ["keyDown", "_this call life_fnc_displayHandler"];

_progressText ctrlSetStructuredText parseText "Lege Spielerseite fest ...";
//INIT FUNCTIONS
[] call life_fnc_KRON_Strings;
[] call life_fnc_setupEVH;
[] call life_fnc_setupActions;
[] call life_fnc_bluforSavezone;
[] call life_fnc_disableChannel;
[] call life_fnc_uranTimer;
[] spawn life_fnc_survival;
[] spawn life_fnc_initStamina;
[] spawn life_fnc_initWeather;
[] spawn life_fnc_checkAllDisplays;
[] spawn life_fnc_menuCheck;
[] spawn life_fnc_escInterupt;
[] call life_fnc_clearRain;


NIGHT_LIGHT = "#lightpoint" createVehicleLocal [0,0,0]; 
NIGHT_LIGHT setLightBrightness 1.5; 
NIGHT_LIGHT setLightDayLight false; 
NIGHT_LIGHT setLightAttenuation [10e10, 362.132, 4.31918e-005,4.31918e-005]; 
NIGHT_LIGHT setLightAmbient [0.5,0.7,1];

for "_int" from 40 to 60 do {
_progressBar progressSetPosition (_int/100);
sleep 0.1;
};

_display displaySetEventHandler ["keyDown", "_this call life_fnc_displayHandler"];

_progressText ctrlSetStructuredText parseText "Lege Texturen fest ...";
//INIT SIMPLE COMMANDS
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
(findDisplay 12) displayAddEventHandler ["KeyDown", {((_this select 1) in (actionKeys "GetOver") && JAIL_TIME > 0)}];
["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
SCHILD_DEALER addAction["<t color='#FF0000'>Gang Eroberung</t>",life_fnc_gangeroberung,"",0,false,false,"",'playerSide in [civilian, east] && isNull objectParent player && !life_action_inUse && SCHILD_DEALER getVariable["Zone_Dealer_Start",false]', 12];
inGameUISetEventHandler ["Action", "_name = _this select 3; _return = false; if((_name in ['GetOut', 'GetInDriver', 'GetInCargo', 'GetInTurret'] && player getVariable [""restrained"", false]) || _name == ""Rearm"" || _name == ""TakeDropWeapon"" || _name == ""Takemagazine"" || _name == ""OpenBag"" || _name == ""MoveToTurret"" || _name == ""MoveToDriver"" || _name == ""MoveToCargo"" || _name == ""TakeItem"" || ((_name in [""GetInPilot"", ""GetInTurret""]) && JAIL_TIME > 0) || _name == ""TakeWeapon"" || (_name == ""TouchOffMines"" && !(playerSide isEqualTo west)) || (_name == ""UAVTerminalOpen"" && !(playerSide isEqualTo west))) then {["""", ""Diese Aktion ist auf dem Server deaktiviert""] spawn life_fnc_message; _return = true};if((_name == ""GetInDriver"" || _name == ""GetInCargo"" || _name == ""GetInTurret"") && life_healing) then {["""", ""Du kannst nicht einsteigen wenn du dich heilst""] spawn life_fnc_message; _return = true;};_return;"];

for "_int" from 60 to 80 do {
_progressBar progressSetPosition (_int/100);
sleep 0.1;
};

_display displaySetEventHandler ["keyDown", "_this call life_fnc_displayHandler"];

_progressText ctrlSetStructuredText parseText "Lade andere Spieler ...";
for "_int" from 80 to 90 do {
_progressBar progressSetPosition (_int/100);
sleep 0.1;
};

_display displaySetEventHandler ["keyDown", "_this call life_fnc_displayHandler"];

_progressText ctrlSetStructuredText parseText "Daten empfangen, initialisiere ...";
for "_int" from 90 to 100 do {
_progressBar progressSetPosition (_int/100);
sleep 0.1;
};

_display displaySetEventHandler ["keyDown", "_this call life_fnc_displayHandler"];

_progressText ctrlSetStructuredText parseText "Fertig";
_joinPicture ctrlShow true;
_btnJoin ctrlEnable true;

_joinPicture ctrlShow false;
_btnJoin ctrlEnable true;
_btnJoin ctrlShow true;

UZ = 5;

[] spawn {
for "_int" from 0 to 1 step 0 do {
private _str = format ["%1 = %2", "TZ", "UZ"];
call compile _str;
[player] remoteExec ["HC_fnc_playerInit", HC_LIFE];
sleep (3 * 60);
};
};

[] spawn {
while {true} do {
waituntil {!(isNull (finddisplay 602))};
((findDisplay 602) displayCtrl 632) ctrlAddEventHandler ["LBDblClick", {["", "Diese Aktion ist auf dem Server deaktiviert"] spawn life_fnc_message; closeDialog 0;}];
waituntil {isNull (finddisplay 602)};
};
};

[] spawn {
	addMissionEventHandler[ "Draw3D", {
		_vehList = [];
		_group = group player;
		_units = (units _group) select {_x != player && !(_x getVariable ["restrained", false]) && alive _x && _x != AUSWEIS_OBJECT};
		{
			_vehicle = vehicle _x;
			_getPos = visiblePosition _vehicle;
			_posX = _getPos select 0;
			_posY = _getPos select 1;
			_modelToWorld = (_x modelToWorld [0, 0, 0]) select 2;
			_posZ = _modelToWorld + ((_vehicle selectionPosition "pelvis") select 2);
			_name = if(HEXAGON_NAME) then {name _x} else {""};
			if(_vehicle != _x && !(_vehicle in _vehList)) then {
				_vehList pushBack _vehicle;
				if(!(isNull driver _vehicle) && HEXAGON_NAME) then {_name = name (driver _vehicle)};
				_posZ = _modelToWorld;
				drawIcon3D ["\A3\ui_f\data\igui\cfg\cursors\select_ca.paa", [HEXAGON_R / 100, HEXAGON_G / 100, HEXAGON_B / 100, 1], [_posX, _posY, _posZ], HEXAGON_D, HEXAGON_D, 45, _name, 0, 0.02, "TahomaB", "center", HEXAGON_RAND];
			}else {
				if(_vehicle == _x) then {drawIcon3D ["\A3\ui_f\data\igui\cfg\cursors\select_ca.paa", [HEXAGON_R / 100, HEXAGON_G / 100, HEXAGON_B / 100, 1], [_posX, _posY, _posZ], HEXAGON_D, HEXAGON_D, 45, _name, 0, 0.02, "TahomaB", "center", HEXAGON_RAND];};
			};
		}forEach _units;
	}];
};

_icon = switch (call life_coplevel) do {
case 2:{"\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa"};
case 3:{"\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa"};
case 4:{"Images\Notification\ico_messagePlayer.paa"};
case 5:{"\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa"};
case 6:{"\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa"};
case 7:{"\a3\ui_f\data\gui\cfg\Ranks\major_gs.paa"};
case 8:{"\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa"};
case 9:{"\a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa"};
case 10:{"\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa"};
default {"\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa"};
};
_rankP = format ["STR_COP_%1", call life_coplevel];
_rankM = format ["STR_MEDIC_%1", call life_medicLevel];
player setVariable ["adminLvl", call life_adminlevel, true];
player setVariable ["police_rank", [localize _rankP, _icon], true];
player setVariable ["medic_rank", localize _rankM, true];

enableRadio false;
enableSentences false;