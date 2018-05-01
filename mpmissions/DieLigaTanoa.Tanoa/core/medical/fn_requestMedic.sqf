#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	N/A
*/
private["_medicsOnline"];
disableSerialization;
_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.
//_medicsOnline = true;



if(_medicsOnline) then {
	//There is medics let's send them the request.
	[life_corpse,profileName] remoteExecCall ["life_fnc_medicRequest",independent];

	life_respawn_timer = 3;
	life_request_timer = true;
} else {
	//No medics were online, send it to the police.
	[life_corpse,profileName] remoteExecCall ["life_fnc_copMedicRequest",west];
	life_respawn_timer = 0.1;
	life_request_timer = false;
};

if(ctrlEnabled 7302) then {
	liga_deathUnit spawn
	{
		private["_maxTime","_RespawnBtn","_Timer"];
		disableSerialization;
		_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
		_Timer = ((findDisplay 7300) displayCtrl 7301);
		
		_maxTime = time + (life_respawn_timer * 60);
		_RespawnBtn ctrlEnable false;		
		
		if (Life_request_timer) then 
		{
			_maxTime = time + (life_respawn_timer * 150);
			waitUntil {
				_Timer ctrlSetText format["Respawn verfügbar in: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
				round(_maxTime - time) <= 0 || isNull _this
			};
		};
		
		Life_request_timer = false; //resets increased respawn timer
		_RespawnBtn ctrlEnable true;
		_Timer ctrlSetText localize "STR_Medic_Respawn_2";
	};
};


//Create a thread to monitor duration since last request (prevent spammage).
[] spawn 
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	sleep (8 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};