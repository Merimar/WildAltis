class Life_Settings {
	bank_transferTax = .05; //Tax that player pays when transferring money from ATM. Tax = Amount * multiplier
	
	delivery_points[] = {"dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25"};
    
	/* Vehicle Purchase Prices */
    vehicle_purchase_multiplier_CIVILIAN = 1; //Civilian Vehicle Buy Price = Config_Vehicle price * multiplier
    vehicle_purchase_multiplier_COP = .35; //Cop Vehicle Buy Price = Config_Vehicle price * multiplier
    vehicle_purchase_multiplier_MEDIC = .1; //Medic Vehicle Buy Price = Config_Vehicle price * multiplier
    vehicle_purchase_multiplier_OPFOR = 1; // -- NOT IN USE -- Simply left in for east support.

    /* Vehicle Rental Prices */
    vehicle_rental_multiplier_CIVILIAN = .6; //Civilian Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_COP = .1; //Cop Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_MEDIC = .05; //Medic Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_OPFOR = .6; // -- NOT IN USE -- Simply left in for east support.
	
	vehicle_storage_fee_multiplier = .02; //Pull from garage cost --> Cost takes the playersides Buy Price * multiplier
	
    total_maxWeight = 24; //Static variable for the maximum weight allowed without having a backpack
	
	jail_locations[] = {"SpawnCop_Athira", "SpawnCop_KavalaHQ", "SpawnCop_HWP", "SpawnCop_Pyrgos", "SpawnCop_Sagonisi", "SpawnCop_Syrta ", "SpawnCop_TelosHQ,", "SpawnCop_Jail"};
	
	gang_max_size = 12;
	
	halo_jump_max = 1;
	halo_jump_price = 200000;
	halo_jump_auto_parachute = 150;
	halo_jump_height = 3000;
	
	fish_types[] = {"Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F"};
	
	items_night_disabled[] = {"dangernuclear ","danger"};

	random_spawn_locations[] = {"Kavala", "Athira", "Syrta", "Sofia", "Pyrgos", "Neochori"};
	
	drones[] = {"B_T_UAV_03_F"};
	tiVehicles[] = {"B_T_UAV_03_F","B_UAV_01_F","B_Heli_Attack_01_F","I_Heli_light_03_F","O_Heli_Attack_02_F","O_Heli_Attack_02_black_F"};
};