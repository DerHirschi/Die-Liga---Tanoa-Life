#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
HC_id = -1;
/*

_fn_wait = {
	private["_sb"];
	_sb = false;
	diag_log "║ - erstelle Login Prozedur ";
    _vergl = SKY_HC_Link;
	waitUntil{uiSleep 1; !(SKY_HC_Link isEqualTo  _vergl)};
	Sky_Net_Info set [1,((SKY_HC_Link select (Sky_Net_Info select 0)) select 0)];
	_i = 0;
	{
		if!(_i isEqualTo (Sky_Net_Info select 0) ) then {
			if!(_sb) then{
				if!((_x select 1) isEqualTo 3 ) then {_sb = false;}else{_sb = true;};
			};
		};
		uiSleep _i;
		_i = _i + 1;
	}forEach SKY_HC_Link;
	
	SKY_stanby = _sb;
	
	
	diag_log "╔══════════════════════════════════════════════════╗";
	diag_log "║       <<<< SKY-NET *** HC-LOGIN *** >>>>";
	diag_log "╟──────────────────────────────────────────────────╢";
	diag_log format["║ HC 		         			 : %1",SKYID];
	diag_log format["║ HC Slot          			 : %1",((Sky_Net_Info select 0) + 1)];
	//diag_log format["║ HC UID            : %1",(getPlayerUID sky_1)];	
	diag_log format["║ HC ID            			 : %1",(Sky_Net_Info select 1)];	
	diag_log format["║ HC standby  			 : %1",SKY_stanby];	
	diag_log format["║ HC Handshake Link : %1",SKY_HC_Link];	
	diag_log format["║ HC Net Info 				 : %1",Sky_Net_Info];							
	diag_log "╚══════════════════════════════════════════════════╝";	
	SYSLOG(SKYID,"HC LOGIN",SEL(Sky_Net_Info,0),SEL(Sky_Net_Info,1),"1 Slot    2 ID");
	SYSLOG(SKYID,"HC LINK",SEL(SKY_HC_Link,0),SEL(SKY_HC_Link,1),SEL(SKY_HC_Link,2));
	
	if(_sb) exitWith { []spawn _fn_wait; };
		

	(SKY_HC_Link select (Sky_Net_Info select 0)) set [1,3];
	PVAR_ALL("SKY_HC_Link");
	PVAR_ALL("Sky_Net_Info");
	
	[]spawn SKY_fnc_posInit;
	
	diag_log "╔══════════════════════════════════════════════════╗";
	diag_log "║       <<<< SKY-NET *** HC-Activ  *** >>>>";
	diag_log "╟──────────────────────────────────────────────────╢";
	diag_log format["║ HC 		         			 : %1",SKYID];
	diag_log format["║ HC Slot          			 : %1",((Sky_Net_Info select 0) + 1)];
	//diag_log format["║ HC UID            : %1",(getPlayerUID sky_1)];	
	diag_log format["║ HC ID            			 : %1",(Sky_Net_Info select 1)];	
	diag_log format["║ HC standby  			 : %1",SKY_stanby];	
	diag_log format["║ HC Handshake Link : %1",SKY_HC_Link];	
	diag_log format["║ HC Net Info 				 : %1",Sky_Net_Info];							
	diag_log "╚══════════════════════════════════════════════════╝";	
	
	SYSLOG(SKYID,"HC ACTIV",SEL(Sky_Net_Info,0),SEL(Sky_Net_Info,1),"1 Slot    2 ID");
	RPT("HC ACTIV",SKY_HC_Link);
	};
	
	
private["_e"];
diag_log "╟──────────────────────────────────────────────────╢";
diag_log "║   << Initialisiere SKY LINK >>";
diag_log "║ - erstelle Handshake ";
Sky_Net_Info = [-1,-1];
_e = true;


if(_e)exitWith {	
	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log "║ << Nicht auf HC Slot !!! Reconecte in 60 Sek >> ";
	diag_log "╟══════════════════════════════════════════════════╢";
	uiSleep 60;
	true;
};


uiSleep 1;
[]spawn _fn_wait;
	
//diag_log "║ - erstelle SKY LINK EVH";
//	"SKY_HC_Link" addPublicVariableEventHandler {};

	

diag_log "║ - Sende Handshake";
PVAR_SERV("SKY_HC_Link");

diag_log "╟──────────────────────────────────────────────────╢";


false;
diag_log "╟──────────────────────────────────────────────────╢";
diag_log "║   << SKY LINK initialisiert >>";
diag_log "╟──────────────────────────────────────────────────╢";
*/

if(name player isEqualTo "sky_1" || name player isEqualTo "headlessclient" )then 
	{
		SKY_HC_aktiv_1 = true;
		PVAR_ALL("SKY_HC_aktiv_1");
	};	
false;
waitUntil{uiSleep 5; !(HC_id isEqualTo -1);};
	diag_log "╠══════════════════════════════════════════════════╢";
	diag_log "║       <<<< SKY-NET *** HC-LOGIN *** >>>>";
	diag_log "╟──────────────────────────────────────────────────╢";
	diag_log format["║ HC - ID        			 : %1",HC_id];							
	diag_log "╠══════════════════════════════════════════════════╢";	
	[]spawn SKY_fnc_posInit;

"SKY_cl_diag_link" addPublicVariableEventHandler { [_this select 1]spawn SKY_fnc_clrem;	};
	
	
	
	
//if(name player isEqualTo "sky_2")then {(SKY_HC_Link select 1) set [1,1];_e = false; Sky_Net_Info set [0,1];};	
//if(name player isEqualTo "sky_3")then {(SKY_HC_Link select 2) set [1,1];_e = false; Sky_Net_Info set [0,2];};	
