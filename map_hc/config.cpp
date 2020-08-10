#define true 1
#define false 0

class DefaultEventHandler;

class CfgPatches
{
    class life_map_client
    {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F"};
        fileName = "map_hc.pbo";
        author[] = {"Merimar"};
    };
};

class CfgFunctions
{
    class Headless_Client
    {
        tag = "MHC";
		class Main
        {
            file = "\map_hc\Main";
            class spawnMarker {};
			class spawnObjects {};
			class simpleObjects {};
			class refreshMarker {};
			class vehicles {};
        };
    };
};
