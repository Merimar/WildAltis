private _unit = param [0, objNull];
private _return = [];

_return pushBack (uniform _unit);
_return pushBack (vest _unit);
_return pushBack (backpack _unit);
_return pushBack (goggles _unit);
_return pushBack (headgear _unit);
_return pushBack (assignedItems _unit);
_return pushBack (primaryWeapon _unit);
_return pushBack (handgunWeapon _unit);

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];

if (!((uniform _unit) isEqualTo "")) then {
    {
        if (_x in (magazines _unit)) then {
            _uMags pushBack _x;
        } else {
            _uItems pushBack _x;
        };
    } forEach (uniformItems _unit);
};

if (!((backpack _unit) isEqualTo "")) then {
    {
        if (_x in (magazines _unit)) then {
            _bMags pushBack _x;
        } else {
            _bItems pushBack _x;
        };
    } forEach (backpackItems _unit);
};

if (!((vest _unit) isEqualTo "")) then {
    {
        if (_x in (magazines _unit)) then {
            _vMags pushBack _x;
        } else {
            _vItems pushBack _x;
        };
    } forEach (vestItems _unit);
};

if (count (primaryWeaponItems _unit) > 0) then {
    {
        _pItems pushBack _x;
    } forEach (primaryWeaponItems _unit);
};

if (count (primaryWeaponMagazine _unit) > 0) then {
	_pMag = (primaryWeaponMagazine _unit) select 0;
	_pItems pushBack _pMag;
}else {
	_pItems pushBack "";
};

if (count (handgunItems _unit) > 0) then {
    {
        _hItems pushBack _x;
    } forEach (handGunItems _unit);
};

if (count (handgunMagazine _unit) > 0) then {
	_hMag = (handgunMagazine _unit) select 0;
	_hItems pushBack _hMag;
}else {
	_hItems pushBack "";
};

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;
_return;