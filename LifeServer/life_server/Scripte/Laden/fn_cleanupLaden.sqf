#include "\life_server\Liga_Macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi
	Description:
	Cleans up containers inside the house.
*/
private["_query","_houses"];
_query 	= format["LadenCleanup:%1",_this];
_houses = [_query,2,true] call DB_fnc_asyncCall;

if(EQUAL((count _houses),0)) exitWith {};
{
	_pos 	= call compile format["%1",SEL(_x,0)];
	//_house = nearestObject [_pos, "House_F"];
	_house 	= nearestBuilding _pos;
	_id 	= _house GVAR "luid";
	if!(isNil "_id")then{
		deleteMarker format["laden_%1",_id];
		//deleteMarkerLocal	(str(_house GVAR "luid"));	
	};
	if(!isNil {(_house GVAR "kassen")}) then {
		
		{
			if(!isNull (SEL(_x,0))) then {				
				//diag_log str _x;
				deleteVehicle (SEL(_x,0));

			};
			{
				if(!isNull _x) then {
					deleteVehicle _x;

				};
			}foreach (SEL(_x,1));
		} foreach (_house GVAR "kassen");
		_house SVAR["kassen",nil,true];
	};
} foreach _houses;
Liga_Laden = Liga_Laden - [ObjNull];