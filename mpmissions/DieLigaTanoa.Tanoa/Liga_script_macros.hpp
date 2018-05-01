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
║	File: Liga_script_macros.hpp
║	Quelle & Vorlage: Tonic´s Altis Life RPG 4.0+ 
║   Edit & Author: Hirschi Liga-Life.de
║
║   Macros ... Yeahhh
╚══════════════════════════════════════════════════╝	
*/
/* remExec */
#define DEBUG 0
/* SKY - NET */
#define SKYLEARN 1

// old 3.1.4.8 Macros .....................................................
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)}) //Quick macro for creating a constant variable
#define __GETC__(var) (call var) //Quick clean macro for getting a value of a constant / compileFinal variable. i.e if(__GETC__(numberone) == 1) then {}

#define __SUB__(var1,var2) var1 = var1 - var2

//Control Macros
#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

/* 
	++++++++++++++++++++++++++++++++++++++++++++++++
	++++++++ Neue Macros 4.0 & 4.3 & Eigene ++++++++
	++++++++++++++++++++++++++++++++++++++++++++++++
*/

/*
	**********************************
	********* Script Config *********
	**********************************
*/
// *** Vehicle Macros *** 

#define VEH_DAMT(veh) veh allowDamage true
#define VEH_DAMF(veh) veh allowDamage false
#define VEH_SIMT(veh) veh enableSimulation true
#define VEH_SIMF(veh) veh enableSimulation false

// Trunk Abfrage KeyHandler
#define KIND_TRUNK_KH(veh) \
	veh isKindOf "Land_Pod_Heli_Transport_04_medevac_F" OR \
	veh isKindOf "Land_Pod_Heli_Transport_04_repair_F" OR \
	veh isKindOf "Land_Pod_Heli_Transport_04_ammo_F" OR \
	veh isKindOf "Land_Pod_Heli_Transport_04_box_F" OR \
	veh isKindOf "Land_Pod_Heli_Transport_04_fuel_F" OR \
	veh isKindOf "Land_Pod_Heli_Transport_04_covered_F" OR \
	veh isKindOf "Land_Pod_Heli_Transport_04_bench_F" OR \
	veh isKindOf "Land_Wreck_Traw_F" OR \
	veh isKindOf "Land_Wreck_Traw2_F" OR \
	veh isKindOf "Car" OR \
	veh isKindOf "Land_CargoBox_V1_F" OR \
	veh isKindOf "Land_WaterTank_F" OR \
	veh isKindOf "O_supplyCrate_F" OR \
	veh isKindOf "CargoNet_01_box_F" OR \
	veh isKindOf "Land_ShelvesMetal_F" OR \
	veh isKindOf "Air" OR \
	veh isKindOf "Ship" OR \
	veh isKindOf "House_F"
	
// Trunk Abfrage Inv	
#define KIND_TRUNK_INV(veh) \
	KIND_TRUNK_KH(veh) OR \
	veh isKindOf "Land_BarrelWater_F" OR \
	veh isKindOf "Land_Bucket_painted_F" OR \
	veh isKindOf "Land_HeatPump_F" OR \
	veh isKindOf "Land_WaterBarrel_F" OR \
	veh isKindOf "Land_TentA_F" OR \
	veh isKindOf "Land_Tank_rust_F" OR \
	veh isKindOF "Box"
	
	
//#define LOG_to_HC(MOD,VAR) if(SKY_HC_aktiv_1) then {SKY_log_link = [MOD,VAR]; PVAR_HC("SKY_log_link");}
#define LOG_to_HC(MOD,VAR) if(SKY_HC_aktiv_1) then {[1,[MOD,VAR]] remoteExec ["SKY_fnc_DBlogSys",HC_id];}


/* System Wide Stuff */
#define CASH life_cash
#define BANK life_atmcash
#define SYSTEM_TAG "life"
#define ITEM_TAG format["%1%2",SYSTEM_TAG,"item_"]
#define SUB(var1,var2) var1 = var1 - var2
#define ADD(var1,var2) var1 = var1 + var2
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)
#define GANG_FUNDS grpPlayer getVariable ["gang_bank",0];

/*
	remoteExec Section
	When uncommented it enables proper testing via local testing
	Otherwise leave it commented out for "LIVE" servers
*/
#ifdef DEBUG
#define RCLIENT 0
#else
#define RCLIENT -2
#endif

