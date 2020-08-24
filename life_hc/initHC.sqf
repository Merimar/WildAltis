#include "hc_macros.hpp"
/*
    File: fn_initHC.sqf
    Author: Nanou

    Description:
    Initialize the headless client.
*/
private ["_timeStamp"];
[] execVM "\life_hc\KRON_Strings.sqf";

life_HC_server_isReady = false;
publicVariable "life_HC_server_isReady";
life_HC_server_extDB_notLoaded = "";
PLAYTIME = [];
PAYCHECK_HANDLE = [];
VEHICLE_LIST = [];
PLAYER_GANG_ARRAY = [];
ACTIVE_BUFFS = [];
GANG_DEALER = false;
GANG_DEALER_POSITIONS = [getPos gangdealer_1, getPos gangdealer_2, getPos gangdealer_3, getPos gangdealer_4];
CRIME_LIST = [];
CURRENT_TICKET_LIST = [];
CURRENT_TICKET_PLAYER = objNull;
CURRENT_AUSWEIS_CREATE = [];
AAN_NEWS = false;
JOIN_IN_PROGRESS = [];
DEBUG_ARRAY = [];
DEATH_ARRAY = [];
DEBUG = false;
publicVariable "AAN_NEWS";

SKILL_REPAIR_TIME = [0.6,0.59,0.58,0.57,0.56,0.55,0.545,0.54,0.535,0.53,0.525,0.52,0.515,0.51,0.505,0.5,0.495,0.49,0.485,0.48,0.475,0.47,0.465,0.46,0.455,0.45,0.445,0.44,0.435,0.43,0.425,0.42,0.415,0.41,0.405,0.4,0.395,0.39,0.385,0.38,0.375,0.37,0.365,0.36,0.355,0.35,0.345,0.34,0.335,0.33,0.325,0.32,0.315,0.31,0.305,0.3,0.2975,0.295,0.2925,0.29,0.2875,0.285,0.2825,0.28,0.2775,0.275,0.2725,0.27,0.2675,0.265,0.2625,0.26,0.2575,0.255,0.2525,0.25,0.2475,0.245,0.2425,0.24,0.2375,0.235,0.2325,0.23,0.2275,0.225,0.2225,0.22,0.2175,0.215,0.2125,0.21,0.2075,0.205,0.2025,0.2,0.1975,0.195,0.1925,0.19,0.1875]; 
SKILL_PROCESS_TIME = [0.3,0.295,0.29,0.285,0.28,0.275,0.27,0.2675,0.265,0.2625,0.26,0.2575,0.255,0.2525,0.25,0.2475,0.245,0.2425,0.24,0.2375,0.235,0.2325,0.23,0.2275,0.225,0.2225,0.22,0.2175,0.215,0.2125,0.21,0.2075,0.205,0.2035,0.202,0.2005,0.199,0.1975,0.196,0.1945,0.193,0.1915,0.19,0.1885,0.187,0.1855,0.184,0.1825,0.181,0.1795,0.178,0.1765,0.175,0.1735,0.172,0.1705,0.169,0.1675,0.166,0.1645,0.163,0.162,0.161,0.16,0.159,0.158,0.157,0.156,0.155,0.154,0.153,0.152,0.151,0.15,0.149,0.148,0.147,0.146,0.145,0.144,0.143,0.142,0.141,0.14,0.139,0.138,0.137,0.136,0.135,0.134,0.133,0.132,0.131,0.13,0.129,0.128,0.127,0.126,0.125,0.124,0.123]; 
SKILL_LOCKPICK_CHANCE = [30,35,40,42,44,46,48,50,51,52,53,54,55,56,57,58,59,60,60.5,61,61.5,62,62.5,63,63.5,64,64.5,65,65.5,66,66.5,67,67.5,68,68.5,69,69.5,70,70.5,71,71.5,72,72.5,73,73.5,74,74.5,75,75.5,76,76.5,77,77.5,78,78.5,79,79.5,80,80.25,80.5,80.75,81,81.25,81.5,81.75,82,82.25,82.5,82.75,83,83.25,83.5,83.75,84,84.25,84.5,84.75,85,85.25,85.5,85.75,86,86.25,86.5,86.75,87,87.25,87.5,87.75,88,88.25,88.5,88.75,89,89.25,89.5,89.75,90,90.25,90.5,90.75]; 
SKILL_BOLTCUTTER_VALUE = [3.6,3.55,3.5,3.45,3.4,3.35,3.3,3.25,3.2,3.15,3.1,3.075,3.05,3.025,3,2.975,2.95,2.925,2.9,2.875,2.85,2.825,2.8,2.775,2.75,2.725,2.7,2.675,2.65,2.625,2.6,2.575,2.55,2.525,2.5,2.475,2.45,2.425,2.4,2.375,2.35,2.345,2.34,2.335,2.33,2.325,2.32,2.315,2.31,2.305,2.3,2.295,2.29,2.285,2.28,2.275,2.27,2.265,2.26,2.255,2.25,2.245,2.24,2.235,2.23,2.225,2.22,2.215,2.21,2.205,2.2,2.195,2.19,2.185,2.18,2.175,2.17,2.165,2.16,2.155,2.15,2.145,2.14,2.135,2.13,2.125,2.12,2.115,2.11,2.105,2.1,2.095,2.09,2.085,2.08,2.075,2.07,2.065,2.06,2.055,2.05]; 
SKILL_HEAL_VALUE = [0.25,0.24,0.23,0.22,0.21,0.2,0.19,0.18,0.17,0.16,0.15,0.14,0.13,0.12,0.11,0.1,0.09,0.08,0.07,0.06,0.05,0.04,0.03,0.02,0.01,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; 
SKILL_STAMINA_VALUE = [100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,480,490,500,510,520,530,540,550,560,570,580,590,600,610,620,630,640,650,660,670,680,690,700,710,720,730,740,750,760,770,780,790,800,810,820,830,840,850,860,870,880,890,900,910,920,930,940,950,960,970,980,990,1000,1010,1020,1030,1040,1050,1060,1070,1080,1090,1100]; 
SKILL_IMPOUND_TIME = [0.4,0.39,0.38,0.37,0.36,0.35,0.345,0.34,0.335,0.33,0.325,0.32,0.315,0.31,0.305,0.3,0.295,0.29,0.285,0.28,0.275,0.27,0.265,0.26,0.255,0.25,0.245,0.24,0.235,0.23,0.225,0.22,0.215,0.21,0.205,0.2,0.195,0.19,0.185,0.18,0.175,0.17,0.165,0.16,0.155,0.15,0.145,0.14,0.135,0.13,0.125,0.12,0.115,0.11,0.105,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1]; 
SKILL_DP_VALUE = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]; 
SKILL_DRUGS_VALUE = [ [100,0,0,0,0,0,0,0,0,0], [80,20,0,0,0,0,0,0,0,0], [60,40,0,0,0,0,0,0,0,0], [40,30,30,0,0,0,0,0,0,0], [30,40,30,0,0,0,0,0,0,0], [10,50,40,0,0,0,0,0,0,0], [0,40,40,20,0,0,0,0,0,0], [0,30,50,20,0,0,0,0,0,0], [0,20,50,30,0,0,0,0,0,0], [0,15,50,35,0,0,0,0,0,0], [0,10,50,40,0,0,0,0,0,0], [0,10,45,45,0,0,0,0,0,0], [0,5,45,50,0,0,0,0,0,0], [0,5,40,55,0,0,0,0,0,0], [0,0,35,60,5,0,0,0,0,0], [0,0,30,60,10,0,0,0,0,0], [0,0,30,55,15,0,0,0,0,0], [0,0,25,55,20,0,0,0,0,0], [0,0,25,50,25,0,0,0,0,0], [0,0,25,45,30,0,0,0,0,0], [0,0,20,45,35,0,0,0,0,0], [0,0,20,40,40,0,0,0,0,0], [0,0,15,40,45,0,0,0,0,0], [0,0,15,35,50,0,0,0,0,0], [0,0,10,35,55,0,0,0,0,0], [0,0,10,30,60,0,0,0,0,0], [0,0,5,30,60,5,0,0,0,0], [0,0,5,30,55,10,0,0,0,0], [0,0,5,25,55,15,0,0,0,0], [0,0,5,25,50,20,0,0,0,0], [0,0,0,25,50,25,0,0,0,0], [0,0,0,25,45,30,0,0,0,0], [0,0,0,20,45,35,0,0,0,0], [0,0,0,20,40,40,0,0,0,0], [0,0,0,15,40,45,0,0,0,0], [0,0,0,10,40,50,0,0,0,0], [0,0,0,10,35,55,0,0,0,0], [0,0,0,5,35,60,0,0,0,0], [0,0,0,5,35,60,0,0,0,0], [0,0,0,5,35,55,5,0,0,0], [0,0,0,5,30,55,10,0,0,0], [0,0,0,5,30,50,15,0,0,0], [0,0,0,5,25,50,20,0,0,0], [0,0,0,0,25,50,25,0,0,0], [0,0,0,0,20,50,30,0,0,0], [0,0,0,0,20,45,35,0,0,0], [0,0,0,0,15,45,40,0,0,0], [0,0,0,0,10,45,45,0,0,0], [0,0,0,0,10,40,50,0,0,0], [0,0,0,0,5,40,55,0,0,0], [0,0,0,0,5,35,60,0,0,0], [0,0,0,0,5,35,60,0,0,0], [0,0,0,0,5,30,65,0,0,0], [0,0,0,0,0,25,70,5,0,0], [0,0,0,0,0,25,65,10,0,0], [0,0,0,0,0,20,65,15,0,0], [0,0,0,0,0,20,60,20,0,0], [0,0,0,0,0,15,60,25,0,0], [0,0,0,0,0,15,55,30,0,0], [0,0,0,0,0,10,55,35,0,0], [0,0,0,0,0,5,55,40,0,0], [0,0,0,0,0,5,50,45,0,0], [0,0,0,0,0,0,50,50,0,0], [0,0,0,0,0,0,45,55,0,0], [0,0,0,0,0,0,40,60,0,0], [0,0,0,0,0,0,35,65,0,0], [0,0,0,0,0,0,30,65,5,0], [0,0,0,0,0,0,35,55,10,0], [0,0,0,0,0,0,30,55,15,0], [0,0,0,0,0,0,25,55,20,0], [0,0,0,0,0,0,25,50,25,0], [0,0,0,0,0,0,20,50,30,0], [0,0,0,0,0,0,20,45,35,0], [0,0,0,0,0,0,20,40,40,0], [0,0,0,0,0,0,15,40,45,0], [0,0,0,0,0,0,10,40,50,0], [0,0,0,0,0,0,10,35,55,0], [0,0,0,0,0,0,10,30,60,0], [0,0,0,0,0,0,8,30,62,0], [0,0,0,0,0,0,6,30,64,0], [0,0,0,0,0,0,4,30,66,0], [0,0,0,0,0,0,4,28,68,0], [0,0,0,0,0,0,2,28,70,0], [0,0,0,0,0,0,0,25,70,5], [0,0,0,0,0,0,0,25,70,5], [0,0,0,0,0,0,0,25,65,10], [0,0,0,0,0,0,0,25,65,10], [0,0,0,0,0,0,0,25,60,15], [0,0,0,0,0,0,0,20,60,20], [0,0,0,0,0,0,0,20,55,25], [0,0,0,0,0,0,0,20,55,25], [0,0,0,0,0,0,0,20,55,25], [0,0,0,0,0,0,0,15,65,20], [0,0,0,0,0,0,0,15,60,25], [0,0,0,0,0,0,0,15,55,30], [0,0,0,0,0,0,0,15,50,35], [0,0,0,0,0,0,0,15,45,40], [0,0,0,0,0,0,0,10,45,45], [0,0,0,0,0,0,0,0,50,50], [0,0,0,0,0,0,0,0,25,75], [0,0,0,0,0,0,0,0,0,100]]; 
SKILL_LIGHTWEIGHT_VALUE = [ [100,0,0,0,0,0,0,0,0,0,0,0,0,0], [80,20,0,0,0,0,0,0,0,0,0,0,0,0], [40,50,10,0,0,0,0,0,0,0,0,0,0,0], [10,50,30,10,0,0,0,0,0,0,0,0,0,0], [5,45,30,20,0,0,0,0,0,0,0,0,0,0], [0,40,40,20,0,0,0,0,0,0,0,0,0,0], [0,30,40,30,0,0,0,0,0,0,0,0,0,0], [0,20,50,30,0,0,0,0,0,0,0,0,0,0], [0,10,40,40,10,0,0,0,0,0,0,0,0,0], [0,5,40,40,15,0,0,0,0,0,0,0,0,0], [0,5,35,40,20,0,0,0,0,0,0,0,0,0], [0,0,30,45,25,0,0,0,0,0,0,0,0,0], [0,0,25,45,30,0,0,0,0,0,0,0,0,0], [0,0,20,45,35,0,0,0,0,0,0,0,0,0], [0,0,15,40,40,5,0,0,0,0,0,0,0,0], [0,0,10,40,40,10,0,0,0,0,0,0,0,0], [0,0,5,40,40,15,0,0,0,0,0,0,0,0], [0,0,0,35,45,20,0,0,0,0,0,0,0,0], [0,0,0,25,50,25,0,0,0,0,0,0,0,0], [0,0,0,25,45,30,0,0,0,0,0,0,0,0], [0,0,0,20,45,35,0,0,0,0,0,0,0,0], [0,0,0,20,40,40,0,0,0,0,0,0,0,0], [0,0,0,15,40,45,0,0,0,0,0,0,0,0], [0,0,0,10,40,50,0,0,0,0,0,0,0,0], [0,0,0,10,35,50,5,0,0,0,0,0,0,0], [0,0,0,5,35,50,10,0,0,0,0,0,0,0], [0,0,0,5,30,50,15,0,0,0,0,0,0,0], [0,0,0,5,30,45,20,0,0,0,0,0,0,0], [0,0,0,5,25,45,25,0,0,0,0,0,0,0], [0,0,0,5,25,40,30,0,0,0,0,0,0,0], [0,0,0,5,20,40,35,0,0,0,0,0,0,0], [0,0,0,5,15,40,40,0,0,0,0,0,0,0], [0,0,0,0,15,40,45,0,0,0,0,0,0,0], [0,0,0,0,15,35,50,0,0,0,0,0,0,0], [0,0,0,0,10,35,50,5,0,0,0,0,0,0], [0,0,0,0,5,30,55,10,0,0,0,0,0,0], [0,0,0,0,5,30,50,15,0,0,0,0,0,0], [0,0,0,0,0,30,50,20,0,0,0,0,0,0], [0,0,0,0,0,30,45,25,0,0,0,0,0,0], [0,0,0,0,0,25,45,30,0,0,0,0,0,0], [0,0,0,0,0,25,40,35,0,0,0,0,0,0], [0,0,0,0,0,20,40,40,0,0,0,0,0,0], [0,0,0,0,0,15,40,45,0,0,0,0,0,0], [0,0,0,0,0,15,35,50,0,0,0,0,0,0], [0,0,0,0,0,10,35,50,5,0,0,0,0,0], [0,0,0,0,0,10,30,50,10,0,0,0,0,0], [0,0,0,0,0,5,30,50,15,0,0,0,0,0], [0,0,0,0,0,5,30,45,20,0,0,0,0,0], [0,0,0,0,0,5,25,45,25,0,0,0,0,0], [0,0,0,0,0,5,25,40,30,0,0,0,0,0], [0,0,0,0,0,0,25,40,35,0,0,0,0,0], [0,0,0,0,0,0,20,40,40,0,0,0,0,0], [0,0,0,0,0,0,15,40,45,0,0,0,0,0], [0,0,0,0,0,0,15,35,50,0,0,0,0,0], [0,0,0,0,0,0,10,35,50,5,0,0,0,0], [0,0,0,0,0,0,10,30,50,10,0,0,0,0], [0,0,0,0,0,0,5,30,50,15,0,0,0,0], [0,0,0,0,0,0,5,30,45,20,0,0,0,0], [0,0,0,0,0,0,5,25,45,25,0,0,0,0], [0,0,0,0,0,0,5,25,40,30,0,0,0,0], [0,0,0,0,0,0,5,20,40,35,0,0,0,0], [0,0,0,0,0,0,0,20,40,40,0,0,0,0], [0,0,0,0,0,0,0,15,40,45,0,0,0,0], [0,0,0,0,0,0,0,15,35,50,0,0,0,0], [0,0,0,0,0,0,0,10,35,55,0,0,0,0], [0,0,0,0,0,0,0,10,30,60,0,0,0,0], [0,0,0,0,0,0,0,10,30,55,5,0,0,0], [0,0,0,0,0,0,0,10,30,50,10,0,0,0], [0,0,0,0,0,0,0,5,30,50,15,0,0,0], [0,0,0,0,0,0,0,5,25,50,20,0,0,0], [0,0,0,0,0,0,0,5,25,45,25,0,0,0], [0,0,0,0,0,0,0,0,20,45,35,0,0,0], [0,0,0,0,0,0,0,0,15,40,45,0,0,0], [0,0,0,0,0,0,0,0,15,35,50,0,0,0], [0,0,0,0,0,0,0,0,10,35,55,0,0,0], [0,0,0,0,0,0,0,0,10,30,60,0,0,0], [0,0,0,0,0,0,0,0,5,30,60,5,0,0], [0,0,0,0,0,0,0,0,5,25,60,10,0,0], [0,0,0,0,0,0,0,0,5,25,55,15,0,0], [0,0,0,0,0,0,0,0,5,25,50,20,0,0], [0,0,0,0,0,0,0,0,0,20,45,35,0,0], [0,0,0,0,0,0,0,0,0,20,40,40,0,0], [0,0,0,0,0,0,0,0,0,15,40,45,0,0], [0,0,0,0,0,0,0,0,0,15,35,50,0,0], [0,0,0,0,0,0,0,0,0,10,35,55,0,0], [0,0,0,0,0,0,0,0,0,10,30,60,0,0], [0,0,0,0,0,0,0,0,0,10,25,60,5,0], [0,0,0,0,0,0,0,0,0,10,25,55,10,0], [0,0,0,0,0,0,0,0,0,5,25,55,15,0], [0,0,0,0,0,0,0,0,0,5,20,50,20,5], [0,0,0,0,0,0,0,0,0,0,20,45,25,10], [0,0,0,0,0,0,0,0,0,0,15,40,30,15], [0,0,0,0,0,0,0,0,0,0,10,35,35,20], [0,0,0,0,0,0,0,0,0,0,5,30,40,25], [0,0,0,0,0,0,0,0,0,0,0,25,45,30], [0,0,0,0,0,0,0,0,0,0,0,20,45,35], [0,0,0,0,0,0,0,0,0,0,0,10,50,40], [0,0,0,0,0,0,0,0,0,0,0,5,50,45], [0,0,0,0,0,0,0,0,0,0,0,0,50,50], [0,0,0,0,0,0,0,0,0,0,0,0,25,75], [0,0,0,0,0,0,0,0,0,0,0,0,0,100]];
SKILL_HEAVYWEIGHT_VALUE = [[100,0,0,0,0,0,0,0,0,0,0,0], [80,20,0,0,0,0,0,0,0,0,0,0], [60,40,0,0,0,0,0,0,0,0,0,0], [40,30,30,0,0,0,0,0,0,0,0,0], [20,30,30,20,0,0,0,0,0,0,0,0], [5,35,40,20,0,0,0,0,0,0,0,0], [0,30,40,30,0,0,0,0,0,0,0,0], [0,20,50,30,0,0,0,0,0,0,0,0], [0,15,50,35,0,0,0,0,0,0,0,0], [0,10,45,40,5,0,0,0,0,0,0,0], [0,5,40,45,10,0,0,0,0,0,0,0], [0,0,35,50,15,0,0,0,0,0,0,0], [0,0,25,55,20,0,0,0,0,0,0,0], [0,0,20,55,25,0,0,0,0,0,0,0], [0,0,15,55,30,0,0,0,0,0,0,0], [0,0,15,50,35,0,0,0,0,0,0,0], [0,0,10,45,40,5,0,0,0,0,0,0], [0,0,5,40,45,10,0,0,0,0,0,0], [0,0,0,35,50,15,0,0,0,0,0,0], [0,0,0,25,55,20,0,0,0,0,0,0], [0,0,0,15,60,25,0,0,0,0,0,0], [0,0,0,15,55,30,0,0,0,0,0,0], [0,0,0,15,50,35,0,0,0,0,0,0], [0,0,0,10,45,45,0,0,0,0,0,0], [0,0,0,5,45,50,0,0,0,0,0,0], [0,0,0,5,40,55,0,0,0,0,0,0], [0,0,0,5,35,60,0,0,0,0,0,0], [0,0,0,5,35,55,5,0,0,0,0,0], [0,0,0,0,40,50,10,0,0,0,0,0], [0,0,0,0,35,50,15,0,0,0,0,0], [0,0,0,0,35,45,20,0,0,0,0,0], [0,0,0,0,30,45,25,0,0,0,0,0], [0,0,0,0,30,40,30,0,0,0,0,0], [0,0,0,0,25,40,35,0,0,0,0,0], [0,0,0,0,25,35,40,0,0,0,0,0], [0,0,0,0,25,30,45,0,0,0,0,0], [0,0,0,0,20,30,50,0,0,0,0,0], [0,0,0,0,20,25,55,0,0,0,0,0], [0,0,0,0,15,25,60,0,0,0,0,0], [0,0,0,0,15,25,60,0,0,0,0,0], [0,0,0,0,10,25,60,5,0,0,0,0], [0,0,0,0,10,25,55,10,0,0,0,0], [0,0,0,0,10,20,55,15,0,0,0,0], [0,0,0,0,10,20,50,20,0,0,0,0], [0,0,0,0,5,20,50,25,0,0,0,0], [0,0,0,0,0,15,55,30,0,0,0,0], [0,0,0,0,0,10,55,35,0,0,0,0], [0,0,0,0,0,10,50,40,0,0,0,0], [0,0,0,0,0,5,50,45,0,0,0,0], [0,0,0,0,0,5,45,50,0,0,0,0], [0,0,0,0,0,5,40,55,0,0,0,0], [0,0,0,0,0,5,35,60,0,0,0,0], [0,0,0,0,0,0,35,65,0,0,0,0], [0,0,0,0,0,0,35,65,0,0,0,0], [0,0,0,0,0,0,30,70,0,0,0,0], [0,0,0,0,0,0,25,75,0,0,0,0], [0,0,0,0,0,0,20,80,0,0,0,0], [0,0,0,0,0,0,15,80,5,0,0,0], [0,0,0,0,0,0,15,75,10,0,0,0], [0,0,0,0,0,0,10,75,15,0,0,0], [0,0,0,0,0,0,10,70,20,0,0,0], [0,0,0,0,0,0,10,65,25,0,0,0], [0,0,0,0,0,0,10,60,30,0,0,0], [0,0,0,0,0,0,5,60,35,0,0,0], [0,0,0,0,0,0,5,55,40,0,0,0], [0,0,0,0,0,0,5,50,45,0,0,0], [0,0,0,0,0,0,5,45,50,0,0,0], [0,0,0,0,0,0,5,40,55,0,0,0], [0,0,0,0,0,0,5,30,60,5,0,0], [0,0,0,0,0,0,5,30,55,10,0,0], [0,0,0,0,0,0,5,30,50,15,0,0], [0,0,0,0,0,0,5,30,45,20,0,0], [0,0,0,0,0,0,5,25,45,25,0,0], [0,0,0,0,0,0,5,25,40,30,0,0], [0,0,0,0,0,0,5,25,35,35,0,0], [0,0,0,0,0,0,0,25,35,40,0,0], [0,0,0,0,0,0,0,20,35,45,0,0], [0,0,0,0,0,0,0,15,35,50,0,0], [0,0,0,0,0,0,0,15,30,55,0,0], [0,0,0,0,0,0,0,10,30,60,0,0], [0,0,0,0,0,0,0,10,30,55,5,0], [0,0,0,0,0,0,0,10,30,50,10,0], [0,0,0,0,0,0,0,10,30,45,15,0], [0,0,0,0,0,0,0,5,30,45,20,0], [0,0,0,0,0,0,0,5,30,40,25,0], [0,0,0,0,0,0,0,5,30,35,30,0], [0,0,0,0,0,0,0,5,30,30,35,0], [0,0,0,0,0,0,0,5,30,25,40,0], [0,0,0,0,0,0,0,5,30,20,45,0], [0,0,0,0,0,0,0,0,25,20,50,5], [0,0,0,0,0,0,0,0,15,20,55,10], [0,0,0,0,0,0,0,0,5,25,55,15], [0,0,0,0,0,0,0,0,0,25,55,20], [0,0,0,0,0,0,0,0,0,20,55,25], [0,0,0,0,0,0,0,0,0,20,50,30], [0,0,0,0,0,0,0,0,0,20,45,35], [0,0,0,0,0,0,0,0,0,15,45,40], [0,0,0,0,0,0,0,0,0,10,45,45], [0,0,0,0,0,0,0,0,0,0,50,50], [0,0,0,0,0,0,0,0,0,0,25,75], [0,0,0,0,0,0,0,0,0,0,0,100]]; 
SKILL_FRUIT_VALUE = [[100,0,0,0,0,0,0,0,0,0,0,0,0,0,0], [80,20,0,0,0,0,0,0,0,0,0,0,0,0,0], [40,50,10,0,0,0,0,0,0,0,0,0,0,0,0], [10,50,30,10,0,0,0,0,0,0,0,0,0,0,0], [5,45,30,20,0,0,0,0,0,0,0,0,0,0,0], [0,40,40,20,0,0,0,0,0,0,0,0,0,0,0], [0,30,40,30,0,0,0,0,0,0,0,0,0,0,0], [0,20,50,30,0,0,0,0,0,0,0,0,0,0,0], [0,10,40,40,10,0,0,0,0,0,0,0,0,0,0], [0,5,40,40,15,0,0,0,0,0,0,0,0,0,0], [0,5,35,40,20,0,0,0,0,0,0,0,0,0,0], [0,0,30,45,25,0,0,0,0,0,0,0,0,0,0], [0,0,25,45,30,0,0,0,0,0,0,0,0,0,0], [0,0,20,45,35,0,0,0,0,0,0,0,0,0,0], [0,0,15,40,40,5,0,0,0,0,0,0,0,0,0], [0,0,10,40,40,10,0,0,0,0,0,0,0,0,0], [0,0,5,40,40,15,0,0,0,0,0,0,0,0,0], [0,0,0,35,45,20,0,0,0,0,0,0,0,0,0], [0,0,0,25,50,25,0,0,0,0,0,0,0,0,0], [0,0,0,25,45,30,0,0,0,0,0,0,0,0,0], [0,0,0,20,45,35,0,0,0,0,0,0,0,0,0], [0,0,0,20,40,40,0,0,0,0,0,0,0,0,0], [0,0,0,15,40,45,0,0,0,0,0,0,0,0,0], [0,0,0,10,40,50,0,0,0,0,0,0,0,0,0], [0,0,0,10,35,50,5,0,0,0,0,0,0,0,0], [0,0,0,5,35,50,10,0,0,0,0,0,0,0,0], [0,0,0,5,30,50,15,0,0,0,0,0,0,0,0], [0,0,0,5,30,45,20,0,0,0,0,0,0,0,0], [0,0,0,5,25,45,25,0,0,0,0,0,0,0,0], [0,0,0,5,25,40,30,0,0,0,0,0,0,0,0], [0,0,0,5,20,40,35,0,0,0,0,0,0,0,0], [0,0,0,5,15,40,40,0,0,0,0,0,0,0,0], [0,0,0,0,15,40,45,0,0,0,0,0,0,0,0], [0,0,0,0,15,35,50,0,0,0,0,0,0,0,0], [0,0,0,0,10,35,50,5,0,0,0,0,0,0,0], [0,0,0,0,5,30,55,10,0,0,0,0,0,0,0], [0,0,0,0,5,30,50,15,0,0,0,0,0,0,0], [0,0,0,0,0,30,50,20,0,0,0,0,0,0,0], [0,0,0,0,0,30,45,25,0,0,0,0,0,0,0], [0,0,0,0,0,25,45,30,0,0,0,0,0,0,0], [0,0,0,0,0,25,40,35,0,0,0,0,0,0,0], [0,0,0,0,0,20,40,40,0,0,0,0,0,0,0], [0,0,0,0,0,15,40,45,0,0,0,0,0,0,0], [0,0,0,0,0,15,35,50,0,0,0,0,0,0,0], [0,0,0,0,0,10,35,50,5,0,0,0,0,0,0], [0,0,0,0,0,10,30,50,10,0,0,0,0,0,0], [0,0,0,0,0,5,30,50,15,0,0,0,0,0,0], [0,0,0,0,0,5,30,45,20,0,0,0,0,0,0], [0,0,0,0,0,5,25,45,25,0,0,0,0,0,0], [0,0,0,0,0,5,25,40,30,0,0,0,0,0,0], [0,0,0,0,0,0,25,40,35,0,0,0,0,0,0], [0,0,0,0,0,0,20,40,40,0,0,0,0,0,0], [0,0,0,0,0,0,15,40,45,0,0,0,0,0,0], [0,0,0,0,0,0,15,35,50,0,0,0,0,0,0], [0,0,0,0,0,0,10,35,50,5,0,0,0,0,0], [0,0,0,0,0,0,10,30,50,10,0,0,0,0,0], [0,0,0,0,0,0,5,30,50,15,0,0,0,0,0], [0,0,0,0,0,0,5,30,45,20,0,0,0,0,0], [0,0,0,0,0,0,5,25,45,25,0,0,0,0,0], [0,0,0,0,0,0,5,25,40,30,0,0,0,0,0], [0,0,0,0,0,0,5,20,40,35,0,0,0,0,0], [0,0,0,0,0,0,0,20,40,40,0,0,0,0,0], [0,0,0,0,0,0,0,15,40,45,0,0,0,0,0], [0,0,0,0,0,0,0,15,35,50,0,0,0,0,0], [0,0,0,0,0,0,0,10,35,55,0,0,0,0,0], [0,0,0,0,0,0,0,10,30,60,0,0,0,0,0], [0,0,0,0,0,0,0,10,30,55,5,0,0,0,0], [0,0,0,0,0,0,0,10,30,50,10,0,0,0,0], [0,0,0,0,0,0,0,5,30,50,15,0,0,0,0], [0,0,0,0,0,0,0,5,25,50,20,0,0,0,0], [0,0,0,0,0,0,0,5,25,45,25,0,0,0,0], [0,0,0,0,0,0,0,0,20,45,35,0,0,0,0], [0,0,0,0,0,0,0,0,15,40,45,0,0,0,0], [0,0,0,0,0,0,0,0,15,35,50,0,0,0,0], [0,0,0,0,0,0,0,0,10,35,55,0,0,0,0], [0,0,0,0,0,0,0,0,10,30,60,0,0,0,0], [0,0,0,0,0,0,0,0,5,30,60,5,0,0,0], [0,0,0,0,0,0,0,0,5,25,60,10,0,0,0], [0,0,0,0,0,0,0,0,5,25,55,15,0,0,0], [0,0,0,0,0,0,0,0,5,25,50,20,0,0,0], [0,0,0,0,0,0,0,0,0,20,45,35,0,0,0], [0,0,0,0,0,0,0,0,0,20,40,40,0,0,0], [0,0,0,0,0,0,0,0,0,15,40,45,0,0,0], [0,0,0,0,0,0,0,0,0,15,35,50,0,0,0], [0,0,0,0,0,0,0,0,0,10,35,55,0,0,0], [0,0,0,0,0,0,0,0,0,10,30,60,0,0,0], [0,0,0,0,0,0,0,0,0,10,25,60,5,0,0], [0,0,0,0,0,0,0,0,0,10,25,55,10,0,0], [0,0,0,0,0,0,0,0,0,5,25,55,15,0,0], [0,0,0,0,0,0,0,0,0,5,20,50,20,5,0], [0,0,0,0,0,0,0,0,0,0,15,45,25,10,5], [0,0,0,0,0,0,0,0,0,0,10,40,30,15,5], [0,0,0,0,0,0,0,0,0,0,0,35,35,20,10], [0,0,0,0,0,0,0,0,0,0,0,25,35,25,15], [0,0,0,0,0,0,0,0,0,0,0,10,40,30,20], [0,0,0,0,0,0,0,0,0,0,0,0,40,35,25], [0,0,0,0,0,0,0,0,0,0,0,0,30,40,30], [0,0,0,0,0,0,0,0,0,0,0,0,20,45,35], [0,0,0,0,0,0,0,0,0,0,0,0,0,50,50], [0,0,0,0,0,0,0,0,0,0,0,0,0,25,75], [0,0,0,0,0,0,0,0,0,0,0,0,0,0,100]];
SKILL_SEARCH_CHANCE = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100];
SKILL_CRAFTING_TIME = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100];

