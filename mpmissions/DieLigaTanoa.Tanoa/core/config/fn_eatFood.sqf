#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_eatFood.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main handling system for eating food.
	*Needs to be revised and made more modular and more indept effects*
*/
private["_food","_val","_sum"];
_food = [_this,0,"",[""]] call BIS_fnc_param;
if(_food == "") exitWith {};

if([false,_food,1] call life_fnc_handleInv) then {
	switch (_food) do
	{
		
		case "apple": {_val = 10};
		case "banan": {_val = 10};
		
		case "rabbit":{ _val = 20};
		case "salema": {_val = 30};
		case "ornate": {_val = 25};
		case "mackerel": {_val = 30};
		case "tuna": {_val = 100};
		case "mullet": {_val = 80};
		case "catshark": {_val = 100};
	//	case "turtle": {_val = 100};
		case "turtlesoup": {_val = 80};
		case "donuts": {_val = 30};
		case "tbacon": {_val = 40};
		case "peach": {_val = 10};
		case "gyro": {_val = 42};
		case "sala": {_val = 10};
		case "reva": {_val = 20};
		case "doen": {_val = 45};
		case "sheepraw": {_val = 7};
		case "goatraw": {_val = 7};
		case "roosterraw": {_val = 9};
		case "henraw": {_val = 8};
		case "ana": {_val = 12};
		case "bw": {_val = 23};
		case "stofish": {_val = 32};
		case "tutrei": {_val = 39};
		case "hode": {_val = 100};
	//	case "tee": {_val = 22};
		case "schok": {_val = 60};
		

	};

	_sum = life_hunger + _val;
	if(_sum > 100) then {_sum = 100; player setFatigue 1; hint "Du hast dich ueberfressen und fuehlst dich müde !!!";};
	if(EQUAL("hode",_food)) then {hint "Alter ... Du stopfst dir wohl alles rein.. ";};
	life_hunger = _sum;
	SVAR_PRONS ["liga_hun",life_hunger];
};