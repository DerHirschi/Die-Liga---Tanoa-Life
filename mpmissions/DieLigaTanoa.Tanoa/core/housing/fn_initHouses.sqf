#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edited by H1rschi - D1e L1ga
	
	Description:
	Initializes the players houses, mainly throwing down markers.
*/
if(EQUAL(count life_houses,0))  exitWith {}; //Nothing to do.

{
	_position = call compile format["%1",SEL(_x,0)];
	_house = nearestBuilding _position;
								   
	_house SVAR["uid",((round(random 99999))),true];
	//SVARALL(_house,"uid",round(random 99999));
	
	
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	
	_marker = createMarkerLocal [format["house_%1",(_house GVAR "uid")],_position];
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	
} foreach life_houses;