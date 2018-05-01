#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
#define SETTASK(TASK,CODE) if((ACT_SETS(TASK)) isEqualTo 1) then {CODE;}
#define RUNSCRIPT(TASK,CODE) if((SCRIP_SETS(TASK)) isEqualTo 1) then {CODE;}

/*
Post init Prozzess wenn HC aktiv ....

toDO
EVH
LOG´s
Scripte
*/


SETTASK("life_MP","SKY_life_MP" addPublicVariableEventHandler 	{LIFEmpLOG(SKY_life_MP);});	//Life_fnc_MP EVH LOG
SETTASK("BIS_MP","SKY_BIS_MP" addPublicVariableEventHandler 	{BISmpLOG(SKY_BIS_MP);});	//BIS_fnc_MP EVH LOG
//SETTASK("LogLink","SKY_log_link" addPublicVariableEventHandler 	{LogLi(SKY_log_link);});	//Log SYS ( Geldlog usw ) EVH
SETTASK("ServerDiag",[]call SKY_fnc_getSrvParam;);											//Server Diagnose Link EVH
//SETTASK("ClientRemoteLink","SKY_rem_link" addPublicVariableEventHandler {[SKY_rem_link]spawn SKY_fnc_RemLinkexec};);


//RUNSCRIPT("Schiffswrack",[]execVM "\a3_SkyNet_HC\Scripte\Schiffswrack\schiffwrackauto.sqf";);
//RUNSCRIPT("Jagen",[]execVM "\a3_SkyNet_HC\Scripte\Jagen\fn_huntingZone.sqf";);
//RUNSCRIPT("JagenHasen",[]execVM "\a3_SkyNet_HC\Scripte\Jagen\fn_huntingZoneHasen.sqf";);
