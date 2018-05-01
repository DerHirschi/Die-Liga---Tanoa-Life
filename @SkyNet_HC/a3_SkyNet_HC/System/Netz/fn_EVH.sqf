#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*
	@file Version: 1a
	@file name: eventhandlers.sqf
	@file Author: TAW_Tonic
	@file edit: 4/14/2013
	Copyright © 2013 Bryan Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	
	newName: fn_EVH.sqf
	Edit: Hirschi - Die Liga
	Date: 12/09/15
*/

if(!isServer) exitWith {false;};
if(LIFEMPEH) then {
SKY_Srv_pipe = [false];
"SKY_Srv_pipe" addPublicVariableEventHandler {[life_fnc_MP_packet,0]call SKY_fnc_EHlog;	SKY_Srv_pipe = [false];};
diag_log "║ -life_fnc_MP_packet initialisiert";
/*
"SKY_Srv_pipe" addPublicVariableEventHandler {
	[EVHAvar1,0]call SKY_fnc_EHlog;
	SKY_Srv_pipe = [false]; 
	diag_log "║  >> SKY-NET - SRV_Pipe EVENT <<";
	};
	*/
	true;
};
if(LIFEMPEH || BISMPEH) then {
	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log "║ <<< SKY-NET - EVH Server Link initialisiert >>> ";
	diag_log "╠══════════════════════════════════════════════════╣";
};
