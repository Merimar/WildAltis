#define F(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2
#define HC HC_Life

class CfgRemoteExec {
    class Functions {
        mode = 1;
        jip = 1;
		
		/*
		class BIS_fnc_effectKilledAirDestruction	{ allowedTargets = 0; jip = 0; };
		class BIS_fnc_effectKilledSecondaries		{ allowedTargets = 0; jip = 0; };
		*/
		class BIS_fnc_objectVar						{ allowedTargets = 0; jip = 0; };
		class BIS_fnc_setCustomSoundController		{ allowedTargets = 0; jip = 0; };
		
		//--------------------------------------------------------------------------------------------CLIENT----------------------------------------------------------------------------------------
		
		//Dialog Functions
		F(life_fnc_getUpdateGarage,CLIENT)
		F(life_fnc_unimpoundMoney,CLIENT)
		
		//AAN
		F(life_fnc_receiveAAN,CLIENT)
		
		//Abstellhof
		F(life_fnc_AbstellhofGetUpdate,CLIENT)
		
		//Admin
		F(life_fnc_anticheatMessage,CLIENT)
		F(life_fnc_adminSendInfo,CLIENT)
		F(life_fnc_getSupport,CLIENT)
		
		//Affiliate
		F(life_fnc_receiveAffiliate,CLIENT)
		
		//Ausweis
		F(life_fnc_ausweisCreate,CLIENT)
		F(life_fnc_getID,CLIENT)
		
		//Bank
		F(life_fnc_bankTimer,CLIENT)
		F(life_fnc_bankTimerDisplay,CLIENT)
		F(life_fnc_smallbankcash,CLIENT)
		
		//Civilian
		F(life_fnc_demoChargeTimer,CLIENT)
		F(life_fnc_knockedOut,CLIENT)
		F(life_fnc_robPerson,CLIENT)
		F(life_fnc_tazed,CLIENT)
		
		//Cop
		F(life_fnc_bountyReceive,CLIENT)
		F(life_fnc_copRemove,CLIENT)
		F(life_fnc_copRemoveMoney,CLIENT)
		F(life_fnc_copUnlock,CLIENT)
		F(life_fnc_licensecheck,CLIENT)
		F(life_fnc_restrain,CLIENT)
		F(life_fnc_searchClient,CLIENT)
		F(life_fnc_siren,CLIENT)
		F(life_fnc_spikeStripEffect,CLIENT)
		F(life_fnc_spikeStripMarker,CLIENT)
		
		//Network
		F(life_fnc_animSync,CLIENT)
		F(life_fnc_broadcast,CLIENT)
		F(life_fnc_healSync,CLIENT)
		F(life_fnc_jumpFnc,CLIENT)
		F(life_fnc_say3D,CLIENT)
		F(life_fnc_setFuel,CLIENT)
		F(life_fnc_soundDevice,CLIENT)
		
		//Functions
		F(life_fnc_endMission,CLIENT)
		F(life_fnc_execution,CLIENT)
		F(life_fnc_getFucked,CLIENT)
		F(life_fnc_headlessdc,CLIENT)
		F(life_fnc_moveIn,CLIENT)
		F(life_fnc_paycheck,CLIENT)
		F(life_fnc_pullOutVeh,CLIENT)
		F(life_fnc_receiveItem,CLIENT)
		F(life_fnc_receiveMoney,CLIENT)
		F(life_fnc_useDrugs,CLIENT)
		F(life_fnc_virtusTimer,CLIENT)
		
		//GE
		F(life_fnc_zonenTimer,CLIENT)
		
		//Gangs
		F(life_fnc_gangDisbanded,CLIENT)
		F(life_fnc_gangInvited,CLIENT)
		F(life_fnc_gangOfflineGet,CLIENT)
		
		//Houses
		F(life_fnc_houseMarker,CLIENT)
		F(life_fnc_houseRemote,CLIENT)
		
		//Interaction
		F(life_fnc_giveFood,CLIENT)
		F(life_fnc_remoteDrug,CLIENT)
		
		//Items
		F(life_fnc_checkMask,CLIENT)
		F(life_fnc_flashbang,CLIENT)
		
		//Jail
		F(life_fnc_jailMe,CLIENT)
		
		//Lackierer
		F(life_fnc_lackiererMenu,CLIENT)
		
		//Loadout
		F(life_fnc_loadLoadout,CLIENT)
		
		//Medical
		F(life_fnc_revived,CLIENT)
		F(life_fnc_medicRequest,CLIENT)
		
		//Mod Menu
		F(life_fnc_remoteCountdown,CLIENT)
		F(life_fnc_remoteScrollrad,CLIENT)
		F(life_fnc_remoteScrollradClear,CLIENT)
		F(life_fnc_remoteStrip,CLIENT)
		
