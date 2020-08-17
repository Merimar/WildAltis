class CarShops {
	class civ_car {
		vehicles[] = {
			{ "B_Quadbike_01_F", "true"},
			{ "C_Hatchback_01_F", "true" },
			{ "C_Offroad_01_F", "true" },
			{ "C_Offroad_01_covered_F", "true" },
			{ "C_Hatchback_01_sport_F","true" },
			{ "C_Offroad_02_unarmed_black_F", "true" },
			{ "C_SUV_01_F", "true" },
			{ "C_Van_01_box_F", "true" },
			{ "C_Van_01_transport_F", "true" },
			{ "C_Van_02_transport_F", "true" },
			{ "C_Van_02_vehicle_F", "true" }
		};
	};

	class civ_truck {
		vehicles[] = {
			{ "C_Van_01_fuel_F", "true" },
			{ "C_Truck_02_transport_F", "true" },
			{ "B_Truck_01_mover_F", "true" },
			{ "C_Truck_02_covered_F", "true" },
			{ "C_Truck_02_fuel_F", "true" },
			{ "B_Truck_01_transport_F", "true" },
			{ "B_Truck_01_fuel_F", "true" },
			{ "O_Truck_03_transport_F", "true" },
			{ "O_Truck_03_fuel_F", "true" },
			{ "B_Truck_01_covered_F", "true" },
			{ "B_Truck_01_box_F", "true" },
			{ "O_Truck_03_covered_F", "true"},
			{ "O_Truck_03_device_F", "true" }
		};
	};

	class civ_air {
		vehicles[] = {
			{ "B_Heli_Light_01_F", "true" },
			{ "O_Heli_Light_02_unarmed_F", "true" },
			{ "I_Heli_Transport_02_F", "true" },
			{ "B_Heli_Transport_03_unarmed_F", "true" },
			{ "B_T_VTOL_01_infantry_F", "true" },
			{ "B_T_VTOL_01_vehicle_F", "true" },
			{ "C_Plane_Civil_01_F", "true" },
			{ "C_Plane_Civil_01_racing_F", "true" },
			{ "I_Plane_Fighter_03_AA_F", "true" },
			{ "O_Plane_CAS_02_F", "true" },
			{ "B_Plane_CAS_01_F", "true" }
		};
	};
	
	class civ_boat {
		vehicles[] = {
			{ "B_Boat_Transport_01_F", "true" },
			{ "C_Rubberboat", "true" },
			{ "C_Boat_Civil_01_F", "true" },
			{ "O_Lifeboat", "true" }
		};
	};

	class civ_gokart {
		vehicles[] = {
			{ "C_Kart_01_F", "true" },
			{ "C_Kart_01_Fuel_F", "true" },
			{ "C_Kart_01_Red_F", "true" },
			{ "C_Kart_01_Vrana_F", "true" },
			{ "C_Kart_01_green_F", "true" },
			{ "C_Kart_01_orange_F", "true" },
			{ "C_Kart_01_white_F", "true" },
			{ "C_Kart_01_yellow_F", "true" },
			{ "C_Kart_01_black_F", "true" },
			{ "C_Kart_01_Blu_F", "true" }
		};
	};

	class reb_car {
		vehicles[] = {
			{ "O_G_Offroad_01_armed_F", "true"},
			{ "O_G_Offroad_01_F", "true" },
			{ "B_T_LSV_01_unarmed_F", "true" },
			{ "O_T_LSV_02_unarmed_F", "true" },
			{ "B_MRAP_01_F", "true" },
			{ "O_APC_Wheeled_02_rcws_F", "true" },
			{ "I_Truck_02_fuel_F", "true" },
            { "I_G_Van_01_fuel_F", "true" },
            { "O_T_Truck_03_fuel_ghex_F", "true" },
			{ "I_MRAP_03_F", "false" },
			{ "O_MRAP_02_F", "false" }
		};
	};

	class reb_air {
		vehicles[] = {
			{ "B_Heli_Light_01_F", "true" },
			{ "I_Heli_light_03_unarmed_F", "true" },
			{ "O_Heli_Transport_04_F", "true" },
			{ "O_Heli_Transport_04_bench_F", "true" },
			{ "O_Heli_Attack_02_F", "true" },
			{ "O_Heli_Attack_02_black_F", "true" },
			{ "O_Heli_Light_02_unarmed_F", "true" },
			{ "O_Heli_Transport_04_covered_F", "true" },
			{ "O_Heli_Transport_04_box_F", "true" },
			{ "I_Plane_Fighter_04_F", "true" },
			{ "O_Plane_Fighter_02_F", "true" },
			{ "B_Plane_Fighter_01_F", "true" }
		};
	};

	class med_car {
		vehicles[] = {
			{ "C_Quadbike_01_F", "call life_mediclevel >= 3" },
			{ "C_SUV_01_F", "call life_mediclevel >= 3" },
			{ "C_Hatchback_01_sport_F", "call life_mediclevel >= 4" },
			{ "C_Offroad_01_F", "call life_mediclevel >= 1" },
			{ "C_Truck_02_covered_F", "call life_mediclevel >= 1" },
			{ "I_MRAP_03_F", "call life_mediclevel >= 6" },
			{ "C_Van_02_medevac_F", "call life_mediclevel >= 2" },
			{ "C_Van_01_box_F", "call life_mediclevel >= 1" },
			{ "B_Truck_01_fuel_F", "call life_mediclevel >= 4" },
			{ "B_T_LSV_01_unarmed_F", "call life_mediclevel >= 4" },
			{ "B_MRAP_01_F", "call life_mediclevel >= 5" },
			{ "O_Truck_03_repair_F", "call life_mediclevel >= 5" },
			{ "C_Offroad_02_unarmed_F", "call life_mediclevel >= 2" },
			{ "C_Truck_02_box_F", "call life_mediclevel >= 2" }
		};
	};
	
	class med_air {
		vehicles[] = {
			{ "I_Heli_light_03_unarmed_F", "call life_mediclevel >= 4" },
			{ "B_Heli_Light_01_F", "call life_mediclevel >= 1" },
			{ "O_Heli_Transport_04_medevac_F", "call life_mediclevel >= 5" },
			{ "C_Heli_Light_01_civil_F", "call life_mediclevel >= 1" },
			{ "I_Heli_Transport_02_F", "call life_mediclevel >= 3" },
			{ "O_T_VTOL_02_infantry_F", "call life_mediclevel >= 5" },
			{ "O_Heli_Light_02_unarmed_F", "call life_mediclevel >= 2" },
			{ "B_T_VTOL_01_vehicle_F", "call life_mediclevel >= 6" },
			{ "B_Heli_Transport_01_F", "call life_mediclevel >= 7" },
			{ "B_T_VTOL_01_infantry_F", "call life_mediclevel >= 5" },
			{ "C_Plane_Civil_01_F", "call life_mediclevel >= 7" },
			{ "B_Heli_Transport_03_F", "call life_mediclevel >= 6" }
		};
	};

	class med_ship {
		vehicles[] = {
			{ "B_Boat_Transport_01_F", "call life_mediclevel >= 6" },
			{ "C_Boat_Transport_02_F", "call life_mediclevel >= 3" },
			{ "B_Boat_Armed_01_minigun_F", "call life_mediclevel >= 6" },
			{ "O_Lifeboat", "call life_mediclevel >= 2" },
			{ "C_Scooter_Transport_01_F", "call life_mediclevel >= 1" },
			{ "B_SDV_01_F", "call life_mediclevel >= 5" }
		};
	};

	class cop_car {
		vehicles[] = {
			{ "B_Quadbike_01_F", "call life_coplevel >= 1" },
			{ "B_GEN_Offroad_01_gen_F", "call life_coplevel >= 1" },
			{ "C_SUV_01_F", "call life_coplevel >= 2" },
			{ "C_Hatchback_01_sport_F", "call life_coplevel >= 3" },
			{ "B_Truck_01_box_F", "call life_coplevel >= 3" },
			{ "B_GEN_Van_02_transport_F", "call life_coplevel >= 3" },
			{ "B_MRAP_01_F", "call life_coplevel >= 5" },
			{ "O_MRAP_02_F", "call life_coplevel >= 7" },
			{ "I_MRAP_03_F", "call life_coplevel >= 6" },
			{ "B_T_LSV_01_unarmed_F", "call life_coplevel >= 3" },
			{ "O_T_LSV_02_unarmed_F", "call life_coplevel >= 4" },
			{ "I_Truck_02_covered_F", "call life_coplevel >= 3" },
			{ "O_APC_Wheeled_02_rcws_F", "call life_coplevel >= 7" },
			{ "B_MRAP_01_hmg_F", "call life_coplevel >= 8" }
		};
	};

	class cop_air {
		vehicles[] = {
			{ "B_Heli_Light_01_F", "call life_coplevel >= 2" }, //Humming
			{ "I_Heli_light_03_unarmed_F", "call life_coplevel >= 3" }, //Hellcat
			{ "O_Heli_Light_02_unarmed_F", "call life_coplevel >= 4" }, //Orca Kein Skin
			{ "O_Heli_Transport_04_F", "call life_coplevel >= 5" }, //Taru Kein Skin
			{ "B_Heli_Transport_03_F", "call life_coplevel >= 5" }, //Huron
			{ "B_Heli_Transport_01_F", "call life_coplevel >= 5" }, //Ghosthawk
			{ "B_Heli_Transport_01_camo_F", "call life_coplevel >= 7" }, //Ghosthawk bewaffnet
			{ "B_T_UAV_03_F", "call life_coplevel >= 6" }, //Falcon
			{ "B_T_VTOL_01_infantry_F", "call life_coplevel >= 5" }, //Blackfish
			{ "B_T_VTOL_01_vehicle_F", "call life_coplevel >= 5" }, //Blackfish vehicle
			{ "B_Heli_Attack_01_F", "call life_coplevel >= 3" } //Blackfoot
		};
	};

	class cop_ship {
		vehicles[] = {
			{ "B_Boat_Transport_01_F", "call life_coplevel >= 2" },
			{ "C_Boat_Civil_01_police_F", "call life_coplevel >= 2" },
			{ "B_Boat_Armed_01_minigun_F", "call life_coplevel >= 7" }, //GMG Boot ohne GMG
			{ "B_SDV_01_F", "call life_coplevel >= 6" }
		};
	};
};