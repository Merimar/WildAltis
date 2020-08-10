class CfgSpawnPoints {
	class Gangeroberung {
		displayName = "Gangeroberung";
		spawnMarker = "gang_spawn";
		icon = "\a3\ui_f\data\map\MapControl\bunker_CA.paa";
		condition = "playerSide isEqualTo east && (SCHILD_DEALER getVariable ['Zone_Dealer_Winner', '']) == ((group player) getVariable ['gang_name', '-1'])";
	};

	class Kavala {
		displayName = "Kavala";
		spawnMarker = "Spawn_Kavala";
		icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
		condition = "playerSide isEqualTo civilian";
	};

	class Pyrgos {
		displayName = "Pyrgos";
		spawnMarker = "Spawn_Pyrgos";
		icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
		condition = "playerSide isEqualTo civilian";
	};

	class Athira {
		displayName = "Athira";
		spawnMarker = "Spawn_Athira";
		icon = "\a3\ui_f\data\map\MapControl\transmitter_CA.paa";
		condition = "playerSide isEqualTo civilian";
	};

	class Sofia {
		displayName = "Sofia";
		spawnMarker = "Spawn_Sofia";
		icon = "\a3\ui_f\data\map\MapControl\transmitter_CA.paa";
		condition = "playerSide isEqualTo civilian";
	};

	class Flugzeugtraeger {
		displayName = "Flugzeugträger";
		spawnMarker = "Flugzeugtraeger_1";
		icon = "\a3\ui_f\data\map\MapControl\taskIcon_CA.paa";
		condition = "playerSide in [civilian, east]";
	};

	class Neochori {
		displayName = "Neochori";
		spawnMarker = "Spawn_Neochori";
		icon = "\a3\ui_f\data\map\MapControl\transmitter_CA.paa";
		condition = "playerSide isEqualTo civilian";
	};

	class Syrta {
		displayName = "Syrta";
		spawnMarker = "Spawn_Syrta";
		icon = "\a3\ui_f\data\map\MapControl\transmitter_CA.paa";
		condition = "playerSide isEqualTo civilian";
	};

	class HQ {
		displayName = "Rebellen City";
		spawnMarker = "Spawn_Rebcity";
		icon = "\a3\ui_f\data\map\MapControl\bunker_CA.paa";
		condition = "playerSide isEqualTo east";
	};

	class Aussenposten {
		displayName = "Außenposten";
		spawnMarker = "Spawn_Rebaussenposten";
		icon = "\a3\ui_f\data\map\MapControl\bunker_CA.paa";
		condition = "playerSide isEqualTo east";
	};

	class copTelos {
		displayName = "Telos HQ";
		spawnMarker = "SpawnCop_TelosHQ";
		icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
		condition = "playerSide isEqualTo west";
	};

	class copKavala {
		displayName = "Kavala HQ";
		spawnMarker = "SpawnCop_KavalaHQ";
		icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
		condition = "playerSide isEqualTo west";
	};

	class copPyrgos {
		displayName = "Pyrgos HQ";
		spawnMarker = "SpawnCop_Pyrgos";
		icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
		condition = "playerSide isEqualTo west";
	};

	class copSagonisi {
		displayName = "Sagonisi HQ";
		spawnMarker = "SpawnCop_Sagonesi";
		icon = "\a3\ui_f\data\map\MapControl\transmitter_CA.paa";
		condition = "playerSide isEqualTo west";
	};

	class copAthira {
		displayName = "Athira HQ";
		spawnMarker = "SpawnCop_Athira";
		icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
		condition = "playerSide isEqualTo west";
	};

	class copSyrta {
		displayName = "Syrta HQ";
		spawnMarker = "SpawnCop_Syrta";
		icon = "\a3\ui_f\data\map\MapControl\transmitter_CA.paa";
		condition = "playerSide isEqualTo west";
	};

	class copHWP {
		displayName = "HWP";
		spawnMarker = "SpawnCop_HWP";
		icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
		condition = "playerSide isEqualTo west";
	};

	class copJail {
		displayName = "Gefängnis";
		spawnMarker = "SpawnCop_Jail";
		icon = "\a3\ui_f\data\map\MapControl\bunker_CA.paa";
		condition = "playerSide isEqualTo west";
	};

	class copCheckpoint {
		displayName = "Checkpoint";
		spawnMarker = "SpawnCop_Checkpoint";
		icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
		condition = "playerSide isEqualTo west";
	};

	class copMarktHQ {
		displayName = "Marktplatz HQ";
		spawnMarker = "SpawnCop_Marktplatz";
		icon = "\a3\ui_f\data\map\MapControl\transmitter_CA.paa";
		condition = "playerSide isEqualTo west";
	};

	class medKavala {
		displayName = "Kavala HQ";
		spawnMarker = "SpawnFW_Kavala";
		icon = "\a3\ui_f\data\map\MapControl\taskIcon_CA.paa";
		condition = "playerSide isEqualTo independent";
	};

	class medAir {
		displayName = "Air HQ";
		spawnMarker = "SpawnFW_Airfield";
		icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
		condition = "playerSide isEqualTo independent";
	};

	class medPanagia {
		displayName = "Panagia HQ";
		spawnMarker = "SpawnFW_Panagia";
		icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
		condition = "playerSide isEqualTo independent";
	};
	
	class medAgios {
		displayName = "Agios HQ";
		spawnMarker = "SpawnFW_Agios";
		icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
		condition = "playerSide isEqualTo independent";
	};

	class medKavalaOutpost {
		displayName = "Kavala Outpost"; 
		spawnMarker = "SpawnFW_Aussenposten";
		icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
		condition = "playerSide isEqualTo independent";
	};

	class medHafen {
		displayName = "Feuerwehrhafen";
		spawnMarker = "FW_6";
		icon = "\a3\ui_f\data\map\MapControl\quay_CA.paa";  
		condition = "playerSide isEqualTo independent";
	};
};