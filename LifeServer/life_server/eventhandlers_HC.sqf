#include "Liga_Macros.hpp"
/*
	@file Version: 1a
	@file name: eventhandlers.sqf
	@file Author: TAW_Tonic
	@file edit: 4/14/2013
	Copyright © 2013 Bryan Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
*/

if(!isServer) exitWith {};
"life_fnc_MP_packet" addPublicVariableEventHandler {
	[_this select 0,_this select 1] call life_fnc_MPexec; 
	/*
		if(SKY_HC_aktiv_1) then {
			SKY_life_MP = life_fnc_MP_packet;
			PVAR_HC(HC_id,"SKY_life_MP");
		};
	*/	
//	SKY_Srv_pipe = [true]; 
//	publicVariableServer "SKY_Srv_pipe";
	};