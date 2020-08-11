#define true 1
#define false 0

class DefaultEventHandler;

class CfgPatches
{
    class life_headless_client
    {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F"};
        fileName = "life_hc.pbo";
        author[] = {"Merimar"};
    };
};

class CfgFunctions
{
    class Headless_Client
    {
        tag = "HC";
		
		class AAN {
			file = "\life_hc\MySQL\AAN";
			class sendAAN {};
		};
		
		class Abstellhof {
            file = "\life_hc\MySQL\Abstellhof";
			class abschleppVehicle {};
            class abstellVehicle {};
			class getAbstellhofVehicles {};
        };
		
		class AC {
            file = "\life_hc\MySQL\AC";
			class addExplosionEH {};
            class adminMessage {};
			class bluforSavezone {};
			class checkSQLBreak {};
			class dupeHC {};
            class getAdmins {};
			class getGeheimzahl {};
			class getName {};
			class getOwnerID {};
            class getPlayerByID {};
            class getPlayerByUID {};
            class log {};
			class logHackData {};
			class logKey {};
			class playerInit {};
            class reportHacker {};
            class searchArray {};
			class sendMessage {};
        };
		
		class AdminTool {
            file = "\life_hc\MySQL\AdminTool";
			class adminGiveGear {};
            class adminGiveMoney {};
			class adminImpound {};
			class adminSpectate {};
			class adminStrip {};
			class adminTeleportPlayer {};
			class copSpectate {};
			class dropItemMod {};
			class freezePlayer {};
			class joinEvent {};
			class modLog {};
			class saveArsenal {};
			class setDamage {};
			class spawnVehicleMod {};
        };
		
		class Affiliate {
            file = "\life_hc\MySQL\Affiliate";
            class authAffiliate {};
        };
		
		class Bank {
            file = "\life_hc\MySQL\Bank";
            class bankTimerServer {};
			class smallbank {};
        };
		
		class Buffs {
            file = "\life_hc\MySQL\Buffs";
            class activateBuff {};
			class buffThread {};
			class giveRandomBuff {};
			class isBuffOn {};
        };
		
		class EventHandler {
            file = "\life_hc\MySQL\EventHandler";
			class playerAdrenalin {};
            class playerKilled {};
			class playerRespawned {};
			class playerRevived {};
			class putItem {};
			class spawned {};
			class survivalHC {};
			class takeItem {};
			class weaponReloaded {};
        };
		
		class Farm {
            file = "\life_hc\MySQL\Farm";
			class gather {};
			class gatherFish {};
        };
		
		class Gangs {
            file = "\life_hc\MySQL\Gangs";
            class gangCreate {};
			class gangDeposit {};
			class gangDisband {};
			class gangInvite {};
			class gangInvited {};
			class gangKick {};
			class gangLeave {};
			class gangOffline {};
			class gangOfflineKick {};
			class gangOfflinePromote {};
			class gangPromote {};
			class gangUpgrade {};
			class gangWithdraw {};
			class initGangHC {};
        };
		
		class General {
            file = "\life_hc\MySQL\General";
			class accType {};
            class asyncCall {};
            class bool {};
			class cleanup {};
			class clearGround {};
			class fetchCfgDetails {};
			class getCleanString {};
			class getGroupSideID {};
			class getSideID {};
			class haloJump {};
			class healPlayer {};
			class huntingZone {};
            class mresArray {};
            class mresString {};
            class mresToArray {};
			class multiArrayToArray {};
            class numberSafe {};
			class removeChar {};
			class reportReceive {};
			class sperrzone {};
			class staminaUpdate {};
			class ubahn {};
            class whitelist {};
        };
		
		class Houses {
            file = "\life_hc\MySQL\Houses";
            class gangHouseUpgrade {};
            class houseBuy {};
            class houseGarageSet {};
            class houseSell {};
            class initHouses {};
        };
		
		class Items {
            file = "\life_hc\MySQL\Items";
			class deviceGather {};
			class giveVirt {};
			class processItem {};
			class removeItem {};
			class searchUpdate {};
			class spikeStrip {};
			class storeItemVehicle {};
			class takeItemVehicle {};
			class useItem {};
			class vehicleInvSearch {};
        };
		
		class Jail {
            file = "\life_hc\MySQL\Jail";
            class jailOutcome {};
			class jailPlayer {};
        };
		
		class Lackierer {
            file = "\life_hc\MySQL\Lackierer";
            class applyLackierer {};
			class getLackiererVehicles {};
        };
		
		class Loadout {
            file = "\life_hc\MySQL\Loadout";
            class getLoadout {};
			class saveLoadout {};
        };
		
		class Locker {
            file = "\life_hc\MySQL\Locker";
            class lockerUpdate {};
        };
		
		class Loot {
            file = "\life_hc\MySQL\Loot";
            class takeLootItem {};
			class takeLootMoney {};
        };
		
		class Markt {
            file = "\life_hc\MySQL\Markt";
			class endFarmEvent {};
            class getItemPrice {};
            class getLowestPerc {};
			class getMarktCounter {};
			class getMarktPerc {};
            class getRandomMarktItem {};
			class handleMarkt {};
			class initFarmEvent {};
            class initMarkt {};
			class setFarmKurs {};
			class triggerFarmEvent {};
        };
		
