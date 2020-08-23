private _loadout = _this;

_returnloadout = [];

for "_i" from 0 to 5 do {
	_return = if((_loadout select _i) isEqualTo []) then { "" } else { (_loadout select _i) select 0 };	
	_returnloadout pushBack _return;	
};
for "_i" from 0 to 2 do {
	_return = if((_loadout select _i) isEqualTo []) then { 
		[] 
	} else { 
		_array = [];
		for "_i2" from 0 to 6 do {
			if(((_loadout select _i) select _i2) isEqualType "") then {
				_array pushBack [((_loadout select _i) select _i2), 0];
			} else {
				if(((_loadout select _i) select _i2) isEqualTo []) then {
					_array pushBack ["", 0];
				} else {
					_array pushBack ((_loadout select _i) select _i2);
				};
			};
		};
		_array
	};
	_returnloadout pushBack _return;	
};
for "_i" from 3 to 5 do {
	_return = if((_loadout select _i) isEqualTo []) then { [] } else { (_loadout select _i) select 1 };	
	_returnloadout pushBack _return;	
};
_items = [];
{_items pushBack [_x, 0];} forEach (_loadout select 9);
_returnloadout pushBack _items;
//prim 0, seco 1, pistol 2, uniform 3, vest 4, backpack 5, primitems 6, secoitems 7, pistolitems 8, uniformitems 9, secoitems 10, pistolitems 11, items 12

_returnloadout