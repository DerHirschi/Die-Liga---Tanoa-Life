#include "..\..\Liga_script_macros.hpp"

/*
	Author: Hirschi - Die Liga
*/
private ["_veh","_vehUID"];

_veh	= nearestObjects[position player,["Car","Air","Ship"],40];
_exText	= "Es befindet sich kein Fahzeug in der naehe ...";
if(EQUAL(count _veh,0)) exitWith {hint _exText;};
_uid	= getPlayerUID player;


{
	_vehUID	= _x GVAR ["vehicle_info_owners",[] ];
	if!(	EQUAL(count _vehUID,0)	) then {
		_vehUID = SEL(_vehUID,0);
		if(	EQUAL(_uid,_vehUID)	)exitWith {_veh = _x;};
	};
} forEach _veh;

if(_veh isEqualType []) exitWith {hint _exText;};