		class Money {
            file = "\life_hc\MySQL\Money";
			class bankDeposit {};
			class bankWithdraw {};
			class dpFinish {};
			class getMoneyValue {};
			class giveMoney {};
			class initPaycheck {};
			class paycheck {};
			class robPlayer {};
			class transferMoney {};
        };
		
		class Notrufsystem {
            file = "\life_hc\MySQL\Notrufsystem";
            class emergencyAccept {};
			class emergencyCancel {};
			class emergencySendMessage {};
			class newEmergency {};
        };
		
		class PlayTime {
            file = "\life_hc\MySQL\PlayTime";
            class initPlaytime {};
            class savePlaytime {};
        };
		
		class Pmenu {
            file = "\life_hc\MySQL\Pmenu";
            class giveKey {};
        };
		
		class Relikt {
            file = "\life_hc\MySQL\Relikt";
            class geistlicher {};
        };
		
		class Schrottplatz {
            file = "\life_hc\MySQL\Schrottplatz";
			class getJunkyardVehicles {};
			class junkVehicle {};
        };
		
		class Shops {
            file = "\life_hc\MySQL\Shops";
			class buyLicense {};
			class virtBuy {};
			class virtSell {};
        };
		
		class Supportcodes {
            file = "\life_hc\MySQL\Supportcodes";
			class supportCode {};
        };
		
		class Ticket {
            file = "\life_hc\MySQL\Ticket";
			class ticketCancel {};
			class ticketGive {};
			class ticketPay {};
			class ticketPlayer {};
			class ticketRefuse {};
        };
		
		class VehicleFunctions {
			file = "\life_hc\MySQL\VehicleFunctions";
			class getAbstellhofPrice {};
			class getBuyMultiplier {};
			class getInsurancePrice {};
			class getJunkPrice {};
			class getMaterialName {};
			class getSkinName {};
			class getStorageFee {};
			class getVehicleChopPrice {};
			class getVehicleDescription {};
			class getVehiclePrice {};
			class getVehicleSellPrice {};
		};
		
		class Vehicles {
            file = "\life_hc\MySQL\Vehicles";
			class butcherVehicle {};
			class buyVehicle {};
            class chopShopSell {};
			class clearVehicleAmmo {};
			class colorVehicle {};
			class flipVehicle {};
			class getVehicleDatabase {};
            class getVehicles {};
			class insertVehicle {};
            class keyManagement {};
			class pushBoat {};
			class repairVehicle {};
			class serviceChopper {};
			class spawnVehicle {};
			class vehicleDelete {};
			class vehicleDestroy {};
            class vehicleStore {};
        };

		class Versicherung {
            file = "\life_hc\MySQL\Versicherung";
			class getInsuranceVehicles {};
			class insureVehicle {};
        };
		
		class Virtuszone {
            file = "\life_hc\MySQL\Virtuszone";
            class fillWeaponCrate {};
			class givePoints {};
			class initVirtuszone {};
			class virtusCrate {};
        };
		
		class Waffenshop {
            file = "\life_hc\MySQL\Waffenshop";
            class buyWeapon {};
        };
		
		class WantedList {
            file = "\life_hc\MySQL\WantedList";
            class fahndungAdd {};
			class fahndungBounty {};
			class fahndungGetMoney {};
			class fahndungHandle {};
			class fahndungNoteAdd {};
			class fahndungNoteEdit {};
			class fahndungNoteRemove {};
			class fahndungRemove {};
			class fahndungUpdate {};
        };

		class Zentralbank {
            file = "\life_hc\MySQL\Zentralbank";
            class boltZenti {};
			class chargeZenti {};
			class sellZenti {};
        };
		
		class Config {
            file = "\life_hc\Config";
            class playerConfig {};
        };
		
		class Save {
            file = "\life_hc\Save";
			class confirmName {};
			class getConnectingPlayer {};
            class insertPlayerToDatabase {};
			class onPlayerConnected {};
			class onPlayerDisconnected {};
			class queryPlayer {};
			class save {};
			class saveToDatabase {};
        };
		
		class Transaktionen {
            file = "\life_hc\Save\Transaktionen";
			class addLoadout {};
			class addSkill {};
			class countVirt {};
			class getArrested {};
			class getGear {};
			class getItemType {};
			class getLicenses {};
			class getLoadouts {};
			class getMoney {};
			class getPlayerGear {};
			class getSkill {};
			class getSkillAdvantage {};
			class getSkillLevel {};
			class getSpecialLevel {};
			class getVehicleIndex {};
			class getVehicleItems {};
			class getVirt {};
			class handleAlive {};
			class handleArrested {};
			class handleInv {};
			class handleLicenses {};
			class handleLocker {};
			class handleMoney {};
			class handleVehicleInv {};
			class handleVirt {};
			class hasLicense {};
			class removeItemInteraction {};
			class setSpecialLevel {};
			class vehicleIndex {};
			class getVehicleItemIndex {};
        };
    };
};