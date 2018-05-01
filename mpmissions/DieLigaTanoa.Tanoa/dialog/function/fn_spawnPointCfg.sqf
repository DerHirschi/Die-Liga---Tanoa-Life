#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return","_return1"];
_side 		= [_this,0,civilian,[civilian]] call BIS_fnc_param;
_return 	= [];
_return1 	= [];

if(_side in [civilian,independent]) then {
	if(lci_reb) then {
		_return = _return + [
			["reb_spawn_1","Guerilla  HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["reb_spawn_2","Guerilla  City","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		//	["reb_spawn_3","Rebell OP","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
		//	["reb_spawn_op","Rebell OP Nord","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
	}else{
		switch (_side) do
		{
			case civilian:{
				_return = _return + [
					["civ_spawn_1","Georgetown","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["civ_spawn_2","Harcourt Sud","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
				];
			};
			case independent:{
				_return = _return + [
					["uhr_spawn_1","Sosovu","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["uhr_spawn_2","Katkoula","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
				];			
			};	
		};
		if!(EQUAL(FETCH_CONST(life_coplevel),0)) then {
			_return1 = _return1 + [
				["cop_spawn_1","Georgetown HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
				["cop_spawn_2","Aeroport Tanoa","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		//			["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
		//			["cop_spawn_4","Air HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
		//			["cop_spawn_5","HW Patrol","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		//			["cop_spawn_6","Trainingsg","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		//			["cop_spawn_7","Gefaengniss","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];	
		};

		if!(EQUAL(FETCH_CONST(life_medicLevel),0)) then {
			_return1 = _return1 + [
				["medic_spawn_1","Georgetown Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
				["medic_spawn_2","St. George Airstip","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
			//	["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			//	["medic_spawn_4","Molos OP","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			//	["medic_spawn_1_1","Shutter Island","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
			];
		}; 
		//Flus
		if!(EQUAL(life_blacklisted,0)) then {
			_return1 = _return1 + [
				["tower_1","Tanoa","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
				["tower_2","La Rochelle","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
				["tower_3","St George","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
				["tower_4","Sala Airstip","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
			];
		};			
	};
	if(count life_houses > 0) then {
		{
			_pos = call compile format["%1",SEL(_x,0)];
			_house = nearestObject [_pos, "House_F"];
			_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
			
			_return pushBack [format["house_%1",_house GVAR "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
		} foreach life_houses;
	};	
	switch(true) do {
		case cl_ano: 	{	_return = _return + [["anon_1","Anonymous HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]			];	};
		case cl_aod: 	{	_return = _return + [["aod_spawn","A.o.D. Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]		];	};
		case cl_rnsx: 	{	_return = _return + [["rsnx_spawn","R.N.S.X. Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]	];	};
		case cl_skull: 	{	_return = _return + [["skull","Skull Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]			];	};
		
	};	
};
_return = _return + _return1;


switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Georgetown HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"]
//			["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
//			["cop_spawn_4","Air HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
//			["cop_spawn_5","HW Patrol","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
//			["cop_spawn_6","Trainingsg","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
//			["cop_spawn_7","Gefaengniss","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
	};	
	case east: {
		_return = [
			["adac_spawn_1","Basis 1 ADAC","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["adac_spawn_2","Basis 2 ADAC","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		//	["adac_spawn_4","Basis 4 ADAC","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
	}; 
};

// Adminspawns
/*
if(ad_spwn) then {
	_return = _return + [
//		["skull","Skull Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
//		["rsnx_spawn","R.N.S.X. Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
//		["aod_spawn","A.o.D. Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
//		["anon_1","Anonymous HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
		["tower_1","Tanoa","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
		["tower_2","La Rochelle","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
		["tower_3","St George","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
		["tower_4","Sala Airstip","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
	];
};
*/
_return;