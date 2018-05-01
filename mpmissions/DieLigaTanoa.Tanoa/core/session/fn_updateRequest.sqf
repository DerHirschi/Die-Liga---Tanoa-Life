#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_updateRequest.sqf
	Author: Tonic
	Edit: Hirschi - Die Liga
*/
private["_packet","_array","_flag"];

_packet = [getPlayerUID player,(profileName),playerSide,CASH,BANK];
_array 	= [];
//_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};case east: {"adac"};};

	_flag = "civ";
	if(playerSide in [civilian,independent]) then {		
		if(liga_cop_on) then {_flag = "civ";};	
		if(liga_lrk_on) then {_flag = "civ";};	
	}else{	
		_flag = switch(playerSide) do {
					case west: {"cop"}; 
					//case independent: {"med"}; 
					case east: {"alac"};
					//default {"civ"};
		};			
	};


{
	if(EQUAL(SEL(_x,1),_flag)) then
	{
		//if!(EQUAL(SEL(_x,0),"lci_bohrt") ) then {
			_array pushBack [SEL(_x,0),(missionNamespace GVAR (SEL(_x,0)))];
		//};
	};
} foreach life_licenses;
_packet pushBack _array;
[] call life_fnc_saveGear;
_packet pushBack life_gear;
switch (playerSide) do {
case civilian: {
		_packet pushBack life_is_arrested;
	};
case independent: {
		_packet pushBack life_is_arrested;
	};	
};
_packet remoteExecCall ["DB_fnc_updateRequest",RSERV];