//waitUntil {!(isNil "life_map_loaded")};
//waitUntil {life_map_loaded};
diag_log "Map Objekte geladen";

private _luck = selectRandom [30, 40, 50, 60, 70, 80, 90, 100];
zenti setVariable ["fuel", _luck, true];
zenti setVariable ["maxFuel", _luck, true];
MAXFUEL = _luck;

if (isNil {uiNamespace getVariable "life_sql_id"}) then {
    life_sql_id = round(random(9999));
    CONSTVAR(life_sql_id);
    uiNamespace setVariable ["life_sql_id",life_sql_id];

    try {
        _result = EXTDB format ["9:ADD_DATABASE:%1",EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
        _result = EXTDB format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",FETCH_CONST(life_sql_id),EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
    } catch {
        diag_log _exception;
        life_HC_server_extDB_notLoaded = [true, _exception];
    };

    if (life_HC_server_extDB_notLoaded isEqualType []) exitWith {};
    EXTDB "9:LOCK";
    diag_log "extDB3: Connected to Database";
	
} else {
    life_sql_id = uiNamespace getVariable "life_sql_id";
    CONSTVAR(life_sql_id);
    diag_log "extDB3: Still Connected to Database";
};

if(life_HC_server_extDB_notLoaded isEqualType []) exitWith {};

_timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "------------------------------------ Starting Altis Life HC Init -----------------------------------";
diag_log "-------------------------------------------- Version 4.3.1 -----------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

[] spawn HC_fnc_cleanup;

CURRENT_WARNING = [];
HACKING_STATE = false;
SAVE_MODE = true;
DATABASE_MODE = true;
SAVE_STATE_INDEX = 5;

[] call HC_fnc_playerConfig;

private _currentTime = (call compile (EXTDB "9:LOCAL_TIME")) select 1 select 3;
NIGHT = _currentTime >= 1 && _currentTime < 13;
publicVariable "NIGHT";

diag_log format ["A3Log Loaded. Version: %1",("A3Log" callExtension "version")];

[] spawn HC_fnc_initMarkt;
[] spawn HC_fnc_initFarmEvent;
[] spawn HC_fnc_initVirtuszone;
[] call HC_fnc_initHouses;
[] execVM "\life_hc\initVehicleExplosion.sqf";
[] execVM "\life_hc\initTimeModule.sqf";
[] execVM "\life_hc\initGangeroberung.sqf";
[] execVM "\life_hc\initDatabase.sqf";
[] execVM "\life_hc\initPlayerSkins.sqf";
[] execVM "\life_hc\initStrahlung.sqf";

if(DEBUG) then {
[] spawn {
for "_int" from 0 to 1 step 0 do {
sleep 2 * 60;
diag_log format ["%1", DEBUG_ARRAY];
};
};
};

life_HC_server_isReady = true;
life_HC_isActive = true;
publicVariable "life_HC_isActive";
publicVariable "life_HC_server_isReady";
diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["                 End of Altis Life HC Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";