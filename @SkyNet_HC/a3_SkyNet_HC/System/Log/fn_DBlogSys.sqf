#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"

#define DB_LOG_CHECK(MD) if (MD < 0 || MD > 9) exitWith {\
diag_log "╔══════════════════════════════════════════════════╗";\
diag_log "║ !!! DBlogSys WARNUNG !!! Kein Mode ausgewählt !!!";\
diag_log "╚══════════════════════════════════════════════════╝"; }

//#define PAR(VAR,SELE,STD,TYP) VAR = [_this,SELE,STD,[TYP]] call BIS_fnc_param
//#define THIS(VAR,SELE) VAR = _this select SELE

//#define CALLDBLOG(MD,CODE) if(_mode isEqualTo MD) exitWith {CODE}  
//#define DBCA(DB) [_query,1,false,DB]call SKY_fnc_dbCall
//#define DBCALL(DBA) if((EQUAL(EXTDB_SETTINGS("DB",DBA),1))) then {DBCA(DBA)}

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
║ File: fn_DBlogSys.sqf
║ Author: Hirschi - Die Liga
╠══════════════════════════════════════════════════╝
║	Mode
║	
║	0 = SysLog      					DB1 DB2      #define SYSLOG(VAL1,VAL2,VAL3,VAL4,VAL5) if((EQUAL(SYSLOGs,1)) && (((HC_extDB_notLoaded select 0) select 1)) && (((HC_extDB_notLoaded select 1) select 1))) then { [0,VAL1,VAL2,VAL3,VAL4,VAL5] spawn SKY_fnc_DBlogSys }
║	1 = Player LogLink     	        	DB1
║	2 = life_fnc_MP    	    			DB1	 #define LIFEmpLOG(VAL1) [2,VAL1] spawn SKY_fnc_DBlogSys
║	3 = BIS_fnc_MP       				DB1	 #define BISmpLOG(VAL1) [3,VAL1] spawn SKY_fnc_DBlogSys
║	4 = Server Diagnose 	Log      	DB1	 #define BISmpLOG(VAL1) [3,VAL1] spawn SKY_fnc_DBlogSys
║	5 = Admin Log       				DB1	 #define BISmpLOG(VAL1) [3,VAL1] spawn SKY_fnc_DBlogSys
║	6 = Gewinn Lg       				DB1	 #define BISmpLOG(VAL1) [6,VAL1] spawn SKY_fnc_DBlogSys
║	7 = Display Log       				DB1	 #define BISmpLOG(VAL1) [6,VAL1] spawn SKY_fnc_DBlogSys
║	8 = AH		 Log       				DB1	 if(SKY_HC_aktiv_1) then {[8,[MOD,VAR]] remoteExec ["SKY_fnc_DBlogSys",HC_id];}
╚══════════════════════════════════════════════════╝
*/


PAR(_mode,0,-1,0);


DB_LOG_CHECK(_mode);


if(_mode isEqualTo 1) exitWith {
	PAR(_v1,1,[],[[]]);	
	_logmode = SEL(_v1,0);
	_uber = SEL(_v1,1);
	// 0 = Geldlog
	// 1 = Supp LOG
	if(_logmode isEqualTo 0) exitWith { [_uber] spawn SKY_fnc_handleDBLog;};
	if(_logmode isEqualTo 1) exitWith {									 	// Support Log .. 
	
	/*[	profileName, 													Name Supp 1
		player getPlayerUID,											UID  Supp 1
		_vehicle,															Fahrzeug
		_vid , 															Fahrzeug ID
		getPlayerUID ad_targ_uni, 									UID  Fall
		ad_targ_uni getVariable["realname",name ad_targ_uni], 	Name Fall
		ad_targ_uni getVariable["Sname",name ad_targ_uni]],		Steamname Fall
		"Fahrzeug"														Flag
	*/

	_v1 = SEL(_uber,0);
	_v2 = SEL(_uber,1);
	_v3 = SEL(_uber,2);
	_v4 = SEL(_uber,3);
	_v5 = SEL(_uber,4);
	_v6 = SEL(_uber,5);
	_v7 = SEL(_uber,6);
	_v8 = SEL(_uber,7);
	_v9 = SEL(_uber,8);
	_query = format["Supplog:%1:%2:%3:%4:%5:%6:%7:%8",_v1,_v2,[_v3,_v4],_v5,_v6,_v7,_v8,_v9];
	DBCALL(0);	
	
	}; 
	
};

