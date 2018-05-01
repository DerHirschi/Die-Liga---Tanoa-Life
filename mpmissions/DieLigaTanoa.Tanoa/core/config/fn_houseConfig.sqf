#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Master config file for buyable houses?
*/
private["_house","_ret"];
_house = [_this,0,"",[""]] call BIS_fnc_param;
if(EQUAL(_house,"")) exitWith {[]};
if(!isClass (missionConfigFile >> "LigaHousingClass" >> _house)) exitWith {[]};

M_CONFIG(getArray,"LigaHousingClass",_house,"Preis");

