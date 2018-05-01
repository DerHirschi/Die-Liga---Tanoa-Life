//if(isServer || !hasInterface)exitWith{};

// Brett
diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ - kompiliere Liga - Client Funktion  ";
diag_log "║";
diag_log "║ -- Liga Brett";
[] execVM "Liga\Comp\Brett\liga_brett.sqf";
diag_log "║ -- Liga ChopShop Recv";
life_fnc_chopRecv 		      	= compileFinal  preprocessFileLineNumbers "Liga\Comp\Civ\fn_chopRecv.sqf";
fn_tankmani		 			  	= compileFinal  preprocessFileLineNumbers "Liga\Comp\Civ\tank_mani.sqf";
life_fnc_RechnungPrompt		  	= compileFinal  preprocessFileLineNumbers "Liga\Comp\Civ\liga_ticketSend.sqf";
liga_fnc_vehlock			  	= compileFinal  preprocessFileLineNumbers "Liga\Comp\Civ\liga_vehlock.sqf";
liga_fnc_trunk				  	= compileFinal  preprocessFileLineNumbers "Liga\Comp\Civ\liga_trunk.sqf";
//fn_ligatag		  = compileFinal  preprocessFileLineNumbers "Liga\Comp\Civ\liga_tag.sqf";
ligafn_ticketRec   	 		  	= compileFinal  preprocessFileLineNumbers "Liga\Comp\ALAC\Liga_ticket_rec.sqf";	// Cam Sys  

fn_tower 			 		  	= compileFinal  preprocessFileLineNumbers "Liga\Comp\Flusi\tower.sqf"; 			// Tower 
fn_flusi_cam 				  	= compileFinal  preprocessFileLineNumbers "Liga\Comp\Flusi\flusi_cam.sqf"; 		// Cam Sys  
ligafn_tuv_login 			  	= compileFinal  preprocessFileLineNumbers "Liga\Comp\ALAC\Liga_tuv_login.sqf";	// Cam Sys  
ligafn_alac_vehinfo 			= compileFinal  preprocessFileLineNumbers "Liga\Comp\ALAC\Liga_veh_info.sqf";	// Cam Sys  
ligafn_alac_ticket  			= compileFinal  preprocessFileLineNumbers "Liga\Comp\ALAC\Liga_ticket_act.sqf";	// Cam Sys  
ligafn_bcheck  					= compileFinal  preprocessFileLineNumbers "Liga\Comp\Flusi\Liga_bcheck.sqf";	// Cam Sys  

