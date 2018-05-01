#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*
	╔═════════════════════════════════════════════════════╗
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░░░║
	║░░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░░░║
	║░░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░▀▀▀▀░░░█░░░█░░▀░░░░░▀░░░░░██░░░█░░░░░░░▀▀▀█▀▀▀░░░║
	║░░░█░░░░░░░█░░█░░░░▀░░░▀░░░░░░█░█░░█░░█▀▀▀░░░░█░░░░░░║
	║░░░░▀▀▀░░░░█▀▀░░░░░░▀░▀░░░▀▀░░█░░█░█░░█▀▀▀░░░░█░░░░░░║
	║░░░░░░░█░░░█░░█░░░░░░█░░░░░░░░█░░░██░░▀▀▀▀░░░░█░░░░░░║
	║░░░▀▀▀▀░░░░▀░░░▀░░░░░▀░░░░░░░░▀░░░░▀░░░░░░░░░░▀░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	╠═════════════════════════════════════════════════════╝
	║ File: fn_loadTurmInit.sqf
	║ Author: Hirschi - Die Liga
	╚═════════════════════════════════════════════════════╝
	[	
		[x.y.z],							|	Pos				|0	|0
		0,									|	DIR				|1	|1
		0,									|	RestartCount	|2	|2
		[[["sig",8],["oilu",7]],66],	|	Trunk Tank 1	|3	|3
		[[["sig",8],["oilu",7]],66],	|	Trunk Tank 2		|4	
		[[["sig",8],["oilu",7]],66],	|	Gerätehaus			|5	
		"7658554546466",					|	STEAM ID pid	|6	|4
		18,									|	Plate			|7	|5
		"Mas Tobias",						|	ProfilName			|8	
		8455								|	VID in DB vid		|9	
		["UID","UID"]						|	KEY UID´s			|10	
	]		
				   Procc,Gas	,Gasrate	,Ölrate
	SteuerArray [false,false,0			,0		]
*/
private ["_varNam","_turm","_turmData","_flag"];
diag_log "╠══════════════════════════════════════════════════╣";		
diag_log "║ Bohrturm Init Start";		
diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ Warte auf New Session freigabe ";	
waitUntil {!isNil "life_server_isReady"};		
waitUntil {life_server_isReady};
waitUntil {!isNil "new_sess"};
if!(new_sess)exitWith {
	diag_log "║ BohrturmInit abgebrochen.gleiche Session erkannt ";	
	diag_log "╚══════════════════════════════════════════════════╝";	
};

for "_i" from 1 to 5 do {
	_varNam 	= format ["LigaBohrturm_%1",_i];
	_turmData 	= profileNamespace GVAR [_varNam,""];
	_flag 		= [];
	if!(EQUAL(_turmData,"")) then {
		if!(EQUAL(SEL(_turmData,2),0)) then {	
			[
				SEL(_turmData,9),	//0	_vid
				SEL(_turmData,6),	//1	_pid
				SEL(_turmData,0),	//2	Pos
				SEL(_turmData,8),	//3	ProfilName
				SEL(_turmData,1),	//4	_DIR
				_varNam				//5	VarName (SLOT)
			] remoteExec ["TON_fnc_bohrturmReSpawn",RSERV];
			//Zähler			
			{
				if(EQUAL(_forEachIndex,2)) then {
					_flag set [_forEachIndex,(_x - 1)];
				}else{
					_flag set [_forEachIndex,_x];
				};				
			}forEach _turmData;
			
			//_flag = [SEL(_turmData,0),SEL(_turmData,1),(SEL(_turmData,2) - 1),SEL(_turmData,3),SEL(_turmData,4),SEL(_turmData,5),SEL(_turmData,6),SEL(_turmData,7)];
			profileNamespace SVAR [_varNam, _flag];
			SYSLOG(SKYID,"Bohrturm Init","Bohrturm respawned",str _varNam,str _flag);
			diag_log format ["║ Baue Slot 	:%1", _i];		
			diag_log format ["║ VarName   	:%1", _varNam];		
			diag_log format ["║ Vars 		:%1", _flag];		
			diag_log "╠══════════════════════════════════════════════════╣";	

		}else{		
			
			diag_log format ["║ lösche Slot :%1", _i];	
			SYSLOG(SKYID,"Bohrturm Init","Bohrturm gelöscht",str _varNam,str _turmData);
			diag_log "╠══════════════════════════════════════════════════╣";	
			profileNamespace SVAR [_varNam, 				nil];	
			profileNamespace SVAR [(_varNam + "_ObjArr"), 	nil];
			profileNamespace SVAR [(_varNam + "_steu"),		nil];
		};
	};	
		//profileNamespace SVAR [_varNam, 					nil];	
		//profileNamespace SVAR [(_varNam + "_ObjArr"), nil];
		//profileNamespace SVAR [(_varNam + "_steu"),	nil];
};	
diag_log "║ Bohrturm Init Ende ";	
diag_log "╠══════════════════════════════════════════════════╣";	


/*
	profileNamespace getVariable ["LigaBohrturm_1",[[0.0.0],0,0,[[],0],""]];
	profileNamespace getVariable ["LigaBohrturm_2",[[0.0.0],0,0,[[],0]]];
	profileNamespace getVariable ["LigaBohrturm_3",[[0.0.0],0,0,[[],0]]];
	profileNamespace getVariable ["LigaBohrturm_4",[[0.0.0],0,0,[[],0]]];
	profileNamespace getVariable ["LigaBohrturm_5",[[0.0.0],0,0,[[],0]]];

*/

