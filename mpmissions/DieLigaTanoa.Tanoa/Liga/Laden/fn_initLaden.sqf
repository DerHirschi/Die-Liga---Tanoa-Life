#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edited by H1rschi - D1e L1ga
	
	Description:
	Initializes the players houses, mainly throwing down markers.
*/
if(EQUAL(count liga_ladenhouses,0))  exitWith {}; //Nothing to do.

{
	_position = call compile format["%1",SEL(_x,0)];
	_house = nearestBuilding _position;
								   
	
	//SVARALL(_house,"uid",round(random 99999));
	if!(_house in life_vehicles) then {
		life_vehicles pushBack _house;
	};
	_id = _house GVAR "luid";
	if!(isNil "_id")then{
		deleteMarker format["laden_%1",_id];
		//deleteMarkerLocal	(str(_house GVAR "luid"));	
	};
	_house SVAR["luid",((round(random 99999))),true];
	_houseName = (_house GVAR ["ladextra",["Liga Laden",0,0]]) ;
	if(isNil "_id")then{
		if(EQUAL(SEL(_houseName,1),1) ) then {life_atmcash = life_atmcash - 10000;} ;
		if(EQUAL(SEL(_houseName,2),1) ) then {life_atmcash = life_atmcash - 10000;} ;
		
	};
	if(EQUAL(SEL(_houseName,1),0)) then {
		_houseName = SEL(_houseName,0);
		_marker = createMarkerLocal [format["laden_%1",(_house GVAR "luid")],_position];
		_marker setMarkerTextLocal _houseName;
		_marker setMarkerColorLocal "ColorPink";
		_marker setMarkerTypeLocal "loc_Lighthouse";
	}else{
		_houseName = SEL(_houseName,0);
		_marker = createMarker [format["laden_%1",(_house GVAR "luid")],_position];
		_marker setMarkerText _houseName;
		_marker setMarkerColor "ColorPink";
		_marker setMarkerType "loc_Lighthouse";

	};
	
} foreach liga_ladenhouses;