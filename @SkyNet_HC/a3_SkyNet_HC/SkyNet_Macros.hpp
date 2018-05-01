/*
╔══════════════════════════════════════════════════╗
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
║░░▀▀▀▀░░░█░░░█░░▀░░░░░▀░░░░░██░░░█░░░░░░░░▀▀▀█▀▀▀░║
║░█░░░░░░░█░░█░░░░▀░░░▀░░░░░░█░█░░█░░█▀▀▀░░░░░█░░░░║
║░░▀▀▀░░░░█▀▀░░░░░░▀░▀░░░▀▀░░█░░█░█░░█▀▀▀░░░░░█░░░░║
║░░░░░█░░░█░░█░░░░░░█░░░░░░░░█░░░██░░▀▀▀▀░░░░░█░░░░║
║░▀▀▀▀░░░░▀░░░▀░░░░░▀░░░░░░░░▀░░░░▀░░░░░░░░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
╠══════════════════════════════════════════════════╝
║	File: SkyNet_Macros.hpp
║	Quelle: Altis Life 4.0 
║ 	Edit & Author: Hirschi Liga-Life.de
║
║ 	Macros ... Yeahhh
╚══════════════════════════════════════════════════╝	
*/	
// Version & LOGs.

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

 
// HC Settings
#define VER getText(configFile >> "CfgHCSettings" >> "Settings" >> "VERs")
#define SKYon getNumber(configFile >> "CfgHCSettings" >> "Settings" >> "SKYons")
#define DEB getNumber(configFile >> "CfgHCSettings" >> "Settings" >> "BEBUG")
#define DEVLOGRPT getNumber(configFile >> "CfgHCSettings" >> "Settings" >> "RPT")
#define DEVLOGDB getNumber(configFile >> "CfgHCSettings" >> "Settings" >> "DBRPT")
#define DBon getNumber(configFile >> "CfgHCSettings" >> "Settings" >> "DBons")
#define SKYID getText(configFile >> "CfgHCSettings" >> "Settings" >> "SKY_IDs")
#define SYSLOGs getNumber(configFile >> "CfgHCSettings" >> "Settings" >> "SYSlogss")

#define HC_SETS(SETTING) getNumber(configFile >> "CfgHCSettings" >> "Settings" >> SETTING)
#define ACT_SETS(SETTING) getNumber(configFile >> "CfgHCSettings" >> "Tasks" >> SETTING)
#define SCRIP_SETS(SETTING) getNumber(configFile >> "CfgHCSettings" >> "Scripts" >> SETTING)

#define ADMIN_AR1 getArray(configFile >> "CfgHCSettings" >> "Admins" >> "Admin_aray1")
#define ADMIN_AR2 getArray(configFile >> "CfgHCSettings" >> "Admins" >> "Admin_aray2")
#define ADMIN_AR3 getArray(configFile >> "CfgHCSettings" >> "Admins" >> "Admin_aray3")
#define ADMIN_AR4 getArray(configFile >> "CfgHCSettings" >> "Admins" >> "Admin_aray4")
#define ADMIN_AR5 getArray(configFile >> "CfgHCSettings" >> "Admins" >> "Admin_aray5")

// Config File

//#define SKYCONFIGFILE(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define SKYMAPFILE(TYPE,CLASS,ENTRY) TYPE(configFile >> "Liga_Objekte" >> CLASS >> ENTRY)


#define CONFIG_VEHICLES "CfgVehicles"
#define CONFIG_LIGA_VEHICLES "LigaCfgKarren"
#define CONFIG_LIGA_VEHSHOP "LigaKarrenLaden"


// Public Variable
#define PVAR_ALL(var) publicVariable var
#define PVAR_SERV(var) publicVariableServer var
#define PVAR_ID(var,id) id publicVariableClient var
//#define PVAR_OWNER(var,OBplayer) (owner OBplayer) publicVariableClient var

#define GVAR getVariable
#define SVAR setVariable
#define SVARALL(OBJ,VARNAME,VAR) if(local OBJ) then {OBJ SVAR [VARNAME,VAR,true];}else{	[OBJ,VARNAME,VAR,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];} 
//#define SVARALL(OBJ,VARNAME,VAR) OBJ SVAR [VARNAME,VAR,true]

