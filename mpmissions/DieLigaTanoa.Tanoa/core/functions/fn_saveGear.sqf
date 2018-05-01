/*
	File: fn_saveGear.sqf
	Author: Bryan "Tonic" Boardwine
	Full Gear/Y-Menu Save by Vampire
	Edited: Itsyuka
	Edited: Hirschi - Die Liga
    
	Description:
	Saves the players gear for syncing to the database for persistence..
*/
private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];
if (playerSide == east) exitWith {};
_return = [];

_return pushBack uniform player;
_return pushBack vest player;
_return pushBack backpack player;
_return pushBack goggles player;
_return pushBack headgear player;
_return pushBack assignedITems player;
if(side player == west || side player == civilian && {(call life_save_civ)}) then {
    _return pushBack primaryWeapon player;
    _return pushBack handgunWeapon player;
} else {
    _return pushBack [];
    _return pushBack [];
};

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_yItems = [];
_uni = [];
_ves = [];
_bag = [];

if(uniform player != "") then
{
    {
        if (_x in (magazines player)) then {
            _uMags = _uMags + [_x];
        } else {
            _uItems = _uItems + [_x];
        };
    } forEach (uniformItems player);
};

if(backpack player != "") then
{
    {
        if (_x in (magazines player)) then {
            _bMags = _bMags + [_x];
        } else {
            _bItems = _bItems + [_x];
        };
    } forEach (backpackItems player);
};

if(vest player != "") then
{
    {
        if (_x in (magazines player)) then {
            _vMags = _vMags + [_x];
        } else {
            _vItems = _vItems + [_x];
        };
    } forEach (vestItems player);
};

if(count (primaryWeaponMagazine player) > 0 && alive player) then
{
    _pMag = ((primaryWeaponMagazine player) select 0);
    if(_pMag != "") then
    {
        _uni = player canAddItemToUniform _pMag;
        _ves = player canAddItemToVest _pMag;
        _bag = player canAddItemToBackpack _pMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_pMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_pMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_pMag];
            _handled = true;
        };
    };
};

if(count (handgunMagazine player) > 0 && alive player) then
{
    _hMag = ((handgunMagazine player) select 0);
    if(_hMag != "") then
    {
        _uni = player canAddItemToUniform _hMag;
        _ves = player canAddItemToVest _hMag;
        _bag = player canAddItemToBackpack _hMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_hMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_hMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_hMag];
            _handled = true;
        };
    };
};

if(count (primaryWeaponItems player) > 0) then
{
    {
        _pItems = _pItems + [_x];
    } forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
    {
        _hItems = _hItems + [_x];
    } forEach (handGunItems player);
};

	{
		_name = (_x select 0);
		_val = (_x select 1);
		if (_val > 0) then {
			for "_i" from 1 to _val do {
				_yItems = _yItems + [_name];
			};
		};
	} forEach [
		["lin_apl", lin_apl],
		["lin_rabi", lin_rabi],
		["lin_salem", lin_salem],
		["lin_orna", lin_orna],
		["lin_makr", lin_makr],
		["lin_tuna", lin_tuna],
		["lin_mule", lin_mule],
		["lin_cats", lin_cats],
		["lin_fisp", lin_fisp],
		["lin_wate", lin_wate],
		["lin_donu", lin_donu],
		["lin_turs", lin_turs],
		["lin_coff", lin_coff],
		["lin_cofbea", lin_cofbea],
		["lin_fuF", lin_fuF],
		["lin_fuE", lin_fuE],
		["lin_axe", lin_axe],
		["lin_tba", lin_tba],
		["lin_lpi", lin_lpi],
		["lin_red", lin_red],
		["lin_pea", lin_pea],
		["lin_def", lin_def],
		["lin_banan", lin_banan],		// Bananen
		["lin_tee", lin_tee],		// Bananen
		["li_rip", li_rip],		// ölpumpe
		["c_6", c_6],		// Bohrmaschine
		["lin_mache", lin_mache],		// Machete
		["li_keg", li_keg],		// Bohrmaschine
		["li_mau", li_mau],		// Bohrmaschine
		["li_prl", li_prl],		// Pressluftflasche
		

		["lin_stob", lin_stob],
		["lin_ana", lin_ana],
		["lin_bob", lin_bob],
		["lin_wei", lin_wei],
		["lin_gyr", lin_gyr],

		["lin_sps", lin_sps],
		["lin_jme", lin_jme],
		["li_sfb", li_sfb],
		["li_ghy", li_ghy],
		
		["lin_kafma", lin_kafma],	// Kaffemaschine

		["i_a7", i_a7],
		["i_a8", i_a8],
		["i_a9", i_a9],
		["l_a11", l_a11],
		["l_14", l_14],
		["l_15", l_15],
		["l_16", l_16],
		["l_17", l_17],
		["l_22", l_22],
		["l_23", l_23]
	];

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;
if(playerSide!=west) then
{
	if(call life_save_yinv) then {
		_return pushBack _yItems;
	} else {
		_return pushBack [];
	};
};

life_gear = _return;