#define RSERV 2
#define RANY 0
/*
	SKY-NET
*/
#ifdef SKYLEARN
#define SKYNET_END \
	sleep 0.1;	
#else
#define SKYNET_END \
	sleep 1; \
	preProcessFile "SpyGlass\endoftheline.sqf"; \
	sleep 2.5; \
	failMission "SpyGlass";
#endif

#define RPT(name,var1)  \
diag_log "╠══════════════════════════════════════════════════╣";\
diag_log format ["║ ### DEV RPT Ausgabe: %1 ###",name];\
diag_log "╠══════════════════════════════════════════════════╣";\
diag_log format ["║ %2 : %1 ",var1,name];\
diag_log "╠══════════════════════════════════════════════════╣";\



//Namespace Macros
#define SVAR_MNS missionNamespace setVariable 
#define SVAR_UINS uiNamespace setVariable 
#define SVAR_PNS parsingNamespace setVariable 
#define GVAR_MNS missionNamespace getVariable 
#define GVAR_UINS uiNamespace getVariable
#define SVAR_PRONS profileNamespace setVariable
#define GVAR_PRONS profileNamespace getVariable

//Scripting Macros
#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define CONSTVAR(var) var = compileFinal (if(typeName var == "STRING") then {var} else {str(var)})
#define FETCH_CONST(var) (call var)
#define PVAR_ALL(var) publicVariable var
#define PVAR_SERV(var) publicVariableServer var
#define PVAR_ID(var,id) id publicVariableClient var
#define PVAR_HC(var) HC_id publicVariableClient var
#define GVAR getVariable
#define SVAR setVariable
#define SVARALL(OBJ,VARNAME,VAR) OBJ SVAR [VARNAME,VAR,true]
//#define SVARALL(OBJ,VARNAME,VAR) OBJ SVAR [VARNAME,VAR,true]
#define UISL(VAR) uiSleep VAR

#define RIFLE primaryWeapon player
#define RIFLE_ITEMS primaryWeaponItems player
#define PISTOL handgunWeapon player
#define PISTOL_ITEMS handgunItems player
#define LAUNCHER secondaryWeapon player

//Display Macros
#define CONTROL(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define CONTROL_DATA(ctrl) (lbData[ctrl,lbCurSel ctrl])
#define CONTROL_DATAI(ctrl,index) ctrl lbData index

//System Macros
#define grpPlayer group player
#define steamid getPlayerUID player
#define LICENSE_VARNAME(varName,flag) format["license_%1_%2",flag,M_CONFIG(getText,"Licenses",varName,"variable")]
#define LICENSE_VALUE(varName,flag) GVAR_MNS [LICENSE_VARNAME(varName,flag),false]
#define ITEM_VARNAME(varName) format["life_inv_%1",M_CONFIG(getText,"VirtualItems",varName,"variable")]
#define ITEM_VALUE(varName) GVAR_MNS [ITEM_VARNAME(varName),0]
#define ITEM_ILLEGAL(varName) M_CONFIG(getNumber,"VirtualItems",varName,"illegal")
#define ITEM_SELLPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"sellPrice")
#define ITEM_BUYPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"buyPrice")
#define ITEM_NAME(varName) M_CONFIG(getText,"VirtualItems",varName,"displayName")

//Condition Macros
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };} forEach _types;_res}

//Config Macros
#define FETCH_CONFIG(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define FETCH_CONFIG2(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define FETCH_CONFIG3(TYPE,CFG,SECTION,CLASS,ENTRY,SUB) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB)
#define FETCH_CONFIG4(TYPE,CFG,SECTION,CLASS,ENTRY,SUB,SUB2) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB >> SUB2)
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define BASE_CONFIG(CFG,CLASS) inheritsFrom(configFile >> CFG >> CLASS)
#define LIGA_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Liga_Settings" >> SETTING)
#define CONFIG_VEHICLES "CfgVehicles"
#define CONFIG_KLAMOTTEN "CfgKlamotten"
#define CONFIG_LIGA_VEHICLES "LigaCfgKarren"
#define CONFIG_LIGA_VEHSHOP "LigaKarrenLaden"
#define CONFIG_WEAPONS "CfgWeapons"
#define CONFIG_MAGAZINES "CfgMagazines"
#define CONFIG_GLASSES "CfgGlasses"

#define TEXTUARR ["textures","ligatexture1","ligatexture2","ligatexture3","ligatexture4","ligatexture5"]
