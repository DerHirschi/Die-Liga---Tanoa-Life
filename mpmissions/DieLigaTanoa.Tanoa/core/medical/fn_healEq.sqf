#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi - Die Liga
	Vorlage: 
	
	Scriptpacket made by: 	Psychobastard
	Version:		05042014
	latest update:		05.04.2014
	state of development:	Final, Feedback
*/
private ["_healer","_injured","_outArr"];
_healer 	= SEL(_this,0);
_injured 	= SEL(_this,1);

_outArr 	= [];

_defi_pos = _healer modelToWorld [-0.5,0.2,0];
_defi = "Land_Defibrillator_F" createVehicle _defi_pos;
_defi setPos _defi_pos;
_defi setDir (getDir _healer - 180);

_outArr pushBack _defi;

_bb_pos = _healer modelToWorld [0.4,(0.2 - (random 0.5)),0];
_bb = "Land_BloodBag_F" createVehicle _bb_pos;
_bb setPos _bb_pos;
_bb setDir (random 359);	

_outArr pushBack _bb;


for "_i" from 1 to (1 + (round random 3)) do {
	_band_pos = _healer modelToWorld [(random 1.3),(0.8 + (random 0.6)),0];
	_band = "Land_Bandage_F" createVehicle _band_pos;
	_band setPos _band_pos;
	_band setDir (random 359);
	_outArr pushBack _band;
};
if (random 2 >= 1) then {
	_ab_pos = _healer modelToWorld [-0.8,(0.6 - (random 0.4)),0];
	_ab = "Land_Antibiotic_F" createVehicle _ab_pos;
	_ab setPos _ab_pos;
	_ab setDir (random 359);
	_outArr pushBack _ab;
};


_outArr;
