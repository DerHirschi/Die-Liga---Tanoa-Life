#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Retrieves all 3D-world positions in a building and also restricts
	certain positions due to window positioning.
*/
private["_building","_restricted","_var"];
_building 	= SEL(_this,0);
_mode 		= SEL(_this,1);

switch (_mode) do {
	case 0: { _var = "BoxPos";		};	
	case 1: { _var = "ZusatzPos";	};	
	default { _var = "";			};
};

if(EQUAL(_var,"")) exitWith {[]};

if(!isClass (missionConfigFile >> "LigaLadenClass" >> (typeOf _building))) then {_restricted = [];}else{
	_restricted = M_CONFIG(getArray,"LigaLadenClass",(typeOf _building),_var);
};	

_restricted;
