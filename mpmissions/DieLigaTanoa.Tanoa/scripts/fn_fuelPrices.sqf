#include "..\Liga_script_macros.hpp"
/*
	File: fuel_prices.sqf
	Author: Paradox
	Edited by Hirschi - Die Liga
	
	Description: Okay Google , sag mir die Preise
*/
private["_preise"];
_tanke  	= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _tanke) then{_preise = [];}else{_preise 	= _tanke GVAR ["TankPreis",[]]; };

if(EQUAL(count _preise,0)) then { 
	liga_fuwait_tr 	= false;
	[0] call life_fnc_fuelConfig;
	waitUntil {liga_fuwait_tr;};
	liga_fuwait_tr 	= false;
	hint format ["Die aktuellen Benzinpreise sind: \n %1$ pro Liter Diesel\n %2$ pro Liter Super\n %3$ pro Liter Kerosin.", fuel_diesel, fuel_super, fuel_Kerosin];	
}else{
	fuel_super 		= SEL(_preise,0);
	fuel_diesel 	= SEL(_preise,1);
	fuel_Kerosin 	= SEL(_preise,2);	
	hint format ["!! Privattankstelle !!\n\n Die aktuellen Benzinpreise sind: \n %1$ pro Liter Diesel\n %2$ pro Liter Super\n %3$ pro Liter Kerosin.", fuel_diesel, fuel_super, fuel_Kerosin];
};

