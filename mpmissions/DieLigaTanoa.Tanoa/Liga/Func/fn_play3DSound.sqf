#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi - Die Liga
	Vorlage: WIKI Example
	LIGACL_fnc_play3DSound
*/
if(isServer)exitWith {};
_veh 			= [_this,0,ObjNull	,[ObjNull]	] call BIS_fnc_param;
_sound			= [_this,1,""		,[""]		] call BIS_fnc_param;

if(isNull _veh || !alive _veh || EQUAL(_sound,"")) exitWith {};

_soundPath 		= [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay 	= _soundPath + "sounds\" + _sound;
playSound3D [_soundToPlay, _veh,false,getPos _veh,2,1,90];