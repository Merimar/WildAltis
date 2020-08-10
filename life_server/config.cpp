class DefaultEventhandlers;
class CfgPatches {
    class life_server {
        units[] = {"C_man_1"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
        fileName = "life_server.pbo";
        author[]= {"Merimar"};
    };
};

class CfgFunctions {
    class MySQL_Database {
        tag = "DB";
        class MySQL {
            file = "\life_server\Functions\MySQL";
			class asyncCall {};
			class bool {};
			class mresArray {};
			class mresString {};
			class mresToArray {};
			class numberSafe {};
        };
    };

    class TON_System {
        tag = "TON";
		class AC {
			file = "\life_server\Functions\AC";
			class adminInvisible {};
			class clientConnected {};
			class clientDisconnect {};
			class localEH {};
		};
		
    };
};

class CfgVehicles {
    class Car_F;
    class CAManBase;
    class Civilian;
    class Civilian_F : Civilian {class EventHandlers;};

    class C_man_1 : Civilian_F {
        class EventHandlers: EventHandlers {
            init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
        };
    };
};