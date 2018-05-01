#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*
	SKY-NET DB Initialize


if((EQUAL(EXTDB_SETTINGS("DB",0),0)) && (EQUAL(EXTDB_SETTINGS("DB",1),0)) && (EQUAL(EXTDB_SETTINGS("DB",2),0))) exitWith {
	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log "║     <<<< SKY-NET - DB Config ERROR  !!! >>>> ";
	diag_log "║     << DB konfiguration überprüfen   !!!! >> ";
	diag_log "║     << Was soll initialisiert werden  ??? >> ";
	diag_log "║     << SKY-NET wird weiter ausgeführt !!! >> ";
	diag_log "╠══════════════════════════════════════════════════╣";
	true;
};
*/
private["_ex","_fn_DB_Init"];

HC_extDB_notLoaded = [["DB1 off",false],["DB2 off",false],["DB3 off",false]];
_ex = false;
_fn_DB_Init = {
		
		_db = _this select 0;
		if(isNil {G_SQL_ID(_db)}) then {
			SET_SQL_ID(_db);
			
		//Retrieve extDB version
		_result = EXTDB(_db,"9:VERSION");
		diag_log format ["║ DB %2        extDB Version : %1",_result,(_db + 1)];
		if(EQUAL(_result,"")) exitWith {_msg = format["DB %1: Komunikation mit extDB fehlgeschlagen !!",(_db + 1)]; EXTDB_FAILED(_db,_msg)};
		if ((parseNumber _result) < 52) exitWith {_msg = format["DB %1: Fehler !! falsche extDB Version !!!",(_db + 1)]; EXTDB_FAILED(_db,_msg)};
		//Lets start logging in extDB
		EXTDB(_db,"9:ADD_PROTOCOL:LOG:SPY_LOG:spyglass");
		//Initialize connection to Database
		_query = format["9:ADD_DATABASE:%1",DATABASE_SELECTION(_db)];
		_result = EXTDB(_db,_query);
		if(!(EQUAL(_result,"[1]"))) exitWith {_msg = format["DB %1: Error with Database Connection",(_db + 1)]; EXTDB_FAILED(_db,_msg)};
		//_result = EXTDB(_db,format["9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM_V2:%2:skyraw",DATABASE_SELECTION(_db),FETCH_CONST(life_sql_id)]);
		ADD_DB(_db);
		if(!(EQUAL(_result,"[1]"))) exitWith {_msg = format["DB %1: Error with Database Connection",(_db + 1)]; EXTDB_FAILED(_db,_msg)};
		
		//Initialize Logging options from extDB
		
		if((EQUAL(EXTDB_SETTINGS("LOG",_db),1))) then {
			{
				_query = format["9:ADD_PROTOCOL:LOG:%1:%2",SEL(_x,0),SEL(_x,1)];
				EXTDB(_db,_query);
				diag_log format ["║ - extDB: %1 wurde erfolgreich hinzugefügt",SEL(_x,0)];
			} forEach EXTDB_LOGAR;
		};
		if(_db isEqualTo 0) then {
			//Initialize RCON options from extDB
			if((EQUAL(EXTDB_SETTINGS("RCON",_db),1))) then {
				RCON_ID = round(random(9999));
				CONSTVAR(RCON_ID);
				SVAR_UINS ["RCON_ID",RCON_ID];
				_query = format["9:START_RCON:%1",RCON_SELECTION];
				EXTDB(_db,_query);
				_query = format["9:ADD:RCON:%1",FETCH_CONST(RCON_ID)];
				EXTDB(_db,_query);
				diag_log "║ - extDB: RCON is enabled";
			};
			//Initialize VAC options from extDB
			if((EQUAL(EXTDB_SETTINGS("VAC",_db),1))) then {
				VAC_ID = round(random(9999));
				CONSTVAR(VAC_ID);
				SVAR_UINS ["VAC_ID",VAC_ID];
				
				EXTDB(_db,"9:START_VAC");
				_query = format["9:ADD_PROTOCOL:STEAM:%1",FETCH_CONST(VAC_ID)];
				EXTDB(_db,_query);
				diag_log "║ - extDB: VAC is enabled";
			};
			//Initialize MISC options from extDB
			if((EQUAL(EXTDB_SETTINGS("MISC",_db),1))) then {
				MISC_ID = round(random(9999));
				CONSTVAR(MISC_ID);
				SVAR_UINS ["MISC_ID",MISC_ID];
				_query = format["9:ADD_PROTOCOL:MISC:%1",FETCH_CONST(MISC_ID)];
				EXTDB(_db,_query);
				diag_log "║ - extDB: MISC ist aktiviert ";

			};
		};
		EXTDB(_db,"9:LOCK");
		_msg = format["DB%1 on",(_db + 1)];
		(HC_extDB_notLoaded select _db) set [0,_msg];
		if((HC_extDB_notLoaded select _db) select 1) then {diag_log format["║ DB %1 erfolgreich initialisiert..",(_db + 1)];} else {
			diag_log format["║ DB %1 !!! Initialisierung fehlgeschlagen !!!",(_db + 1)];
			_ex = true;
		};
		//["diag_log",["extDB: Connected to the Database"]] call TON_fnc_logIt;
	} else {
		HOLD_SQL_ID(_db);
		diag_log format["║ DB %1 wurde bereits initialisiert !!!",(_db + 1)];
	};
};

// Init Prozess 
if((EQUAL(EXTDB_SETTINGS("DB",0),1))) then { [0]call _fn_DB_Init;};
if((EQUAL(EXTDB_SETTINGS("DB",1),1))) then { [1]call _fn_DB_Init;};
if((EQUAL(EXTDB_SETTINGS("DB",2),1))) then { [2]call _fn_DB_Init;};
//RPT("HC_extDB_notLoaded",HC_extDB_notLoaded);
//_log = [HC_extDB_notLoaded] call SKY_fnc_mresArray;

SYSLOG(SKYID,"DB STATUS",((HC_extDB_notLoaded select 0) select 0),((HC_extDB_notLoaded select 1) select 0),((HC_extDB_notLoaded select 2) select 0));

if(_ex)exitWith{
	diag_log "╟──────────────────────────────────────────────────╢";
	diag_log "║ << Datenbanken Initialisierung fehlgeschlagen >> ";
	diag_log "╟──────────────────────────────────────────────────╢";
};

//["deleteBrett"  ,1,true,0]call SKY_fnc_dbCall;
["OldBrett"		,1,true,0]call SKY_fnc_dbCall;
//["OldBrett1"	,1,true,0]call SKY_fnc_dbCall;
["OldBrett2"	,1,true,0]call SKY_fnc_dbCall;

	diag_log "╟──────────────────────────────────────────────────╢";
	diag_log "║   << Datenbanken erfolgreich initialisiert >>";
	diag_log "╟──────────────────────────────────────────────────╢";
true;