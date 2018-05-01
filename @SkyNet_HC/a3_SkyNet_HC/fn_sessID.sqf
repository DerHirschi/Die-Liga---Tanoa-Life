#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*
	Author: Hirschi - Die Liga
	
	Prüft nach neustat ob Server auch neugestartet ist oder nicht.
*/
private["_trig","_oldID"];
diag_log "╠══════════════════════════════════════════════════╣";		
diag_log "║ Warte auf Session ID";		
diag_log "╠══════════════════════════════════════════════════╣";
waitUntil {!(isNil "SESSION_ID")};
_oldID = profileNamespace GVAR ["SESS_ID", -1];	
_trig = true;
if(EQUAL(_oldID,-1)) then {
	for "_i" from 1 to 20 do {	
		RPT("WARNUNG SESSION_ID konnte nicht gelesen werden",_oldID);
		_trig = false;
		sleep 3;
		_oldID = profileNamespace GVAR ["SESS_ID", -1];	
		if!(EQUAL(_oldID,-1)) exitWith {_trig = true; };
	};
};

if(_trig) then {
	if!(EQUAL(SESSION_ID,_oldID)) then {
		new_sess = true;
	}else{
		new_sess = false;
	};	
}else{
	new_sess = false;
};
profileNamespace SVAR ["SESS_ID", SESSION_ID];
diag_log format["║ SESSION_ID         			 : %1",SESSION_ID];		
diag_log format["║ OLD_ID	         			 : %1",_oldID];		
diag_log format["║ Neue Session        			 : %1",new_sess];			
diag_log "╠══════════════════════════════════════════════════╣";
SYSLOG(SKYID,"SESS ID",SESSION_ID,"OLD_ID",_oldID);