#include "..\script_macros.hpp"
disableSerialization;

private _AusweisVorname = param [0, ""];
private _AusweisNachname = param [1, ""];
private _AusweisStaat = param [2, ""];
private _AusweisProvince = param [3, ""];
private _AusweisCity = param [4, ""];
private _AusweisPlz = param [5, ""];
private _AusweisStreet = param [6, ""];
private _AusweisNumber = param [7, ""];
private _AusweisUID = param [8, ""];
private _AusweisPlaytime = param [9, ""];
private _AusweisFace = param [10, ""];

private _display = findDisplay 46;

_random = random(1000);
ID_ARRAY pushBack _random;

waitUntil {(ID_ARRAY param [0,-1]) isEqualTo _random};

AUSWEIS_OBJECT setFace _AusweisFace;
AUSWEIS_CAMERA = "camera" camCreate (getPos AUSWEIS_MONEY);
AUSWEIS_CAMERA camSetTarget AUSWEIS_MONEY;
AUSWEIS_CAMERA camSetRelPos [0,-0.1,-0.1];
AUSWEIS_CAMERA camCommit 0;
AUSWEIS_CAMERA camSetFov 0.6;
AUSWEIS_CAMERA camCommit 0;
AUSWEIS_CAMERA cameraEffect ["Internal", "Back", "aus"];

private _background = _display ctrlCreate ["RscText", -1];
_background ctrlSetText "";
_background ctrlSetPosition [0.013589 * safezoneW + safezoneX, 0.808 * safezoneH + safezoneY,0.227682 * safezoneW, 0.187 * safezoneH];
_background ctrlSetBackgroundColor [0.102,0.114,0.161,0.8];
_background ctrlCommit 0;

private _sider = _display ctrlCreate ["RscText", -1];
_sider ctrlSetText "";
_sider ctrlSetPosition [0.013589 * safezoneW + safezoneX, 0.808 * safezoneH + safezoneY,0.227682 * safezoneW, 0.0055 * safezoneH];
_sider ctrlSetBackgroundColor [0.86,0.07,0.188,1];
_sider ctrlCommit 0;

private _header = _display ctrlCreate ["RscStructuredText", -1];
_header ctrlSetStructuredText parseText "<t color = '#BBBBC4'>Personalausweis</t>";
_header ctrlSetPosition [0.013589 * safezoneW + safezoneX, 0.775 * safezoneH + safezoneY,0.227682 * safezoneW, 0.033 * safezoneH];
_header ctrlSetBackgroundColor [0.102,0.114,0.161,1];
_header ctrlCommit 0;

private _cameraPicture = _display ctrlCreate ["RscPicture", -1];
_cameraPicture ctrlSetText "#(argb,256,256,1)r2t(aus,1.0);";
_cameraPicture ctrlSetPosition [0.0239382 * safezoneW + safezoneX,0.83 * safezoneH + safezoneY,0.0827934 * safezoneW, 0.099 * safezoneH];
_cameraPicture ctrlCommit 0;

private _vorname = _display ctrlCreate ["RscText", -1];
_vorname ctrlSetText "Vorname";
_vorname ctrlSetPosition [0.111906 * safezoneW + safezoneX, 0.83 * safezoneH + safezoneY,0.0362221 * safezoneW, 0.011 * safezoneH];
_vorname ctrlSetTextColor [0.7333,0.7333,0.77,1];
_vorname ctrlSetBackgroundColor [0, 0, 0, -1];
_vorname ctrlCommit 0;

private _nachname = _display ctrlCreate ["RscText", -1];
_nachname ctrlSetText "Nachname";
_nachname ctrlSetPosition [0.179176 * safezoneW + safezoneX, 0.83 * safezoneH + safezoneY,0.0413967 * safezoneW, 0.011 * safezoneH];
_nachname ctrlSetTextColor [0.7333,0.7333,0.77,1];
_nachname ctrlSetBackgroundColor [0, 0, 0, -1];
_nachname ctrlCommit 0;

private _adresse = _display ctrlCreate ["RscText", -1];
_adresse ctrlSetText "Adresse";
_adresse ctrlSetPosition [0.111906 * safezoneW + safezoneX, 0.885 * safezoneH + safezoneY,0.0310475 * safezoneW, 0.011 * safezoneH];
_adresse ctrlSetTextColor [0.7333,0.7333,0.77,1];
_adresse ctrlSetBackgroundColor [0, 0, 0, -1];
_adresse ctrlCommit 0;

private _spielzeit = _display ctrlCreate ["RscText", -1];
_spielzeit ctrlSetText "Spielzeit";
_spielzeit ctrlSetPosition [0.0606813 * safezoneW + safezoneX, 0.94 * safezoneH + safezoneY,0.0351801 * safezoneW, 0.0193333 * safezoneH];
_spielzeit ctrlSetTextColor [0.7333,0.7333,0.77,1];
_spielzeit ctrlSetBackgroundColor [0, 0, 0, -1];
_spielzeit ctrlCommit 0;

private _uid = _display ctrlCreate ["RscText", -1];
_uid ctrlSetText "UID";
_uid ctrlSetPosition [0.0239382 * safezoneW + safezoneX, 0.94 * safezoneH + safezoneY,0.0155238 * safezoneW, 0.0193333 * safezoneH];
_uid ctrlSetTextColor [0.7333,0.7333,0.77,1];
_uid ctrlSetBackgroundColor [0, 0, 0, -1];
_uid ctrlCommit 0;

private _changeUID = _display ctrlCreate ["RscText", -1];
_changeUID ctrlSetText _AusweisUID;
_changeUID ctrlSetPosition [0.0239382 * safezoneW + safezoneX, 0.962 * safezoneH + safezoneY,0.0362221 * safezoneW, 0.011 * safezoneH];
_changeUID ctrlSetTextColor [1,0.83,0.247,1];
_changeUID ctrlSetBackgroundColor [0, 0, 0, -1];
_changeUID ctrlCommit 0;