// *** Namespace Macros *** 

#define SVAR_UINS uiNamespace setVariable 
#define GVAR_UINS uiNamespace getVariable
#define SVAR_MNS missionNamespace setVariable 
#define GVAR_MNS missionNamespace getVariable 

// *** Script Macros *** 
#define SUB(var1,var2) var1 = var1 - var2
#define ADD(var1,var2) var1 = var1 + var2
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)

#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)}) //Quick macro for creating a constant variable

#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define CONSTVAR(var) var = compileFinal (if(typeName var == "STRING") then {var} else {str(var)})
#define FETCH_CONST(var) (call var)

#define PAR(VAR,SELE,STD,TYP) VAR = [_this,SELE,STD,[TYP]] call BIS_fnc_param
#define PARVAR(VAR,VAR1,SELE,STD,TYP) VAR = [VAR1,SELE,STD,[TYP]] call BIS_fnc_param
#define THIS(VAR,SELE) VAR = _this select SELE

#define SETMODEX(VAR,MODE,CODE) if(VAR isEqualTo MODE) exitWith {CODE;}


// *** Condition Macros *** 

#define EQUAL(condition1,condition2) condition1 isEqualTo condition2

// extDB

#define DB_AR [["extDB1","DB1"],["extDB2","DB2"],["extDB3","DB3"]]

#define EXTDB(DB,QUERY) ((DB_AR select DB) select 0) callExtension QUERY

#define G_SQL_ID(DB) switch (DB) do {\
										case 0: {GVAR_UINS "HC_SQL_ID1"};\
										case 1: {GVAR_UINS "HC_SQL_ID2"};\
										case 2: {GVAR_UINS "HC_SQL_ID3"};\
										}

#define SET_SQL_ID(DB) switch (DB) do {	\
										case 0: {\
										    (HC_extDB_notLoaded select 0 ) set [0,""]; \
										    (HC_extDB_notLoaded select 0 ) set [1,true]; \
											HC_SQL_ID1 = round(random(9999));\
											CONSTVAR(HC_SQL_ID1);\
											SVAR_UINS ["HC_SQL_ID1",HC_SQL_ID1];\
										};\
										case 1: {\
											(HC_extDB_notLoaded select 1 ) set [0,""]; \
											(HC_extDB_notLoaded select 1 ) set [1,true]; \
											HC_SQL_ID2 = round(random(9999));\
											CONSTVAR(HC_SQL_ID2);\
											SVAR_UINS ["HC_SQL_ID2",HC_SQL_ID2];\
										};\
										case 2: {\
											(HC_extDB_notLoaded select 2 ) set [0,""]; \
											(HC_extDB_notLoaded select 2 ) set [1,true]; \
											HC_SQL_ID3 = round(random(9999));\
											CONSTVAR(HC_SQL_ID3);\
											SVAR_UINS ["HC_SQL_ID3",HC_SQL_ID3];\
										};     }								
									
#define GET_SQL_ID(DB) switch (DB) do { \
																case 0: {FETCH_CONST(HC_SQL_ID1) };\
																case 1: {FETCH_CONST(HC_SQL_ID2) };\
																case 2: {FETCH_CONST(HC_SQL_ID3) };\
																}
																
#define HOLD_SQL_ID(DB) switch (DB) do { \
																case 0: {HC_SQL_ID1 = GVAR_UINS "HC_SQL_ID1"; CONSTVAR(HC_SQL_ID1); (HC_extDB_notLoaded select 0 ) set [0,""]; (HC_extDB_notLoaded select 0 ) set [1,true];};\
																case 1: {HC_SQL_ID2 = GVAR_UINS "HC_SQL_ID2"; CONSTVAR(HC_SQL_ID2); (HC_extDB_notLoaded select 1 ) set [0,""]; (HC_extDB_notLoaded select 1 ) set [1,true];};\
																case 2: {HC_SQL_ID3 = GVAR_UINS "HC_SQL_ID3"; CONSTVAR(HC_SQL_ID3); (HC_extDB_notLoaded select 2 ) set [0,""]; (HC_extDB_notLoaded select 2 ) set [1,true];};\
																}																
															


