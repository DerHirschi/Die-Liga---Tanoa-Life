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
private["_animalList","_dist","_radius","_animals","_zoneName","_unitsNear","_animalsActive"];
_zoneName = "hunting_zone_1";
_maxAnimals = 170;
//RPT("JAGEN Hasen läuft",">>>>>>>>>>>>>TEST<<<<<<<<<<<<<<<");
if(EQUAL(_zoneName,"")) exitWith {};
//RPT("JAGEN Hasen läuft",">>>>>>>>>>>>>TEST<<<<<<<<<<<<<<<");
_animalList = ["Rabbit_F"];
_radius = (getMarkerSize _zoneName) select 0;
_dist = _radius + 10;
_zone = getMarkerPos _zoneName;
_animals = [];
_unitsNear = false;
_animalsActive = false;
while {true} do {
    {if((_x distance _zone) < _dist) exitWith {_unitsNear = true;}; _unitsNear = false;} foreach playableUnits;
    if(_unitsNear && !_animalsActive) then {
        _animalsActive = true;
        for "_i" from 1 to _maxAnimals do {
            _animalClass = _animalList select floor random count _animalList;
            _position = [((_zone select 0) - _radius + random (_radius * 2)), ((_zone select 1) - _radius + random (_radius * 2)),0];
            _animal = createAgent [_animalClass,_position,[],0,"FORM"];
			_animal setVariable ["BIS_fnc_animalBehaviour_disable", true];
			//_animalClass createUnit [_position,master_group,"_animal=this", 0, "FORM"];
			
            _animal setDir (random 360);
            _animals pushBack _animal;
        };
    } else {
        if(!_unitsNear && _animalsActive) then {
            {deleteVehicle _x;} foreach _animals;
            _animals = [];
            _animalsActive = false;
        };
    };
    sleep (36 + random 5); 
};