private _changePlaytime = _display ctrlCreate ["RscText", -1];
_changePlaytime ctrlSetText _AusweisPlaytime;
_changePlaytime ctrlSetPosition [0.0601603 * safezoneW + safezoneX, 0.962 * safezoneH + safezoneY,0.0569204 * safezoneW, 0.011 * safezoneH];
_changePlaytime ctrlSetTextColor [1,0.83,0.247,1];
_changePlaytime ctrlSetBackgroundColor [0, 0, 0, -1];
_changePlaytime ctrlCommit 0;

private _changeVorname = _display ctrlCreate ["RscText", -1];
_changeVorname ctrlSetText _AusweisVorname;
_changeVorname ctrlSetPosition [0.112427 * safezoneW + safezoneX, 0.84737 * safezoneH + safezoneY,0.0672696 * safezoneW, 0.022 * safezoneH];
_changeVorname ctrlSetTextColor [1,0.83,0.247,1];
_changeVorname ctrlSetBackgroundColor [0, 0, 0, -1];
_changeVorname ctrlCommit 0;

private _changeNachname = _display ctrlCreate ["RscText", -1];
_changeNachname ctrlSetText _AusweisNachname;
_changeNachname ctrlSetPosition [0.174001 * safezoneW + safezoneX, 0.84737 * safezoneH + safezoneY,0.062095 * safezoneW, 0.022 * safezoneH];
_changeNachname ctrlSetTextColor [1,0.83,0.247,1];
_changeNachname ctrlSetBackgroundColor [0, 0, 0, -1];
_changeNachname ctrlCommit 0;

private _changeHausnummer = _display ctrlCreate ["RscText", -1];
_changeHausnummer ctrlSetText _AusweisNumber;
_changeHausnummer ctrlSetPosition [0.174001 * safezoneW + safezoneX, 0.951 * safezoneH + safezoneY,0.0103492 * safezoneW, 0.022 * safezoneH];
_changeHausnummer ctrlSetTextColor [1,0.83,0.247,1];
_changeHausnummer ctrlSetBackgroundColor [0, 0, 0, -1];
_changeHausnummer ctrlCommit 0;

private _changePlz = _display ctrlCreate ["RscText", -1];
_changePlz ctrlSetText _AusweisPlz;
_changePlz ctrlSetPosition [0.153303 * safezoneW + safezoneX, 0.929 * safezoneH + safezoneY,0.0258729 * safezoneW, 0.022 * safezoneH];
_changePlz ctrlSetTextColor [1,0.83,0.247,1];
_changePlz ctrlSetBackgroundColor [0, 0, 0, -1];
_changePlz ctrlCommit 0;

private _changeStreet = _display ctrlCreate ["RscText", -1];
_changeStreet ctrlSetText _AusweisStreet;
_changeStreet ctrlSetPosition [0.111906 * safezoneW + safezoneX, 0.951 * safezoneH + safezoneY,0.062095 * safezoneW, 0.022 * safezoneH];
_changeStreet ctrlSetTextColor [1,0.83,0.247,1];
_changeStreet ctrlSetBackgroundColor [0, 0, 0, -1];
_changeStreet ctrlCommit 0;

private _changeCity = _display ctrlCreate ["RscText", -1];
_changeCity ctrlSetText _AusweisCity;
_changeCity ctrlSetPosition [0.111906 * safezoneW + safezoneX, 0.929 * safezoneH + safezoneY,0.0465713 * safezoneW, 0.022 * safezoneH];
_changeCity ctrlSetTextColor [1,0.83,0.247,1];
_changeCity ctrlSetBackgroundColor [0, 0, 0, -1];
_changeCity ctrlCommit 0;

private _changeCountry = _display ctrlCreate ["RscText", -1];
_changeCountry ctrlSetText _AusweisStaat;
_changeCountry ctrlSetPosition [0.111906 * safezoneW + safezoneX, 0.907 * safezoneH + safezoneY,0.0362221 * safezoneW, 0.022 * safezoneH];
_changeCountry ctrlSetTextColor [1,0.83,0.247,1];
_changeCountry ctrlSetBackgroundColor [0, 0, 0, -1];
_changeCountry ctrlCommit 0;

private _changeProvince = _display ctrlCreate ["RscText", -1];
_changeProvince ctrlSetText _AusweisProvince;
_changeProvince ctrlSetPosition [0.142954 * safezoneW + safezoneX, 0.907 * safezoneH + safezoneY,0.0827934 * safezoneW, 0.022 * safezoneH];
_changeProvince ctrlSetTextColor [1,0.83,0.247,1];
_changeProvince ctrlSetBackgroundColor [0, 0, 0, -1];
_changeProvince ctrlCommit 0;

sleep 10;

ctrlDelete _background;
ctrlDelete _sider;
ctrlDelete _header;
ctrlDelete _cameraPicture;
ctrlDelete _vorname;
ctrlDelete _nachname;
ctrlDelete _adresse;
ctrlDelete _spielzeit;
ctrlDelete _uid;
ctrlDelete _changeUID;
ctrlDelete _changeVorname;
ctrlDelete _changeNachname;
ctrlDelete _changeHausnummer;
ctrlDelete _changePlz;
ctrlDelete _changeStreet;
ctrlDelete _changeCity;
ctrlDelete _changeCountry;
ctrlDelete _changeProvince;
ctrlDelete _changePlaytime;

camDestroy AUSWEIS_CAMERA;

sleep 1.5;

ID_ARRAY deleteAt 0;