#define EXTDB_SETTINGS(SETTING,DB) getNumber(configFile >> "CfgHCSettings" >> ((DB_AR select DB) select 1) >> SETTING)
#define DATABASE_SELECTION(DB) getText(configFile >> "CfgHCSettings" >> ((DB_AR select DB) select 1) >> "Database")
#define EXTDB_LOGAR getArray(configFile >> "CfgHCSettings" >> "DB1" >> "LOG_Settings")
	
#define RCON_SELECTION getText(configFile >> "CfgHCSettings" >> "DB1" >> "RCON_Selection")
#define ADD_DB(DB) switch (DB) do {\
									case 0: {_result = "extDB1" callExtension format["9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM_V2:%2:skyraw",DATABASE_SELECTION(DB),FETCH_CONST(HC_SQL_ID1)];	}; \
									case 1: {_result = "extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM_V2:%2:skyraw",DATABASE_SELECTION(DB),FETCH_CONST(HC_SQL_ID2)];	}; \
									case 2: {_result = "extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM_V2:%2:skyraw",DATABASE_SELECTION(DB),FETCH_CONST(HC_SQL_ID3)];	}; \
									}

#define EXTDB_FAILED(DB,MESSAGE) \
	(HC_extDB_notLoaded select DB) set [0,##MESSAGE]; \
	(HC_extDB_notLoaded select DB) set [1,false]; \
	PVAR_SERV("HC_extDB_notLoaded"); \
	diag_log "╠══════════════════════════════════════════════════╣"; \
	diag_log format ["║ - init ERROR DB %1",(DB + 1)]; \
	diag_log format ["║ - %1",MESSAGE]; \
	diag_log "╠══════════════════════════════════════════════════╣";
	
//LOG DB LOG

#define SYSLOG(VAL1,VAL2,VAL3,VAL4,VAL5) if((EQUAL(SYSLOGs,1)) && (((HC_extDB_notLoaded select 0) select 1)) && (((HC_extDB_notLoaded select 1) select 1))) then { [0,VAL1,VAL2,VAL3,VAL4,VAL5] spawn SKY_fnc_DBlogSys }
#define SRVDIAGLOG if((HC_extDB_notLoaded select 0) select 1) then { [4] spawn SKY_fnc_DBlogSys }
#define LIFEmpLOG(VAL1) [2,VAL1] spawn SKY_fnc_DBlogSys
#define BISmpLOG(VAL1) [3,VAL1] spawn SKY_fnc_DBlogSys
#define LogLi(VAL1) [1,VAL1] spawn SKY_fnc_DBlogSys

#define ADMINLOG(VAL1,VAL2,VAL3,VAL4,VAL5) [5,VAL1,VAL2,VAL3,VAL4,VAL5] spawn SKY_fnc_DBlogSys

// Admin MSG

#define ADMINMSGALL(TYP,HEAD,MSG,ID) [0,TYP,HEAD,MSG] remoteExecCall ["fn_adlink",ID]


// Client Remote

//#define CLIENTREM(TYP,PARAM,VAL,ID) SKY_cl_link = [TYP,PARAM,VAL]; PVAR_ID("SKY_cl_link",ID)

// DEV RPT Log

#define RPT(name,var1) if(EQUAL(DEVLOGRPT,1)) then { \
diag_log "╠══════════════════════════════════════════════════╣";\
diag_log format ["║ ### DEV RPT Ausgabe: %1 ###",name];\
diag_log "╠══════════════════════════════════════════════════╣";\
diag_log format ["║ %2 : %1 ",var1,name];\
diag_log "╠══════════════════════════════════════════════════╣";\
}
// DB Call Schreiben
#define DBCA(DB) [_query,1,false,DB]call SKY_fnc_dbCall
#define DBCALL(DBA) if((EQUAL(EXTDB_SETTINGS("DB",DBA),1))) then {DBCA(DBA)}

// DB Call lesen
//#define DBCAR(DB,RES) RES = [_query,2,true,DB]call SKY_fnc_dbCall
//#define DBCALLR(DBA,VAR) if((EQUAL(EXTDB_SETTINGS("DB",DBA),1))) then {DBCA(DBA,VAR)}


// Diagnose 
#define COUNT_SQF (count diag_activeSQFScripts)