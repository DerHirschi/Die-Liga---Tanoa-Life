#include "\life_server\Liga_Macros.hpp"
/*
	BLAH BLAH
	I LOVE NOTEPAD++ GET OVER IT
	BLAH!
*/
private["_house","_houseID","_containers","_query","_trunk"];
_house 		= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) 		exitWith {};
_houseID 	= _house GVAR["laden_id",-1];
if(EQUAL(_houseID,-1)) 	exitWith {};

_containers = _house GVAR ["kassen",[]];


_alltrunk 	= [];

{
	_trunk 		= [];
	{
		_trunk pushBack (_x GVAR ["Trunk",[[],0]]);
	}forEach SEL(_x,1);
	_alltrunk pushBack _trunk;
}forEach _containers;

_query = format["LadenUpdateTrunk:%1:%2",_alltrunk,_houseID];

[_query,1] call DB_fnc_asyncCall;

/*


[
	[[]],
	[[]],
	[[]],
	[[]],
	[[]]
]

*/