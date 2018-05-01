#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Retrieves all 3D-world positions in a building and also restricts
	certain positions due to window positioning.
*/
private["_building","_restricted"];
_building = SEL(_this,0);

if(!isClass (missionConfigFile >> "LigaHousingClass" >> (typeOf _building))) then {_restricted = [];}else{
	_restricted = M_CONFIG(getArray,"LigaHousingClass",(typeOf _building),"BoxPos");
};
_restricted;
