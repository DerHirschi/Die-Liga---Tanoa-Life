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
║	File: Liga_Macros.hpp
║	Quelle: Altis Life 4.0 
║ Edit & Author: Hirschi Liga-Life.de
║
║ Macros ... Yeahhh
╚══════════════════════════════════════════════════╝	
*/	

//Config
#define SKYon false
#define SKYdb false
#define EXTDB2 true

#define SERVER_SETS(SETTING) getNumber(configFile >> "CfgServerSettings" >> "Settings" >> SETTING)
#define HC_ON getNumber(configFile >> "CfgServerSettings" >> "Settings" >> "HC_Init")

/*
	remoteExec Section
	When uncommented it enables proper testing via local testing
	Otherwise leave it commented out for "LIVE" servers
*/
#define DEBUG 0

#ifdef DEBUG
#define RCLIENT 0
#else
#define RCLIENT -2
#endif

#define RSERV 2
#define RANY 0





#define SUB(var1,var2) var1 = var1 - var2
#define ADD(var1,var2) var1 = var1 + var2
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)

// *** Namespace Macros *** 

#define SVAR_UINS uiNamespace setVariable 
#define GVAR_UINS uiNamespace getVariable
#define SVAR_MNS missionNamespace setVariable 
#define GVAR_MNS missionNamespace getVariable 

// *** Script Macros *** 
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)}) //Quick macro for creating a constant variable

#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define CONSTVAR(var) var = compileFinal (if(typeName var == "STRING") then {var} else {str(var)})
#define FETCH_CONST(var) (call var)

//extDB

#define EXTDB_FAILED(MESSAGE) \
	life_server_extDB_notLoaded = [true,##MESSAGE]; \
	PVAR_ALL("life_server_extDB_notLoaded"); \
	diag_log MESSAGE;
	
#define EXTDB_SETTINGS(SETTING) getNumber(configFile >> "CfgServerSettings" >> "extDB" >> SETTING)
#define EXTDB_LOGAR getArray(configFile >> "CfgServerSettings" >> "extDB" >> "LOG_Settings")
	
#define EXTDB "extDB2" callExtension
#define RCON_SELECTION getText(configFile >> "CfgServerSettings" >> "extDB" >> "RCON_Selection")
#define DATABASE_SELECTION getText(configFile >> "CfgServerSettings" >> "extDB" >> "Database")

// Public Variable
#define PVAR_ALL(var) publicVariable var
#define PVAR_ID(var,id) id publicVariableClient var
#define PVAR_HC(HCID,var) HCID publicVariableClient var

#define GVAR getVariable
#define SVAR setVariable


// *** Condition Macros *** 

#define EQUAL(condition1,condition2) condition1 isEqualTo condition2

// *** Vehicle Macros *** 

#define VEH_DAMT(veh) veh allowDamage true
#define VEH_DAMF(veh) veh allowDamage false
#define VEH_SIMT(veh) veh enableSimulation true
#define VEH_SIMF(veh) veh enableSimulation false
#define VEH_SIMGLOBT(veh) veh enableSimulationGlobal true
#define VEH_SIMGLOBF(veh) veh enableSimulationGlobal false

// *** DB Macros ***


// *** DB UID Sperre 

#define DB_UID_LOCK(uid) if(uid > "76699999999999999") exitWith { \
diag_log "╠════════════════════════════════╣";\
diag_log "║Falsche UID - DB Call .. HACKER ??? ";\
diag_log format["║ UID: %1",uid];\
diag_log "╠════════════════════════════════╣";\
}


#define RPT(name,var1)  \
diag_log "╠══════════════════════════════════════════════════╣";\
diag_log format ["║ ### DEV RPT Ausgabe: %1 ###",name];\
diag_log "╠══════════════════════════════════════════════════╣";\
diag_log format ["║ %2 : %1 ",var1,name];\
diag_log "╠══════════════════════════════════════════════════╣";\


//Config Macros
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)

#define CONFIG_VEHICLES "CfgVehicles"
#define CONFIG_LIGA_VEHICLES "LigaCfgKarren"
#define CONFIG_LIGA_VEHSHOP "LigaKarrenLaden"

// HC LOG

#define LOG_to_HC(MOD,VAR) if!(HC_id isEqualTo -1) then {SKY_log_link = [MOD,VAR]; PVAR_HC("SKY_log_link");}