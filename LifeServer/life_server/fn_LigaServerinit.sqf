#include "Liga_Macros.hpp"
private["_handle"];
//[] execVM "\life_server\run.sqf";
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};

life_server_isReady = false;
life_server_extDB_notLoaded = "";
serv_sv_use = [];
PVAR_ALL("life_server_isReady");

// Developement & Debug 
debugRPT_srv = false;

diag_log "╔══════════════════════════════════════════════════╗";
diag_log "║- Server RPT Log                                                                                                    ";
diag_log "║                                                          --                                                                    ";
diag_log "║- Server wird gestartet ...                                                                                        ";
diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║----------- Altis Life RPG 3.1.4.8+  ------------";
diag_log "║-------- Developed by Tonic Boardwine  --------";
diag_log "║---- Modified by Liga-Life.de --- Die Liga ----";
diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║";
diag_log "║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║";
diag_log "║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║";
diag_log "║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║";
diag_log "║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║";
diag_log "║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║";
diag_log "║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║";
diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║          << Initialisiere HC Link >>";
diag_log "╟──────────────────────────────────────────────────╢";
[] execVM "\life_server\initHC.sqf";


diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║          << Initialisiere Datenbank >>";
diag_log "╟──────────────────────────────────────────────────╢";
if(isNil {GVAR_UINS "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	CONSTVAR(life_sql_id);
	SVAR_UINS ["life_sql_id",life_sql_id];

	//Retrieve extDB version
	_result = EXTDB "9:VERSION";
	["diag_log",[format["extDB: Version: %1",_result]]] call TON_fnc_logIt;
	if(EQUAL(_result,"")) exitWith {EXTDB_FAILED("The server-side extension extDB was not loaded into the engine, report this to the server admin.")};
	if ((parseNumber _result) < 52) exitWith {EXTDB_FAILED("extDB version is not compatible with current Altis life version. Require version 52 or higher.")};
	//Lets start logging in extDB
	EXTDB "9:ADD_PROTOCOL:LOG:SPY_LOG:spyglass";
	//Initialize connection to Database
	_result = EXTDB format["9:ADD_DATABASE:%1",DATABASE_SELECTION];
	if(!(EQUAL(_result,"[1]"))) exitWith {EXTDB_FAILED("extDB: Error with Database Connection")};
	_result = EXTDB format["9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM_V2:%2:altis-life-rpg-4",DATABASE_SELECTION,FETCH_CONST(life_sql_id)];
	if(!(EQUAL(_result,"[1]"))) exitWith {EXTDB_FAILED("extDB: Error with Database Connection")};
	//Initialize Logging options from extDB
	if((EQUAL(EXTDB_SETTINGS("LOG"),1))) then {
		{
			EXTDB format["9:ADD_PROTOCOL:LOG:%1:%2",SEL(_x,0),SEL(_x,1)];
			["diag_log",[format["extDB: %1 is successfully added",SEL(_x,0)]]] call TON_fnc_logIt;
		} forEach EXTDB_LOGAR;
	};
	//Initialize RCON options from extDB
	if((EQUAL(EXTDB_SETTINGS("RCON"),1))) then {
		RCON_ID = round(random(9999));
		CONSTVAR(RCON_ID);
		SVAR_UINS ["RCON_ID",RCON_ID];

		EXTDB format["9:START_RCON:%1",RCON_SELECTION];
		EXTDB format["9:ADD:RCON:%1",FETCH_CONST(RCON_ID)];
		["diag_log",["extDB: RCON is enabled"]] call TON_fnc_logIt;
	};
	//Initialize VAC options from extDB
	if((EQUAL(EXTDB_SETTINGS("VAC"),1))) then {
		VAC_ID = round(random(9999));
		CONSTVAR(VAC_ID);
		SVAR_UINS ["VAC_ID",VAC_ID];

		EXTDB "9:START_VAC";
		EXTDB format["9:ADD_PROTOCOL:STEAM:%1",FETCH_CONST(VAC_ID)];
		["diag_log",["extDB: VAC is enabled"]] call TON_fnc_logIt;
	};
	//Initialize MISC options from extDB
	if((EQUAL(EXTDB_SETTINGS("MISC"),1))) then {
		MISC_ID = round(random(9999));
		CONSTVAR(MISC_ID);
		SVAR_UINS ["MISC_ID",MISC_ID];

		EXTDB format["9:ADD_PROTOCOL:MISC:%1",FETCH_CONST(MISC_ID)];
		["diag_log",["extDB: MISC is enabled"]] call TON_fnc_logIt;
	};
	EXTDB "9:LOCK";
	["diag_log",["extDB: Connected to the Database"]] call TON_fnc_logIt;
} else {
	life_sql_id = GVAR_UINS "life_sql_id";
	CONSTVAR(life_sql_id);
	["diag_log",["extDB: Still Connected to the Database"]] call TON_fnc_logIt;
	if((EQUAL(EXTDB_SETTINGS("RCON"),1))) then {
		RCON_ID = GVAR_UINS "RCON_ID";
		CONSTVAR(RCON_ID);
		["diag_log",["extDB: RCON still enabled"]] call TON_fnc_logIt;
	};
	if((EQUAL(EXTDB_SETTINGS("VAC"),1))) then {
		VAC_ID = GVAR_UINS "VAC_ID";
		CONSTVAR(VAC_ID);
		["diag_log",["extDB: VAC still enabled"]] call TON_fnc_logIt;
	};
	if((EQUAL(EXTDB_SETTINGS("MISC"),1))) then {
		MISC_ID = GVAR_UINS "MISC_ID";
		CONSTVAR(MISC_ID);
		["diag_log",["extDB: MISC still enabled"]] call TON_fnc_logIt;
	};
};

//Broadbase PV to Clients, to warn about extDB Error.
//	exitWith to stop trying to run rest of Server Code
if(!(EQUAL(life_server_extDB_notLoaded,""))) exitWith {diag_log "║-extDB: Error checked extDB/logs for more info";}; //extDB did not fully initialize so terminate the rest of the initialization process.

diag_log "╠══════════════════════════════════════════════════╣";
//Run procedures for SQL cleanup on mission start.
["resetLifeVehicles"	,1] spawn DB_fnc_asyncCall;
["deleteDeadVehicles"	,1] spawn DB_fnc_asyncCall;
["countLifeVehicles"	,1] spawn DB_fnc_asyncCall;
["deleteOldHouses"		,1] spawn DB_fnc_asyncCall;
["deleteOldLaden"		,1] spawn DB_fnc_asyncCall;
["deleteOldGangs"		,1] spawn DB_fnc_asyncCall;
["deleteOldTanks"		,1] spawn DB_fnc_asyncCall;
["deleteLottoSchein"	,1] spawn DB_fnc_asyncCall;
//master1_group = createGroup civilian;
/*
{
	if!(isPlayer _x)then {
		[_x] join master_group;
		_x enableSimulationGlobal false;
	};
} forEach allUnits;
*/
master_group attachTo[bank_obj,[0,0,0]];
//Strip NPC's of weapons
{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(!(EQUAL(_x,""))) then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

//Null out harmful things for the server.
CONST(JxMxE_PublishVehicle,"No");

//[] execVM "\life_server\fn_initHC.sqf";
life_adminLevel = 0;
life_medicLevel = 0;
life_copLevel = 0;
life_adacLevel = 0;

life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "4 Meter BOS", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side ! NICHT REDEN !", "%UNIT_NAME", []];

liga_radio_not = radioChannelCreate [[1, 0, 0, 0.8], "NOTRUF", "%UNIT_NAME", []];

liga_radio_bos1 = radioChannelCreate [[1, 0.0039, 0.0068, 1], "BOS 1", "%UNIT_NAME", []];
liga_radio_bos2 = radioChannelCreate [[1, 0.0049, 0.0068, 1], "BOS 2", "%UNIT_NAME", []];
liga_radio_bos3 = radioChannelCreate [[1, 0.0059, 0.0068, 1], "BOS 3", "%UNIT_NAME", []];
liga_radio_bos4 = radioChannelCreate [[1, 0.0069, 0.0068, 1], "BOS 4", "%UNIT_NAME", []];
liga_radio_bos5 = radioChannelCreate [[1, 0.0079, 0.0068, 1], "BOS 5", "%UNIT_NAME", []];
liga_radio_bos6 = radioChannelCreate [[1, 0.0089, 0.0068, 1], "BOS 6", "%UNIT_NAME", []];
liga_radio_FS = radioChannelCreate [[1, 0.399, 0.68, 1], "Flugsicherung", "%UNIT_NAME", []];
//life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side ! NICHT REDEN !", "%UNIT_NAME", []];
//life_radio_east = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];



//General cleanup for clients disconnecting.
//_onDisconnect = ["SERV_onClientDisconnect","onPlayerDisconnected",{[_uid,_owner,_name] call TON_fnc_clientDisconnect}] call BIS_fnc_addStackedEventHandler;
//_onDisconnect = ["SERV_onClientDisconnect","HandleDisconnect",{[uid,unit,name] call TON_fnc_clientDisconnect}] call BIS_fnc_addStackedEventHandler;
addMissionEventHandler ["HandleDisconnect",{[SEL(_this,2),SEL(_this,0),SEL(_this,3)] call TON_fnc_clientDisconnect}]; //Colin's Merge
//addMissionEventHandler ["HandleDisconnect",{diag_log str _this;}]; //Colin's Merge

//addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];
[] execVM "\life_server\PlayerConect.sqf";
[] execVM "\life_server\functions.sqf";

if((EQUAL(SERVER_SETS("HC_mpfnc_log"),1)) && (EQUAL(HC_ON,1))) then 
	{[] execVM "\life_server\eventhandlers_HC.sqf";	}else{ [] execVM "\life_server\eventhandlers.sqf"; };


life_wanted_list = [];


// Performance Setup
//[] execVM "\life_server\Functions\Liga\fn_trawler.sqf";
//[] execVM "\life_server\Functions\Liga\addMap.sqf";
//sleep 1;

//Lockup the dome
/*
	private["_dome","_rsb"];
	_dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
	_rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];

	for "_i" from 1 to 3 do {_dome SVAR[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
	_rsb SVAR["bis_disabled_Door_1",1,true];
	VEH_DAMF(_rsb);
	VEH_DAMF(_dome);
*/
[] call TON_fnc_initHouses;  
[] call TON_fnc_initTankst;  
Liga_Laden = [];

//[] spawn life_fnc_initWanted;

[] call TON_fnc_LigaLifeInit;
[] call TON_fnc_LottoInit;
[] call TON_fnc_BauInit;
_handle = [] spawn TON_fnc_initLaden; 
waitUntil {scriptDone _handle};

//[] execVM "\life_server\Scripte\Missionen\AdminBase.sqf";
//east setFriend [civilian, 0];
//civilian setFriend [east, 0];
//west setFriend [east, 0];
//east setFriend [west, 0];

//fed_bank SVAR["safe",(count playableUnits),true];



//pb_spieler = [];
//pb_spielstatus = 0;
//pb_maxspieler = 15;


if((EQUAL(SERVER_SETS("Performance"),1))) then {
	[] call TON_fnc_LigaPerformance;
};

[] execVM "\life_server\Functions\airdrop\config.sqf";
[] execVM "\life_server\Functions\Schiffswrack\fn_generateschiffwrackAuto.sqf";
[] spawn TON_fnc_federalUpdate; // MainLoop
/* Session ID falls HC Disc*/
SESSION_ID = round(random(9999));
/* Laptop .. Hacking*/
//life_ATMhacked = 0;
//PVAR_ALL("life_ATMhacked");

airdrop_zomgoingon  = false;
PVAR_ALL("airdrop_zomgoingon");

life_server_isReady = true;
PVAR_ALL("life_server_isReady");


liga_cop_group = createGroup west;
PVAR_ALL("liga_cop_group");
liga_lrk_group = createGroup independent;
PVAR_ALL("liga_lrk_group");


diag_log "╠══════════════════════════════════════════════════╣";
diag_log format ["║ mNamenspace Count: %1",(count(allVariables missionNamespace))];
diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ - FSM Timemodule wird ausgeführt !!!";
//[8,true,15] execFSM "\life_server\FSM\timeModule.fsm";
[4,true,24] execFSM "\life_server\FSM\timeModule.fsm";
diag_log "║ - FSM Cleanup wird ausgeführt !!!";
[] execFSM "\life_server\FSM\cleanup.fsm";
diag_log "╠══════════════════════════════════════════════════╣";

//[] spawn SKY_fnc_RptLogOut;
/*
[]spawn{
	uiSleep 3;
	[]spawn TON_fnc_GebHanGetQ;
};
*/

/*
private ["_code"];
_code = GVAR_MNS "infistar_main_code";
_code = (str _code) splitString ";";
{
	diag_log str _x;
}forEach _code;
diag_log "";
diag_log "";
diag_log "";

_code = GVAR_MNS "infistar_mod";
_code = (str _code) splitString ";";
{
	diag_log str _x;
}forEach _code;
*/
//uiSleep 50;
//[] execVM "SpyGlass\fn_variableCheckS.sqf";