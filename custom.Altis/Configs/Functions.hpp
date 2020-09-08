class CfgFunctions {
	class Socket_Reciever {
		tag = "SOCK";
		class SQL_Socket {
			file = "Functions\session";
			class save {};
			class retrieveDatabaseInfo {};
			class firstJoin {};
		};
	};

	class Life_Client_Functions {
		tag = "life";
		
		class AAN {
			file = "Functions\aan";
			class openAAN {};
			class receiveAAN {};
			class sendAAN {};
		};
		
		class Abstellhof {
			file = "Functions\abstellhof";
			class AbstellhofBuy {};
			class AbstellhofGetUpdate {};
			class AbstellhofLBChange {};
			class AbstellhofUpdate {};
			class openAbstellhofMenu {};
		};
		
		class Actions {
			file = "Functions\actions";
			class arrestAction {};
			class buyLicense {};
			class captureHideout {};
			class neutralizeHideout {};
			class dpFinish {};
			class escortAction {};
			class executionAction {};
			class getDPMission {};
			class healAction {};
			class impoundAction {};
			class packupSpikes {};
			class processAction {};
			class pulloutAction {};
			class putInCar {};
			class repairTruck {};
			class restrainAction {};
			class robAction {};
			class searchAction {};
			class searchVehAction {};
			class serviceChopper {};
			class stopEscorting {};
			class storeVehicle {};
			class surrender {};
			class unrestrain {};
		};
		
		class Admin {
			file = "Functions\admin";
			class addExplosionEH {};
			class adminBackup {};
			class adminFreeze {};
			class adminInfo {};
			class adminInvisible {};
			class adminMenu {};
			class adminMoney {};
			class adminSendInfo {};
			class adminSpectate {};
			class adminSupporter {};
			class adminTeleport {};
			class adminTellSupport {};
			class anticheatMessage {};
			class checkAllDisplays {};
			class getAdmins {};
			class getSupport {};
			class menuCheck {};
			class openHackMenu {};
			class showHacks {};
			class simpleCheck {};
		};
		
		class Ausdauer {
			file = "Functions\ausdauer";
			class initStamina {};
		};
		
		class Ausweis {
			file = "Functions\ausweis";
			class ausweisCreate {};
			class getID {};
			class showID {};
		};
		
		class Bank {
			file = "Functions\bank";
			class bankTimer {};
			class bankTimerDisplay {};
			class robBank {};
			class smallbankcash {};
		};
		
		class ChopShop {
			file = "Functions\chopshop";
			class chopShopMenu {};
			class chopShopSelection {};
			class chopShopSell {};
		};
		
		class Civilian {
			file = "Functions\civilian";
			class civLoadout {};
			class civMarkers {};
			class demoChargeTimer {};
			class freezePlayer {};
			class knockedOut {};
			class knockoutAction {};
			class robPerson {};
			class tazed {};
		};
		
		class Cop {
			file = "Functions\cop";
			class bountyReceive {};
			class copGetMoney {};
			class copLoadout {};
			class copMarkers {};
			class copRemove {};
			class copRemoveMoney {};
			class copUnlock {};
			class licenseCheck {};
			class removeWeapon {};
			class restrain {};
			class searchClient {};
			class seizeWeapon {};
			class siren {};
			class sirenFnc {};
			class sperrZone {};
			class spikeStripEffect {};
			class spikeStripMarker {};
			class vehicleButcher {};
			class vehInvSearch {};
		};
		
		class Farmsystem {
			file = "Functions\farmsystem";
			class gather {};
			class gatherFish {};
			class getItemPrice {};
			class getRandomFarm {};
		};
		
		class Network {
			file = "Functions\functions\network";
			class animSync {};
			class broadcast {};
			class healSync {};
			class jumpFnc {};
			class say3D {};
			class setFuel {};
			class setVariable {};
			class soundDevice {};
		};
		
		class VehicleFunctions {
			file = "Functions\functions\vehicle";
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
		
		class Functions {
			file = "Functions\functions";
			class accType {};
			class actionKeyHandler {};
			class bluforSavezone {};
			class calWeightDiff {};
			class canAddItem {};
			class disableChannel {};
			class drugTest {};
			class endMission {};
			class escInterupt {};
			class execution {};
			class fetchCfgDetails {};
			class fetchDeadCopGear {};
			class fetchDeadGear {};
			class fetchVehInfo {};
			class gateOpen {};
			class getCheckbox {};
			class getCleanString {};
			class getCurrentTime {};
			class getFucked {};
			class getInMan {};
			class getItemType {};
			class getMass {};
			class getMoneyValue {};
			class getNagelband {};
			class getOutMan {};
			class getSavezone {};
			class getSideID {};
			class getSideNoID {};
			class handleDamage {};
			class handleInv {};
			class handleItem {};
			class hasSpace {};
			class headlessdc {};
			class hudSetup {};
			class hudUpdate {};
			class interact {};
			class interactionMenu {};
			class inventoryClosed {};
			class inventoryOpened {};
			class keyHandler {};
			class KRON_Strings {};
			class loadDeadGear {};
			class loadGear {};
			class logOut {};
			class moveIn {};
			class nearestDoor {};
			class nearUnits {};
			class numberText {};
			class onFired {};
			class onPutItem {};
			class onTakeItem {};
			class paycheck {};
			class playerTags {};
			class promille {};
			class pullOutVeh {};
			class pushObject {};
			class receiveItem {};
			class receiveMoney {};
			class removeChar {};
			class reviveEffect {};
			class searchFunction {};
			class stripDownPlayer {};
			class uranTimer {};
			class useAlcohol {};
			class useDrugs {};
			class virtusTimer {};
			class weaponReloaded {};
		};
		
		class Gangeroberung {
			file = "Functions\gangeroberung";
			class gangeroberung {};
			class zonenTimer {};
		};
		
		class HaloJump {
			file = "Functions\halojump";
			class HaloJump {};
		};
		
		class Houses {
			file = "Functions\houses";
			class getBuildingPositions {};
			class houseBuy {};
			class houseGarageSet {};
			class houseGarageSetFinal {};
			class houseInfo {};
			class houseInteraction {};
			class houseMarker {};
			class houseRemote {};
			class houseSell {};
		};
		
		class Init {
			file = "Functions\init";
			class initCiv {};
			class initCop {};
			class initMedic {};
			class initWeather {};
			class setupActions {};
			class setupEVH {};
			class survival {};
		};
		
		class Interaction {
			file = "Functions\interaction";
			class giveAlcohol {};
			class giveDrugs {};
			class giveFood {};
			class remoteDrug {};
			class removeHandy {};
			class updateCom {};
		};
		
		class Items {
			file = "Functions\items";
			class adrenalinShot {};
			class checkMask {};
			class defi {};
			class defuseKit {};
			class fixSpace {};
			class flashbang {};
			class getItemValue {};
			class itemWeight {};
			class jerrycanRefuel {};
			class jerryRefuel {};
			class lockpick {};
			class mask {};
			class spikeStrip {};
		};
		
		class Jail {
			file = "Functions\jail";
			class jailMe {};
			class jailMenu {};
			class jailPlayer {};
		};
		
		class Lackierer {
			file = "Functions\lackierer";
			class applyMaterial {};
			class applySkin {};
			class lackiererComboChange {};
			class lackiererLBChange {};
			class lackiererMenu {};
			class lackiererSend {};
		};
		
		class Loadout {
			file = "Functions\loadout";
			class getLoadout {};
			class getLoadoutPrice {};
			class loadLoadout {};
			class loadoutLBChange {};
			class openLoadout {};
			class saveLoadout {};
			class convertLoadout {};
		};
		
		class Locker {
			file = "Functions\locker";
			class addItem {};
			class lockerCanAdd {};
			class lockerDBClick {};
			class lockerDrop {};
			class lockerManage {};
			class lockerMenu {};
		};
		
		class Loginscreen {
			file = "Functions\loginscreen";
			class joinButton {};
			class loginMenu {};
			class spawnConfirm {};
			class spawnMenu {};
			class spawnPointSelected {};
			class simpleObjects {};
		};
		
		class Loot {
			file = "Functions\loot";
			class openLootMenu {};
			class takeLootItem {};
			class takeLootMoney {};
		};
		
		class Mapmarker {
			file = "Functions\mapmarker";
			class mapMarkerCheckbox {};
			class mapMarkerReset {};
			class mapMarkerSlider {};
			class markerMenu {};
		};
		
		class Medic {
			file = "Functions\medical";
			class adrenalin {};
			class deathScreen {};
			class medHilfe {};
			class medicLoadout {};
			class medicMarkers {};
			class medicRequest {};
			class medicVerlassen {};
			class mediKit {};
			class onPlayerKilled {};
			class onPlayerRespawn {};
			class requestMedic {};
			class respawned {};
			class revived {};
			class revivePlayer {};
			class showAbandonedVehicles {};
		};
		
		class Mod {
			file = "Functions\mod";
			class adminMarkers {};
			class controlSection {};
			class disableScrollrad {};
			class dropItemMod {};
			class enableScrollrad {};
			class endEvent {};
			class eventSafezone {};
			class giveItemMod {};
			class godMode {};
			class healPlayerMod {};
			class impoundRadius {};
			class killPlayerMod {};
			class listPlayerMod {};
			class mapTeleport {};
			class openArsenal {};
			class openCountdownMenu {};
			class openDropMenu {};
			class openGearMenu {};
			class openModTool {};
			class openSetup {};
			class openVehicleMod {};
			class remoteCountdown {};
			class remoteScrollrad {};
			class remoteScrollradClear {};
			class remoteStrip {};
			class repeatMessage {};
			class repeatMessageStop {};
			class saveGearMod {};
			class saveMessageMod {};
			class setCountdownPosition {};
			class setMessage {};
			class setScrollPosition {};
			class simpleMessage {};
			class spawnVehicleMod {};
			class startEvent {};
			class startEventCountdown {};
			class stripPlayerMod {};
			class switchCountdown {};
			class TpHere {};
			class TpTo {};
		};
		
		class Notification {
			file = "Functions\notification";
			class headline {};
			class message {};
			class notification_system {};
			class showNotification {};
			class sideMessage {};
			class tileMessage {};
		};
		
		class PMenu_Affiliate {
			file = "Functions\pMenu\Affiliate";
			class checkAffiliate {};
			class getAffiliate {};
			class openAffiliate {};
			class receiveAffiliate {};
		};
		
		class PMenu_Bugtracker {
			file = "Functions\pMenu\Bugtracker";
			class openBugtracker {};
			class sendBugreport {};
		};
		
		class PMenu_Cellphone {
			file = "Functions\pMenu\Cellphone";
			class cellphoneLBChange {};
			class cellphoneRemove {};
			class openCellphone {};
			class receiveMessage {};
			class sendMessage {};
		};
		
		class PMenu_Settings {
			file = "Functions\pMenu\Einstellungen";
			class openSettings {};
			class settingsCheckbox {};
			class settingsCombo {};
			class settingsEdit {};
			class settingsGearFix {};
			class settingsSlider {};
			class updateViewDistance {};
		};
		
		class PMenu_Emergency {
			file = "Functions\pMenu\Emergency";
			class emergencyAccept {};
			class emergencyCancel {};
			class emergencyComboLBChange {};
			class emergencyPlayerLBChange {};
			class emergencyRemove {};
			class emergencySendMessage {};
			class newEmergency {};
			class openEmergencyMenu {};
		};
		
		class PMenu_FAQ {
			file = "Functions\pMenu\FAQ";
			class FAQLBChange {};
			class openFAQ {};
			class sendFAQ {};
		};
		
		class PMenu_Farm {
			file = "Functions\pMenu\Farm";
			class farmLBChange {};
			class farmSetMapPosition {};
			class openFarm {};
		};
		
		class PMenu_Gang_Buffs {
			file = "Functions\pMenu\Gang\Buffs";
			class activateBuff {};
			class isBuffOn {};
			class openGangBuff {};
		};
		
		class PMenu_Gang_Create {
			file = "Functions\pMenu\Gang\Create";
			class gangCreate {};
			class openGangCreate {};
		};
		
		class PMenu_Gang_House {
			file = "Functions\pMenu\Gang\House";
			class gangBuyUpgrade {};
			class openGangHouse {};
		};
		
		class PMenu_Gang_Menu {
			file = "Functions\pMenu\Gang\Menu";
			class gangDBClick {};
			class gangDeposit {};
			class gangDisband {};
			class gangDisbanded {};
			class gangInvite {};
			class gangInvited {};
			class gangKick {};
			class gangLeave {};
			class gangOffline {};
			class gangOfflineGet {};
			class gangPromote {};
			class gangUpgrade {};
			class gangWithdraw {};
			class openGang {};
		};
		
		class PMenu_Gang {
			file = "Functions\pMenu\Gang";
			class getGangRank {};
			class initGang {};
			class openGangDialog {};
		};
		
		class PMenu_Key {
			file = "Functions\pMenu\Key";
			class getKey {};
			class keyGive {};
			class openKeychain {};
		};
		
		class PMenu_Main {
			file = "Functions\pMenu\Main";
			class giveItem {};
			class giveMoney {};
			class openZInv {};
			class removeItem {};
			class umgebungsChecker {};
			class useItem {};
		};
		
		class PMenu_Markt {
			file = "Functions\pMenu\Markt";
			class endFarmEvent {};
			class marktLBChange {};
			class openMarkt {};
			class setFarmKurs {};
			class triggerFarmEvent {};
		};
		
		class PMenu_Skills {
			file = "Functions\pMenu\Skills";
			class openSkills {};
			class skillChange {};
			class skillGroupChange {};
		};
		
		class PMenu_Spectate {
			file = "Functions\pMenu\Spectate";
			class copSpectate {};
			class openCopSpectate {};
		};
		
		class PMenu_Streifensystem {
			file = "Functions\pMenu\Streifensystem";
			class openStreifensystem {};
			class streifensystemEintragen {};
			class streifensystemLBChange {};
		};
		
		class PMenu_Wanted {
			file = "Functions\pMenu\Wanted";
			class fahndungCrimeAdd {};
			class fahndungCrimeAddChange {};
			class fahndungCrimeChange {};
			class fahndungCrimeRemove {};
			class fahndungGetUpdate {};
			class fahndungNoteAdd {};
			class fahndungNoteCancel {};
			class fahndungNoteEdit {};
			class fahndungNoteRemove {};
			class fahndungPlayerAddChange {};
			class fahndungPlayerChange {};
			class fahndungUpdate {};
			class openFahndung {};
			class openFahndungAdd {};
		};
		
		class Relikt {
			file = "Functions\relikt";
			class geistlicher {};
			class receiveGeistlicher {};
		};
		
		class Schrottplatz {
			file = "Functions\schrottplatz";
			class JunkyardBuy {};
			class JunkyardGetUpdate {};
			class JunkyardLBChange {};
			class JunkyardUpdate {};
			class openJunkyardMenu {};
		};
		
		class Shops {
			file = "Functions\shops";
			class atmMenu {};
			class vehicleShop3DPreview {};
			class vehicleShopBuy {};
			class vehicleShopEnd3DPreview {};
			class vehicleShopInit3DPreview {};
			class vehicleShopLBChange {};
			class vehicleShopMenu {};
			class vehicleSteps {};
			class virt_buy {};
			class virt_menu {};
			class virt_sell {};
			class virt_update {};
		};
		
		class Skillsystem {
			file = "Functions\skillsystem";
			class addSkill {};
			class getSkillAdvantage {};
			class getSkillDescription {};
			class getSkillGroup {};
			class getSkillLevel {};
			class getSkillMaxLevel {};
			class getSkillName {};
			class getSkillPoints {};
			class getSkillPointsNeeded {};
			class initSkillSystem {};
		};
		
		class Supportcode {
			file = "Functions\supportcode";
			class supportCode {};
			class supportCodeMenu {};
			class supportCodeReceive {};
		};
		
		class Ticket {
			file = "Functions\ticket";
			class ticketGetPlayer {};
			class ticketGive {};
			class ticketPlayer {};
			class ticketReceive {};
		};
		
		class Ubahn {
			file = "Functions\ubahn";
			class openUbahn {};
			class useUbahn {};
		};
		
		class Vehicle {
			file = "Functions\vehicle";
			class addVehicle2Chain {};
			class colorVehicle {};
			class deviceMine {};
			class engine {};
			class flipVehicle {};
			class lockVehicle {};
			class openInventory {};
			class relocate {};
			class trunkLBChange {};
			class vehicleInteractionMenu {};
			class vehicleWeight {};
			class vehicleWeightCfg {};
			class vehInventory {};
			class vehStoreItem {};
			class vehTakeItem {};	
		};

		class Versicherung {
			file = "Functions\versicherung";
			class insuranceBuy {};
			class insuranceGetUpdate {};
			class insuranceLBChange {};
			class insuranceUpdate {};
			class openInsuranceMenu {};
		};
		
		class Waffenshop {
			file = "Functions\waffenshop";
			class weaponShopBuy {};
			class weaponShopLBChange {};
			class weaponShopLBFilter {};
			class weaponShopMenu {};
		};
		
		class Zentralbank {
			file = "Functions\zentralbank";
			class zentiBolt {};
			class zentiCharge {};
			class zentiFuelVehicle {};
			class zentiLBChange {};
			class zentiMenuOpen {};
			class zentiSell {};
			class zentiTimer {};
		};

		class Reward {
			file = "Functions\reward";
			class claimReward;
			class getReward;
			class openReward;
			class rewardLBChange;
			class openRewardBox;
			class rewardBoxLBChange;
			class rewardActivate;
			class getItemAboReward;
		}

		class Dialog_Controls {
			file = "Dialog\function";
			class bankDeposit {};
			class bankDepositMax {};
			class bankMio {};
			class bankTransfer {};
			class bankWithdraw {};
			class displayHandler {};
			class garageLBChange {};
			class getUpdateGarage {};
			class openGarage {};
			class safeFix {};
			class sellGarage {};
			class unimpound {};
			class unimpoundMoney {};
			class updateGarage {};
			class wireTransfer {};
		};
	};
};