//
if(_mode isEqualTo 0) exitWith {    
PAR(_v1,1,"","");
PAR(_v2,2,"","");
THIS(_v3,3);
THIS(_v4,4);
THIS(_v5,5);

_query = format["Syslog:%1:%2:%3:%4:%5",_v1,_v2,_v3,_v4,_v5];
DBCALL(0);
DBCALL(1);
};


if(_mode isEqualTo 2) exitWith {
	THIS(_v1,1);
	_query = format["lifeMPlog:%1:%2:%3:%4",SEL(_v1,2),SEL(_v1,1),SEL(_v1,3),_v1];
	DBCALL(0);
};

if(_mode isEqualTo 3) exitWith {
	THIS(_v1,1);
	_query = format["BISMPlog:%1:%2:%3:%4",_v1,_v1,_v1,_v1];
	DBCALL(0);
};

if(_mode isEqualTo 4) exitWith {
	_m = SEL(SKY_srvdiag_link,0);
	if(_m isEqualTo 0) exitWith {
		_query = format["SrvDiag:%1:%2:%3:%4:%5","a_SQF - FPS - minFPS - Spieler",SEL(SKY_srvdiag_link,1),SEL(SKY_srvdiag_link,2),SEL(SKY_srvdiag_link,3),SEL(SKY_srvdiag_link,4)];
		DBCALL(0);
	};
	if(_m isEqualTo 1) exitWith {

		_query = format["ConnectionLog:%1:%2:%3:%4",SEL(SKY_srvdiag_link,1),SEL(SKY_srvdiag_link,2),SEL(SKY_srvdiag_link,3),SEL(SKY_srvdiag_link,4)];
		DBCALL(1);
		[SKY_srvdiag_link]spawn SKY_fnc_AdminLogin;
		
	};	
};

if(_mode isEqualTo 5) exitWith {

	THIS(_v1,1);
	THIS(_v2,2);
	THIS(_v3,3);
	THIS(_v4,4);
	THIS(_v5,5);
	_query = format["Adminlog:%1:%2:%3:%4:%5",_v1,_v2,_v3,_v4,_v5];
	DBCALL(0);
};

if(_mode isEqualTo 6) exitWith {
    
	THIS(_v1,1);
	THIS(_v2,2);
	THIS(_v3,3);
	THIS(_v4,4);
	THIS(_v5,5);
	_query = format["Gewinnlog:%1:%2:%3:%4:%5",_v1,_v2,_v3,_v4,_v5];
	DBCALL(1);
};

if(_mode isEqualTo 7) exitWith {
    
	
	_v1 = SEL(_this,1);
	_v2 = SEL(_this,2);
	_v3 = SEL(_this,3);
	_v4 = SEL(_this,4);
	_v5 = SEL(_this,5);

	_query = format["Displaylog:%1:%2:%3:%4:%5",_v1,_v2,_v3,_v4,_v5];
	DBCALL(0);
};

if(_mode isEqualTo 8) exitWith {
    
	
	_v1 = SEL(_this,1);
	_v2 = SEL(_this,2);
	_v3 = SEL(_this,3);
	_v4 = SEL(_this,4);
	_v5 = "";
	if(([":",_v4] call BIS_fnc_inString) || (["#",_v4] call BIS_fnc_inString)) then {_v4 = "";};


	_query = format["AHlog:%1:%2:%3:%4:%5",_v1,_v2,_v3,_v4,_v5];
	DBCALL(0);
	{
		[_v1,_v2,_v3,_v4] remoteExec ["SPY_fnc_notifyAdmins",_x];

	}forEach (activ_adm_ara1 + activ_adm_ara2 + activ_adm_ara3 + activ_adm_ara4 + activ_adm_ara5);
};

if(_mode isEqualTo 9) exitWith {
    
	
	_v1 = SEL(_this,1);	//pName
	_v2 = SEL(_this,2); //pUID
	_v3 = SEL(_this,3);	//pReasn
	_v4 = SEL(_this,4); //pMSG
	_v5 = "autoBan";
	if(([":",_v4] call BIS_fnc_inString) || (["#",_v4] call BIS_fnc_inString)) then {_v4 = "";};
	_query = format["AHlog:%1:%2:%3:%4:%5",_v1,_v2,_v3,_v4,_v5];
	DBCALL(0);

	_query = format["BANlog:%1:%2:%3:%4:%5",_v1,_v2,_v3,_v4,_v5];
	DBCALL(1);
	{
		[_v1,_v2,_v3,"!!! AUTO BAN !!!"] remoteExec ["SPY_fnc_notifyAdmins",_x];

	}forEach (activ_adm_ara1 + activ_adm_ara2 + activ_adm_ara3 + activ_adm_ara4 + activ_adm_ara5);
};