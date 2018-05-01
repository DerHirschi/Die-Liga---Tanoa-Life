/*
	File: fuel_config.sqf
	Author: Hirschi - Die Liga		
*/
_mode	   = [_this,0,-1,[0]	] call BIS_fnc_param;

if(_mode isEqualTo 0)exitWith 	{ 	[[65,201]] call life_fnc_getPVC;	};  

if(_mode isEqualTo 1)exitWith 	{ 		
	private ["_ben","_kero"];
	life_shop_type	= "tank";
	_ben  = ["ben",true]call life_fnc_ligaWHcalcPreis;
	_kero = ["di" ,true]call life_fnc_ligaWHcalcPreis;
		
	fuel_Kerosin 	= round (_kero / 12) ;
	fuel_super 		= round (_ben  / 91) ;
	fuel_diesel 	= round (_ben  / 78) ;
	
	liga_fuwait_tr = true;
};  