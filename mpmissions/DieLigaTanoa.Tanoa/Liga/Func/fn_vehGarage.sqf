#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi - Die Liga
	LIGACL_fnc_vehGarage
	
	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/
private ["_side"];
_type = [_this,0,"",[""]] call BIS_fnc_param;

if(EQUAL(_type,""))exitWith {};

/*
_side = "civ";
if(playerSide in [civilian,independent]) then {		
	if(liga_cop_on) then {_side = "cop";};	
	if(liga_lrk_on) then {_side = "med";};	
}else{	
	_side = switch(playerSide) do {
		case west: {_side = "cop";}; 
		//case independent: {"med"}; 
		case east: {_side = "alac";};
		//default {"civ"};
	};			
};
*/
_side = switch (side player) do {
		case west: 			{"cop"}; 
		case independent: 	{"med"}; 
		case east: 			{"adac"};
		default 			{"civ"};
};
[getPlayerUID player,_side,_type,player] remoteExec ["TON_fnc_getVehicles",RSERV];

