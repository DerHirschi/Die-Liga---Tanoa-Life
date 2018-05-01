#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*
    Author: Bryan "Tonic" Boardwine
	Edit by Hirschi Die Liga
    
    Description:
    Spawns animals around the marker when a player
    is near. Very basic WIP
    
    TODO:
    Change it up so animals repopulate over time.
*/
private["_animalList","_dist","_radius","_animals","_zoneName","_unitsNear","_animalsActive","_x1","_e","_position"];
_zoneName = "hunting_zone";
_maxAnimals = 90;
//RPT("JAGEN läuft",">>>>>>>>>>>>>TEST<<<<<<<<<<<<<<m<");
if(EQUAL(_zoneName,"")) exitWith {};
//RPT("JAGEN läuft",">>>>>>>>>>>>>TEST<<<<<<<<<<<<<<<");
_animalList = ["Sheep_random_F","Goat_random_F"];
_radius = (getMarkerSize _zoneName) select 0;
_dist = _radius + 80;
_zone = getMarkerPos _zoneName;
_animals = [];
_unitsNear = false;
_animalsActive = false;
while {true} do {
    {if((_x distance _zone) < _dist) exitWith {_unitsNear = true;}; _unitsNear = false;} foreach playableUnits;
    if(_unitsNear && !_animalsActive) then {
        _animalsActive = true;
		//RPT("JAGEN akt",">>>>>>>>>>>>>TEST<<<<<<<<<<<<<<<");
        for "_i" from 1 to (_maxAnimals - (count _animals)) do {
            _animalClass = _animalList select floor random count _animalList;
			_e = true;
			while{_e}do {
				_position = [((_zone select 0) - _radius + random (_radius * 2)), ((_zone select 1) - _radius + random (_radius * 2)),0];
				{ 	
					_e = false;
					if(_x distance2D _position < 50 ) exitWith { _e = true;};
				}foreach playableUnits;
			};			 
            _animal = createAgent [_animalClass,_position,[],0,"FORM"];
			_animal setVariable ["BIS_fnc_animalBehaviour_disable", true];
			//_animalClass createUnit [_position,master_group,"_animal=this", 0, "FORM"];
			
            _animal setDir (random 360);
            _animals pushBack _animal;
        };
    } else {
        if(!_unitsNear && _animalsActive) then {
            {if(!isNull _x) then {deleteVehicle _x;};} foreach _animals;
            _animals = [];
            _animalsActive = false;
        };
    };
	sleep (15 + random 5); 
	{
		if(!isNull _x) then {
			if((_x distance2D _zone) > _radius) then {
				_x1 = _x;				
				_e = true;
				{
					if(_x distance2D (position _x1) < 65 ) exitWith { _e = false;};
				}foreach playableUnits;
				if(_e) then {deleteVehicle _x; _animals deleteAt _forEachIndex;};
			};
		}else{
			_animals deleteAt _forEachIndex;
		};	
	
	}foreach _animals;
	if(_unitsNear && _animalsActive &&(count _animals < 65)) then {_animalsActive = false;};
};