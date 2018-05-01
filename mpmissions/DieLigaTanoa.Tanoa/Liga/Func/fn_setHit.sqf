#include "..\..\Liga_script_macros.hpp"
/*
	╔══════════════════════════════════════════════════╗
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
	║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
	║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	╠══════════════════════════════════════════════════╝
	║	File: fn_setHit.sqf
	║	Author: Hirschi Liga-Life.de
	╚══════════════════════════════════════════════════╝
*/
private ["_HitArray","_veh","_hitClass"];
 
_veh 		= SEL(_this,0);
_HitArray 	= SEL(_this,1);
if(EQUAL(count _HitArray,0))exitWith {};

_hitClass	= SEL(getAllHitPointsDamage _veh,0);	
_veh allowDamage true;
{
	_veh setHitPointDamage [SEL(_hitClass,_forEachIndex),(_x)];
}forEach (SEL(_HitArray,0));

_veh setFuel (0.05 max SEL(_HitArray,1));
_veh allowDamage false;	 