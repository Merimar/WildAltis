[] spawn {
	waitUntil { time > 0 };
	enableEnvironment [false, true];

	while {true} do {
		sleep 15;
		_isinturtlezone = ((player inArea "Farm_Turtle_1") || (player inArea "Farm_Turtle_2") || (player inArea "Farm_Turtle_3"));
		if(!(environmentEnabled select 0)) then {
			if(_isinturtlezone) then {
				enableEnvironment [true, true];
			};
		} else {
			if(!_isinturtlezone) then {
				enableEnvironment [false, true];
			};
		};
	};
}