		//Notification
		F(life_fnc_headline,CLIENT)
		F(life_fnc_message,CLIENT)
		F(life_fnc_notification_system,CLIENT)
		F(life_fnc_showNotification,CLIENT)
		F(life_fnc_sideMessage,CLIENT)
		F(life_fnc_tileMessage,CLIENT)
		
		//PMenu
		F(life_fnc_getKey,CLIENT)
		F(life_fnc_receiveMessage,CLIENT)
		
		//Relikt
		F(life_fnc_receiveGeistlicher,CLIENT)
		
		//Schrottplatz
		F(life_fnc_JunkyardGetUpdate,CLIENT)
		
		//Session
		F(SOCK_fnc_firstJoin,CLIENT)
		F(SOCK_fnc_retrieveDatabaseInfo,CLIENT)
		
		//Supportcode
		F(life_fnc_supportCodeReceive,CLIENT)
		
		//Vehicles
		F(life_fnc_addVehicle2Chain,CLIENT)
		F(life_fnc_lockVehicle,CLIENT)
		
		//Ticket
		F(life_fnc_ticketGetPlayer,CLIENT)
		F(life_fnc_ticketReceive,CLIENT)
		
		//Versicherung
		F(life_fnc_insuranceGetUpdate,CLIENT)
		
		//Wantedlist
		F(life_fnc_fahndungGetUpdate,CLIENT)
		
		//Zentralbank
		F(life_fnc_zentiTimer,CLIENT)
		
		//--------------------------------------------------------------------------------------------HC--------------------------------------------------------------------------------------------
		
		//Connect
		F(HC_fnc_onPlayerConnected,HC)
		F(HC_fnc_onPlayerDisconnected,HC)
		F(HC_fnc_confirmName,HC)
		F(HC_fnc_save,HC)
		
		//AAN
		F(HC_fnc_sendAAN,HC)
		
		//Abstellhof
		F(HC_fnc_abschleppVehicle,HC)
		F(HC_fnc_abstellVehicle,HC)
		F(HC_fnc_getAbstellhofVehicles,HC)
		
		//AC
		F(HC_fnc_bluforSavezone,HC)
		F(HC_fnc_dupeHC,HC)
		F(HC_fnc_logHackData,HC)
		F(HC_fnc_logKey,HC)
		F(HC_fnc_playerInit,HC)
		F(HC_fnc_sendMessage,HC)
		
		//Admin Tool
		F(HC_fnc_adminGiveGear,HC)
		F(HC_fnc_adminGiveMoney,HC)
		F(HC_fnc_adminImpound,HC)
		F(HC_fnc_adminStrip,HC)
		F(HC_fnc_adminTeleportPlayer,HC)
		F(HC_fnc_copSpectate,HC)
		F(HC_fnc_dropItemMod,HC)
		F(HC_fnc_freezePlayer,HC)
		F(HC_fnc_joinEvent,HC)
		F(HC_fnc_modLog,HC)
		F(HC_fnc_saveArsenal,HC)
		F(HC_fnc_setDamage,HC)
		F(HC_fnc_spawnVehicleMod,HC)
		
		//Affiliate
		F(HC_fnc_authAffiliate,HC)
		
		//Bank
		F(HC_fnc_smallbank,HC)
		
		//Buffs
		F(HC_fnc_activateBuff,HC)
		
		//EventHandler
		F(HC_fnc_playerAdrenalin,HC)
		F(HC_fnc_playerKilled,HC)
		F(HC_fnc_playerRespawned,HC)
		F(HC_fnc_playerRevived,HC)
		F(HC_fnc_putItem,HC)
		F(HC_fnc_spawned,HC)
		F(HC_fnc_survivalHC,HC)
		F(HC_fnc_takeItem,HC)
		F(HC_fnc_weaponReloaded,HC)
		
		//Farm
		F(HC_fnc_gather,HC)
		F(HC_fnc_gatherFish,HC)
		
		//Gangs
		F(HC_fnc_gangCreate,HC)
		F(HC_fnc_gangDeposit,HC)
		F(HC_fnc_gangDisband,HC)
		F(HC_fnc_gangInvite,HC)
		F(HC_fnc_gangInvited,HC)
		F(HC_fnc_gangKick,HC)
		F(HC_fnc_gangLeave,HC)
		F(HC_fnc_gangOffline,HC)
		F(HC_fnc_gangOfflineKick,HC)
		F(HC_fnc_gangOfflinePromote,HC)
		F(HC_fnc_gangPromote,HC)
		F(HC_fnc_gangUpgrade,HC)
		F(HC_fnc_gangWithdraw,HC)
		
		//General
		F(HC_fnc_clearGround,HC)
		F(HC_fnc_copMoney,HC)
		F(HC_fnc_haloJump,HC)
		F(HC_fnc_healPlayer,HC)
		F(HC_fnc_reportReceive,HC)
		F(HC_fnc_sperrzone,HC)
		F(HC_fnc_staminaUpdate,HC)
		F(HC_fnc_ubahn,HC)
		F(HC_fnc_whitelist,HC)
		
