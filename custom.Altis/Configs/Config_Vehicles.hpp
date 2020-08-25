class LifeCfgVehicles {
	class B_Quadbike_01_F {
        vItemSpace = 20;
        price = 18750;
		chopPrice = 5000;
		legal = 1;
		bankCapacity = 0;
		class textures {
			class Brown {
				name = "Brown";
				price = 1.2;
				condition = "playerSide in [civilian, east]";
				path[] = {"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"};
			};
			
			class Digi_Desert {
				name = "Digi Desert";
				price = 1.2;
				condition = "playerSide in [civilian, east]";
				path[] = {"\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"};
			};
			
			class Black {
				name = "Black";
				price = 1.2;
				condition = "playerSide in [civilian, east]";
				path[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"};
			};
			
			class Blue {
				name = "Blue";
				price = 1.2;
				condition = "playerSide in [civilian, east]";
				path[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"};
			};
			
			class Red {
				name = "Red";
				price = 1.2;
				condition = "playerSide in [civilian, east]";
				path[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"};
			};
			
			class White {
				name = "White";
				price = 1.2;
				condition = "playerSide in [civilian, east]";
				path[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"};
			};
			
			class DigiGreen {
				name = "Digi Green";
				price = 1.2;
				condition = "playerSide in [civilian, east]";
				path[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"};
			};
			
			class HunterCamo {
				name = "Hunter Camo";
				price = 1.2;
				condition = "playerSide in [civilian, east]";
				path[] = {"\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"};
			};
			
			class RebelCamo {
				name = "Rebel Camo";
				price = 1.2;
				condition = "playerSide in [civilian, east]";
				path[] = {"\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"};
			};
			
			class Polizei {
				name = "Polizei";
				price = 0.05;
				condition = "playerSide in [west]";
				path[] = {"Images\Polizei\Polizei_Quadbike.jpg"};
			};
	    };
    };
	
	class C_Offroad_01_F { 
        vItemSpace = 100;
		price = 56800;
		chopPrice = 21840;
		legal = 1;
		bankCapacity = 0;
        class textures {	
			class Red {
				name = "Red";
				path[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa","\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Yellow {
				name = "Yellow";
				path[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa","\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class White {
				name = "White";
				path[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa","\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Blue {
				name = "Blue";
				path[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Dark_Red {
				name = "Dark Red";
				path[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Blue_White {
				name = "Blue / White";
				path[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Taxi {
				name = "Taxi";
				path[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_Offroad_1.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
        };
    };
	
	class B_GEN_Offroad_01_gen_F {
        vItemSpace = 100;
		price = 56800;
		chopPrice = 21840;
		legal = 1;
		bankCapacity = 0;
        class textures {	
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\Offroad.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
		};
	};
	
	class B_GEN_Van_02_transport_F {
        vItemSpace = 100;
		price = 116800;
		chopPrice = 21840;
		legal = 1;
		bankCapacity = 0;
        class textures {	
			class Polizei  {
				name = "Polizei";
				path[] = {"Images\Polizei\Van.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
		};
	};

	class C_SUV_01_F {
		vItemSpace = 85;
		price = 215000;
		chopPrice = 76800;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Dark_Red {
				name = "Dark Red";
				path[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Silver {
				name = "Silver";
				path[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Orange {
				name = "Orange";
				path[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\SUV.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_suv.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
        };
    };

	class C_Hatchback_01_sport_F {
		vItemSpace = 35;
		price = 287000;
		chopPrice = 103600;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Red {
				name = "Red";
				path[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Dark_Blue {
				name = "Dark Blue";
				path[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Orange {
				name = "Orange";
				path[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Black_White {
				name = "Black / White";
				path[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Beige {
				name = "Beige";
				path[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Green {
				name = "Green";
				path[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\Sportlimo_Polizei.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			
			class Black {
				name = "Schwarz";
				path[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_limo.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
        };
    };

    class C_Hatchback_01_F {
		vItemSpace = 50;
		price = 41500;
		chopPrice = 16000;
		legal = 1;
		bankCapacity = 0;
        class textures {
		class Red {
			name = "Red";
			path[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"};
			condition = "playerSide in [civilian, east]";
			price = 1;
			};
		class Dark_Blue {
			name = "Dark Blue";
			path[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"};
			condition = "playerSide in [civilian, east]";
			price = 1;
			};
		class Orange {
			name = "Orange";
			path[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"};
			condition = "playerSide in [civilian, east]";
			price = 1;
			};
		class Black_White {
			name = "Black / White";
			path[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"};
			condition = "playerSide in [civilian, east]";
			price = 1;
			};
		class Beige {
			name = "Beige";
			path[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"};
			condition = "playerSide in [civilian, east]";
			price = 1;
			};
		class Green {
			name = "Green";
			path[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"};
			condition = "playerSide in [civilian, east]";
			price = 1;
			};
		class Polizei {
			name = "Polizei";
			path[] = {"Images\Polizei\Sportlimo_Polizei.jpg"};
			condition = "playerSide in [west]";
			price = 0.05;
			};
        };
    };

	class C_Kart_01_F {
		vItemSpace = 10;
		price = 70000;
		chopPrice = 27000;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };

	class C_Kart_01_Fuel_F : C_Kart_01_F{};
    class C_Kart_01_Red_F  : C_Kart_01_F{};
    class C_Kart_01_Vrana_F : C_Kart_01_F{};
	class C_Kart_01_green_F : C_Kart_01_F{};
    class C_Kart_01_orange_F  : C_Kart_01_F{};
    class C_Kart_01_white_F : C_Kart_01_F{};
	class C_Kart_01_yellow_F : C_Kart_01_F{};
    class C_Kart_01_black_F  : C_Kart_01_F{};
    class C_Kart_01_Blu_F : C_Kart_01_F{};

	class C_Van_01_box_F {
		vItemSpace = 200;
		price = 252500;
		chopPrice = 95000;
		legal = 1;
		bankCapacity = 0;
		class textures {
			class White {
				name = "White";
				path[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Red {
				name = "Red";
				path[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"};
				condition = "playerSide in [civilian, east]";
				price = 1;
			};
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_box_1.jpg", "Images\Medic\fw_box_2.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
        };
    };

	class C_Van_01_transport_F {
		vItemSpace = 160;
		price = 185000;
		chopPrice = 74500;
		legal = 1;
		bankCapacity = 0;
		class textures {
		class White {
			name = "White";
			path[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"};
			condition = "playerSide in [civilian, east]";
			price = 1;
			};	
		class Red {
			name = "Red";
			path[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"};
			condition = "playerSide in [civilian, east]";
			price = 1;
			};
        };
    };


	class B_Truck_01_transport_F {
		vItemSpace = 500;
		price = 1240000;
		chopPrice = 402100;
		legal = 1;
		bankCapacity = 0;
		class textures {};
    };
	
	
	class O_G_Offroad_01_F {
		vItemSpace = 100;
		price = 67500;
		chopPrice = 12000;
		legal = 0;
		bankCapacity = 0;
		class textures {};
    };
	
	class B_Truck_01_covered_F {
		vItemSpace = 800;
		price = 2750000;
		chopPrice = 1200000;
		legal = 1;
		bankCapacity = 0;
		class textures {};
    };
	
	class O_T_LSV_02_unarmed_F {
		vItemSpace = 120;
		price = 1706000;
		chopPrice = 500000;
		legal = 0;
		bankCapacity = 0;
		class textures {
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\Q1.jpg","Images\Polizei\Q2.jpg","Images\Polizei\Q3.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			
			class Black {
				name = "Schwarz";
				path[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
		};
    };


	class C_Van_01_fuel_F {
		vItemSpace = 180;
		price = 215000;
		chopPrice = 86000;
		legal = 1;
		bankCapacity = 0;
		class textures {
		class White {
			name = "White";
			path[] = {"\A3\soft_f_gamma\Van_01\data\van_01_ext_co.paa","\A3\soft_f_gamma\Van_01\data\van_01_tank_co.paa"};
			condition = "playerSide in [civilian, east]";
			price = 1;
			};
		class Red {
			name = "Red";
			path[] = {"\A3\soft_f_gamma\Van_01\data\van_01_ext_red_co.paa","\A3\soft_f_gamma\Van_01\data\van_01_tank_red_co.paa"};
			condition = "playerSide in [civilian, east]";
			price = 1;
			};
        };
    };


	class O_Truck_03_transport_F {
		vItemSpace = 700;
		price = 2320000;
		chopPrice = 1100000;
		legal = 1;
		bankCapacity = 0;
		class textures {};
    };
	
	class C_Truck_02_fuel_F {
		vItemSpace = 350;
		price = 465000;
		chopPrice = 212200;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };

	class B_Truck_01_box_F {
		vItemSpace = 1100;
		price = 4250000;
		chopPrice = 1610200;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Polizei {
				name = "Destroyer";
				path[] = {"Images\Polizei\Hemtt_1.jpg","Images\Polizei\Hemtt_2.jpg","Images\Polizei\Hemtt_3.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
		};
    };

	class O_Truck_03_covered_F {
		vItemSpace = 2025;
		price = 8715000;
		chopPrice = 2683000;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };

	class O_Truck_03_device_F {
		vItemSpace = 2425;
		price = 14145000;
		chopPrice = 3900000;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };

	class B_Heli_Light_01_F {
		vItemSpace = 35;
		price = 1120000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
		class textures {
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\Humming.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_m900.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
			class Civ_Blue {
				name = "Civ Blue";
				path[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"};
				condition = "playerSide in [civilian]";
				price = 1;
			};
			class Civ_Red {
				name = "Civ Red";
				path[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"};
				condition = "playerSide in [civilian]";
				price = 1;
			};
			class Blueline {
				name = "Blueline";
				path[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"};
				condition = "playerSide in [civilian]";
				price = 1;
			};
			class Elliptical {
				name = "Elliptical";
				path[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"};
				condition = "playerSide in [civilian]";
				price = 1;
			};
			class Furious {
				name = "Furious";
				path[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"};
				condition = "playerSide in [civilian]";
				price = 1;
			};
			class Jeans_Blue {
				name = "Jeans Blue";
				path[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"};
				condition = "playerSide in [civilian]";
				price = 1;
			};
			class Speedy_Redline {
				name = "Speedy Redline";
				path[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"};
				condition = "playerSide in [civilian]";
				price = 1;
			};
			class Sunset {
				name = "Sunset";
				path[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"};
				condition = "playerSide in [civilian]";
				price = 1;
			};
			class Vrana {
				name = "Vrana";
				path[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"};
				condition = "playerSide in [civilian]";
				price = 1;
			};
			class Waves_Blue {
				name = "Waves Blue";
				path[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"};
				condition = "playerSide in [civilian]";
				price = 1;
			};
			class Rebel_Digital {
				name = "Rebel Digital";
				path[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"};
				condition = "playerSide in [east]";
				price = 1;
			};
			class Digi_Green {
				name = "Digi Green";
				path[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"};
				condition = "playerSide in [east]";
				price = 1;
			};
		};
	};

	class O_Heli_Light_02_unarmed_F {
		vItemSpace = 210;
		price = 3045000;
		chopPrice = 0;
		legal = 0;
		bankCapacity = 0;
		class textures {
			class BlackCop {
				name = "Black";
				path[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\Orca.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_orca.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
			class White_Blue {
				name = "White / Blue";
				path[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"};
				condition = "playerSide in [civilian]";
				price = 1;
			};
			class Digi_Green {
				name = "Digi Green";
				path[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"};
				condition = "playerSide in [east]";
				price = 1;
			};
			class Desert_Digi {
				name = "Desert Digi";
				path[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"};
				condition = "playerSide in [east]";
				price = 1;
			};
			class EMS_White {
				name = "EMS White";
				path[] = {"#(argb,8,8,3)color(1,1,1,0.8)"};
				condition = "playerSide in [civilian]";
				price = 1;
			};

        };
    };

	class C_Plane_Civil_01_F {
		vItemSpace = 100;
		price = 1040000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
			name = "Feuerwehr";
			path[] = {"Images\Medic\fw_ceasar_1.jpg","Images\Medic\fw_ceasar_2.jpg"};
			condition = "playerSide in [independent]";
			price = 1;
			};
		};
    };
	
	class C_Plane_Civil_01_racing_F {
		vItemSpace = 100;
		price = 1070000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
	};

	class I_Heli_light_03_unarmed_F {
		vItemSpace = 60;
		price = 14760000;
		chopPrice = 0;
		legal = 0;
		bankCapacity = 0;
		class textures {
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\Cop_Hellcat.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_hellcat.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};			
		};
	};
		
	class B_Heli_Transport_01_F {
		vItemSpace = 100;
		price = 7072500;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Polizei {
			name = "Polizei";
			path[] = {"Images\Polizei\Cop_Ghosthawk.jpg","Images\Polizei\Cop_Ghosthawk2.jpg"};
			condition = "playerSide in [west]";
			price = 0.05;
			};
			class Feuerwehr {
			name = "Feuerwehr";
			path[] = {"Images\Medic\fw_ghosthawk_1.jpg","Images\Medic\fw_ghosthawk_2.jpg"};
			condition = "playerSide in [independent]";
			price = 1;
			};
		};
    };

	class B_Heli_Transport_03_unarmed_F {
		vItemSpace = 500;
		price = 10455000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };
	
	class I_Plane_Fighter_03_AA_F {
		vItemSpace = 1800;
		price = 10100000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };
	
	class B_T_VTOL_01_infantry_F {
		vItemSpace = 100;
		price = 17835000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Polizei {
			name = "Polizei";
			path[] = {"Images\Polizei\Cop_Blackfish1.jpg","Images\Polizei\Cop_Blackfish2.jpg","Images\Polizei\Cop_Blackfish3.jpg","Images\Polizei\Cop_Blackfish4.jpg"};
			condition = "playerSide in [west]";
			price = 0.05;
			};
			class Feuerwehr {
			name = "Feuerwehr";
			path[] = {"Images\Medic\fw_blackfish_1.jpg","Images\Medic\fw_blackfish_2.jpg","Images\Medic\fw_blackfish_3.jpg","Images\Medic\fw_blackfish_4.jpg"};
			condition = "playerSide in [independent]";
			price = 1;
			};
		};
    };
	
	class B_T_VTOL_01_vehicle_F {
		vItemSpace = 800;
		price = 28627000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Polizei {
			name = "Polizei";
			path[] = {"Images\Polizei\Cop_Blackfish1.jpg","Images\Polizei\Cop_Blackfish2.jpg","Images\Polizei\Cop_Blackfish3.jpg","Images\Polizei\Cop_Blackfish4.jpg"};
			condition = "playerSide in [west]";
			price = 0.05;
			};
			class Feuerwehr {
			name = "Feuerwehr";
			path[] = {"Images\Medic\fw_blackfish_1.jpg","Images\Medic\fw_blackfish_2.jpg","Images\Medic\fw_blackfish_3.jpg","Images\Medic\fw_blackfish_4.jpg"};
			condition = "playerSide in [independent]";
			price = 1;
			};
		};
    };
	
	

	class O_Heli_Transport_04_F {
		vItemSpace = 300;
		price = 8874450;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
		class textures {
		};
	};

	class O_Heli_Transport_04_box_F {
		vItemSpace = 650;
		price = 19003500;
		chopPrice = 0;
		legal = 0;
		bankCapacity = 0;
        class textures {};
    };

	class I_Heli_Transport_02_F {
		vItemSpace = 400;
		price = 8274825;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_mohawk_1.jpg", "Images\Medic\fw_mohawk_2.jpg", "Images\Medic\fw_mohawk_3.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};	
		};
    };

	 class B_Boat_Armed_01_minigun_F {
		vItemSpace = 110;
		price = 630000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_Gunboat_1.jpg","Images\Medic\fw_Gunboat_2.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};
    };

	class B_Boat_Transport_01_F {
		vItemSpace = 140;
		price = 141000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };

	class B_SDV_01_F {
		vItemSpace = 55;
		price = 99000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };

	class C_Rubberboat {
		vItemSpace = 200;
		price = 98000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };

	class C_Boat_Civil_01_F {
		vItemSpace = 460;
		price = 452000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };

	class C_Boat_Civil_01_rescue_F {
		vItemSpace = 320;
		price = 510000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };

	class C_Boat_Transport_02_F {
		vItemSpace = 140;
		price = 95200;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };

	class C_Scooter_Transport_01_F {
		vItemSpace = 20;
		price = 33000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };

	class O_G_Offroad_01_armed_F {
		vItemSpace = 95;
		price = 3966750;
		chopPrice = 1110000;
		legal = 0;
		bankCapacity = 0;
        class textures {};
    };



	class C_Offroad_01_covered_F {
		vItemSpace = 130;
		price = 73025;
		chopPrice = 20000;
		legal = 0;
		bankCapacity = 0;
        class textures {};
    };

	class I_C_Offroad_02_unarmed_F {
		vItemSpace = 100;
		price = 84110;
		chopPrice = 30000;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };

		class I_MRAP_03_F {
		vItemSpace = 100;
		price = 6500000;
		chopPrice = 2000000;
		legal = 0;
		bankCapacity = 0;
		class textures {
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\StriderPolizei.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			class Black {
				name = "Schwarz";
				path[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_strider.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};
	};
	
	class B_MRAP_01_F {
		vItemSpace = 60;
		price = 5121000;
		chopPrice = 1500000;
		legal = 0;
		bankCapacity = 0;
		class textures {
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\Hunter1.jpg","Images\Polizei\Hunter2.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			class Black {
				name = "Schwarz";
				path[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_hunter_1.jpg","Images\Medic\fw_hunter_2.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};
	};
			

	class C_Boat_Civil_01_police_F {
		vItemSpace = 75;
		price = 175000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };
	
	class B_Heli_Attack_01_F {
		vItemSpace = 95;
		price = 750000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
		class textures {
			class Black {
				name = "Schwarz";
				path[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			class Polizei  {
				name = "Polizei";
				path[] = {"Images\Polizei\Cop_Blackfoot.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
		};
	};
	
	class C_Offroad_02_unarmed_black_F {
		vItemSpace = 100;
		price = 81200;
		chopPrice = 45000;
		legal = 1;
		bankCapacity = 0;
        class textures {};		
	};
	
	class C_Van_02_transport_F {
		vItemSpace = 120;
		price = 105000;
		chopPrice = 45000;
		legal = 1;
		bankCapacity = 0;
        class textures {};	
		};
	
	class I_G_Boat_Transport_02_F {
		vItemSpace = 120;
		price = 190215;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };
	
	class C_Van_02_vehicle_F {
		vItemSpace = 220;
		price = 325000;
		chopPrice = 110000;
		legal = 1;
		bankCapacity = 0;
        class textures {};
    };
	
	class C_Van_02_medevac_F {
		vItemSpace = 45;
		price = 88000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
		class textures {
			class EMS {
				name = "Feuerwehr";
				path[] = {"Images\Medic\van_transport.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};
	};
	
	class O_Heli_Attack_02_F {
		vItemSpace = 125;
		price = 23247000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
		class textures {
			class Black {
				name = "Schwarz";
				path[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
				condition = "playerSide in [east]";
				price = 1;
			};
		};
	};
	
	
	class O_Heli_Transport_04_bench_F {
		vItemSpace = 65;
		price = 2472300;
		chopPrice = 0;
		legal = 0;
		bankCapacity = 0;
        class textures {};
    };
	
	class O_Heli_Transport_04_covered_F {
		vItemSpace = 180;
		price = 8874450;
		chopPrice = 0;
		legal = 0;
		bankCapacity = 0;
        class textures {};
    };
	
	class B_Plane_Fighter_01_F {
		vItemSpace = 4500;
		price = 32010000;
		chopPrice = 0;
		legal = 0;
		bankCapacity = 0;
        class textures {};
	};
	
	
	class O_Plane_Fighter_02_F {
		vItemSpace = 4000;
		price = 27100000;
		chopPrice = 0;
		legal = 0;
		bankCapacity = 0;
        class textures {};
	};
	
	class B_Plane_CAS_01_F {
		vItemSpace = 2600;
		price = 16100000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
	};
	
	class O_Plane_CAS_02_F {
		vItemSpace = 2000;
		price = 11633700;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
	};
	

	class I_Plane_Fighter_04_F {
		vItemSpace = 3300;
		price = 22920000;
		chopPrice = 0;
		legal = 0;
		bankCapacity = 0;
        class textures {};
	};

	class B_T_LSV_01_unarmed_F {
		vItemSpace = 80;
		price = 1150000;
		chopPrice = 320000;
		legal = 0;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_prowler_1.jpg","Images\Medic\fw_prowler_2.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
			
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\Prowler1.jpg","Images\Polizei\Prowler2.jpg","Images\Polizei\Prowler3.jpg","Images\Polizei\Prowler4.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			
			class Black {
				name = "Schwarz";
				path[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
		};
	};
	
	class B_MRAP_01_hmg_F {
		vItemSpace = 90;
		price = 7000000;
		chopPrice = 1500000;
		legal = 0;
		bankCapacity = 0;
        class textures {
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\Hunter1.jpg","Images\Polizei\Hunter2.jpg","Images\Polizei\Turret.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
		};
	};
	
	class O_Heli_Attack_02_black_F {
		vItemSpace = 150;
		price = 24354000;
		chopPrice = 0;
		legal = 0;
		bankCapacity = 0;
		class textures {};
	};
	
	class I_E_Offroad_01_covered_F {
		vItemSpace = 30;
		price = 310000;
		chopPrice = 81250;
		legal = 1;
		bankCapacity = 0;
        class textures {};
	};
	
	class C_Quadbike_01_F {
		vItemSpace = 25;
		price = 40000;
		chopPrice = 1337;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_quad.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};
	};
	
	class O_Truck_03_repair_F {
		vItemSpace = 10;
		price = 110000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_tempest_1.jpg","Images\Medic\fw_tempest_2.jpg","Images\Medic\fw_tempest_3.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};
	};
	
	class C_Truck_02_covered_F {
		vItemSpace = 380;
		price = 525000;
		chopPrice = 240000;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_zamak_1.jpg","Images\Medic\fw_zamak_2.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};
	};
	
	class C_Truck_02_box_F {
		vItemSpace = 250;
		price = 31110;
		chopPrice = 90000;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_zamak_1.jpg","Images\Medic\fw_zamak_2.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};		
	};
	
	class C_Truck_02_transport_F {
		vItemSpace = 300;
		price = 399000;
		chopPrice = 92000;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_zamak_1.jpg","Images\Medic\fw_zamak_2.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};
	};
	
	class C_Offroad_02_unarmed_F {
		vItemSpace = 50;
		price = 28000;
		chopPrice = 1337;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_MB4WD.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};
	};

	class O_Truck_03_fuel_F {
		vItemSpace = 860;
		price = 3125000;
		chopPrice = 1500000;
		legal = 1;
		bankCapacity = 0;
        class textures {};
	};
	
	class B_Truck_01_fuel_F {
		vItemSpace = 620;
		price = 1962500;
		chopPrice = 1;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_hemtt_1.jpg","Images\Medic\fw_hemtt_2.jpg","Images\Medic\fw_hemtt_3.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};
    };
	
	//Tempest Fuel
	class O_T_Truck_03_fuel_ghex_F {
		vItemSpace = 20;
		price = 4001500;
		chopPrice = 1000000;
		legal = 0;
		bankCapacity = 20;
		class textures {};
	};
	
	//Zamak Fuel
	class I_Truck_02_fuel_F {
		vItemSpace = 10;
		price = 2001500;
		chopPrice = 500000;
		legal = 0;
		bankCapacity = 10;
		class textures {};
    };
	
	//Truck Boxer Fuel
	class I_G_Van_01_fuel_F {
		vItemSpace = 5;
		price = 1001500;
		chopPrice = 250000;
		legal = 0;
		bankCapacity = 5;
        class textures {};
	};
		

	class B_Truck_01_mover_F {
		vItemSpace = 50;
		price = 250000;
		chopPrice = 100000;
		legal = 1;
		bankCapacity = 0;
		class textures {};
	};
	
	
	class O_Lifeboat {
		vItemSpace = 360;
		price = 229125;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};
	};
	
	class I_Truck_02_covered_F {
		vItemSpace = 450;
		price = 402600;
		chopPrice = 185000;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\Zamak1.jpg","Images\Polizei\Zamak2.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
		};
	};
	
	class O_Heli_Transport_04_medevac_F {
		vItemSpace = 90;
		price = 612500;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_taru_1.jpg","Images\Medic\fw_taru_2.jpg","Images\Medic\fw_taru_3.jpg","Images\Medic\fw_taru_4.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};
	};
	
	class C_Heli_Light_01_civil_F {
		vItemSpace = 40;
		price = 141500;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_m900.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};
	};
	
	class O_T_VTOL_02_infantry_F {
		vItemSpace = 90;
		price = 2460000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_xian_1.jpg","Images\Medic\fw_xian_2.jpg","Images\Medic\fw_xian_3.jpg","Images\Medic\fw_xian_3.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
		};
	};
	
	class B_Heli_Transport_03_F {
		vItemSpace = 90;
		price = 2460000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {
			class Feuerwehr {
				name = "Feuerwehr";
				path[] = {"Images\Medic\fw_huron_1.jpg","Images\Medic\fw_huron_2.jpg"};
				condition = "playerSide in [independent]";
				price = 1;
			};
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\Huron1.jpg","Images\Polizei\Huron2.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
		};
	};
	
	class O_APC_Wheeled_02_rcws_F {
		vItemSpace = 4100;
		price = 25000000;
		chopPrice = 4000000;
		legal = 0;
		bankCapacity = 0;
        class textures {
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\Marid1.jpg","Images\Polizei\Marid2.jpg","Images\Polizei\Turret.jpg","Images\Polizei\Marid3.jpg","Images\Polizei\Marid3.jpg"};
				condition = "playerSide in [west]";
				price = 0.1;
			};
		};
	};
	
	class B_Heli_Transport_01_camo_F {
		vItemSpace = 180;
		price = 22140000;
		chopPrice = 0;
		legal = 1;
		bankCapacity = 0;
        class textures {};	
	};
	
	class B_T_UAV_03_F {
		vItemSpace = 0;
		price = 1512000;
		chopPrice = 622000;
		legal = 1;
		bankCapacity = 0;
        class textures {};		
	};
	
	class O_MRAP_02_F {
		vItemSpace = 150;
		price = 8500000;
		chopPrice = 2500000;
		legal = 0;
		bankCapacity = 0;
        class textures {
			class Polizei {
				name = "Polizei";
				path[] = {"Images\Polizei\IFRIT1.jpg","Images\Polizei\IFRIT2.jpg"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
			class Black {
				name = "Schwarz";
				path[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
				condition = "playerSide in [west]";
				price = 0.05;
			};
		};
	};
};