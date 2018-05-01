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
	║	File: fn_vehShopColor.sqf
	║		
	║	Author:  Hirschi - Die Liga		
	╚══════════════════════════════════════════════════╝
*/

private ["_textures","_classNameLife"];

_index = lbValue[2304,(lbCurSel 2304)];

if(isNull life_CarPreview OR !alive life_CarPreview OR EQUAL(_index,-1)) exitWith {};

_classNameLife = typeOf life_CarPreview;



if(!isClass (missionConfigFile >> CONFIG_LIGA_VEHICLES >> _classNameLife)) then {
	_classNameLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_className];
};
_textures = [];
{	ADD(_textures,M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,_classNameLife,_x))}foreach TEXTUARR;
_textures = SEL(SEL(_textures,_index),2);



if(isNil "_textures" OR {EQUAL(count _textures,0)}) exitWith {};


{life_CarPreview setObjectTexture [_forEachIndex,_x];} foreach _textures;
_prl = 100 preloadObject life_CarPreview;