		//Houses
		F(HC_fnc_gangHouseUpgrade,HC)
		F(HC_fnc_houseBuy,HC)
		F(HC_fnc_houseGarageSet,HC)
		F(HC_fnc_houseSell,HC)
		
		//Items
		F(HC_fnc_deviceGather,HC)
		F(HC_fnc_giveVirt,HC)
		F(HC_fnc_mediKit,HC)
		F(HC_fnc_processItem,HC)
		F(HC_fnc_removeItem,HC)
		F(HC_fnc_searchUpdate,HC)
		F(HC_fnc_spikeStrip,HC)
		F(HC_fnc_storeItemVehicle,HC)
		F(HC_fnc_takeItemVehicle,HC)
		F(HC_fnc_useItem,HC)
		F(HC_fnc_vehicleInvSearch,HC)
		
		//Jail
		F(HC_fnc_jailPlayer,HC)
		F(HC_fnc_jailOutcome,HC)
		
		//Lackierer
		F(HC_fnc_applyLackierer,HC)
		F(HC_fnc_getLackiererVehicles,HC)
		
		//Loadout
		F(HC_fnc_getLoadout,HC)
		F(HC_fnc_saveLoadout,HC)
		
		//Locker
		F(HC_fnc_lockerUpdate,HC)
		
		//Loot
		F(HC_fnc_takeLootItem,HC)
		F(HC_fnc_takeLootMoney,HC)
		
		//Markt
		F(HC_fnc_endFarmEvent,HC)
		F(HC_fnc_setFarmKurs,HC)
		F(HC_fnc_triggerFarmEvent,HC)
		
		//Money
		F(HC_fnc_bankDeposit,HC)
		F(HC_fnc_bankWithdraw,HC)
		F(HC_fnc_dpFinish,HC)
		F(HC_fnc_giveMoney,HC)
		F(HC_fnc_robPlayer,HC)
		F(HC_fnc_transferMoney,HC)
		
		//Notrufsystem
		F(HC_fnc_emergencyAccept,HC)
		F(HC_fnc_emergencyCancel,HC)
		F(HC_fnc_emergencySendMessage,HC)
		F(HC_fnc_newEmergency,HC)
		
		//PMenu
		F(HC_fnc_giveKey,HC)
		
		//Relikt
		F(HC_fnc_geistlicher,HC)
		
		//Schrottplatz
		F(HC_fnc_getJunkyardVehicles,HC)
		F(HC_fnc_junkVehicle,HC)
		
		//Shops
		F(HC_fnc_buyLicense,HC)
		F(HC_fnc_virtBuy,HC)
		F(HC_fnc_virtSell,HC)
		
		//Supportcode
		F(HC_fnc_supportCode,HC)
		
		//Ticket
		F(HC_fnc_ticketCancel,HC)
		F(HC_fnc_ticketGive,HC)
		F(HC_fnc_ticketPay,HC)
		F(HC_fnc_ticketPlayer,HC)
		F(HC_fnc_ticketRefuse,HC)
		
		//Vehicles
		F(HC_fnc_butcherVehicle,HC)
		F(HC_fnc_buyVehicle,HC)
		F(HC_fnc_chopShopSell,HC)
		F(HC_fnc_flipVehicle,HC)
		F(HC_fnc_getVehicles,HC)
		F(HC_fnc_pushBoat,HC)
		F(HC_fnc_repairVehicle,HC)
		F(HC_fnc_serviceChopper,HC);
		F(HC_fnc_spawnVehicle,HC)
		F(HC_fnc_vehicleStore,HC)
		F(HC_fnc_vehicleDelete,HC)
		
		//Versicherung
		F(HC_fnc_getInsuranceVehicles,HC)
		F(HC_fnc_insureVehicle,HC)
		
		//Versicherung
		F(HC_fnc_virtusCrate,HC)
		
		//Waffenshop
		F(HC_fnc_buyWeapon,HC)
		
		//Wantedlist
		F(HC_fnc_fahndungAdd,HC)
		F(HC_fnc_fahndungNoteAdd,HC)
		F(HC_fnc_fahndungNoteEdit,HC)
		F(HC_fnc_fahndungNoteRemove,HC)
		F(HC_fnc_fahndungRemove,HC)
		F(HC_fnc_fahndungUpdate,HC)
		
		//Zentralbank
		F(HC_fnc_boltZenti,HC)
		F(HC_fnc_chargeZenti,HC)
		F(HC_fnc_sellZenti,HC)
		
		//Virtus
		F(HC_fnc_vituscrate,HC)
		
		//Transaktionen
		F(HC_fnc_removeItemInteraction,HC)
		
		//--------------------------------------------------------------------------------------------SERVER----------------------------------------------------------------------------------------
		
		//AC
        F(TON_fnc_adminInvisible,SERVER)
    };
	
	class Commands {
        mode = 1;
        jip = 0;
    };
};
