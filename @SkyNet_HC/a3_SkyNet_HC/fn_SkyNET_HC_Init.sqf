#include "SkyNet_Macros.hpp"
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
║ File: fn_SkyNET_HC_Init.sqf
║ Author: Hirschi Liga-Life
╚══════════════════════════════════════════════════╝
*/
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};

diag_log str profileName;
//if!(EQUAL(profileName,"sky_2")) exitWith {["Notwhitelisted",false,true] call BIS_fnc_endMission;};

SKY_stanby = true;
liga_tag = [];
activ_adm_ara1 = [];
activ_adm_ara2 = [];
activ_adm_ara3 = [];
activ_adm_ara4 = [];
activ_adm_ara5 = [];

uiSleep 4;
diag_log "╔══════════════════════════════════════════════════╗";
diag_log "║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║";
diag_log "║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║";
diag_log "║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║";
diag_log "║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║";
diag_log "║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║";
diag_log "║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║";
diag_log "║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║";
diag_log "║░░▀▀▀▀░░░█░░░█░░▀░░░░░▀░░░░░██░░░█░░░░░░░░▀▀▀█▀▀▀░║";
diag_log "║░█░░░░░░░█░░█░░░░▀░░░▀░░░░░░█░█░░█░░█▀▀▀░░░░░█░░░░║";
diag_log "║░░▀▀▀░░░░█▀▀░░░░░░▀░▀░░░▀▀░░█░░█░█░░█▀▀▀░░░░░█░░░░║";
diag_log "║░░░░░█░░░█░░█░░░░░░█░░░░░░░░█░░░██░░▀▀▀▀░░░░░█░░░░║";
diag_log "║░▀▀▀▀░░░░▀░░░▀░░░░░▀░░░░░░░░▀░░░░▀░░░░░░░░░░░░░░░░║";
diag_log "║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║";
diag_log "╠══════════════════════════════════════════════════╣";
diag_log format["║ Version 			    : %1",VER];
diag_log format["║ SkyNet ON               : %1",SKYon];
if(EQUAL(SKYon,0)) exitWith {	
	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log "║    <<<< SKY-NET - !!! DEAKTIVIERT !!! >>>> ";
	diag_log "╚══════════════════════════════════════════════════╝";
	};
diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║   <<<< Config >>>>";
diag_log "╠══════════════════════════════════════════════════╣";	
diag_log "║     << System >>";
diag_log "╟──────────────────────────────────────────────────╢";	
//diag_log format["║ HC ON                   : %1",HCon];
diag_log format["║ DEV RPT Log             : %1",DEVLOGRPT];
diag_log format["║ DEV DB Log              : %1",DEVLOGDB];
diag_log format["║ DB SysLog               : %1",SYSLOGs];
diag_log format["║ Debug Staus             : %1",DEB];
diag_log "╟──────────────────────────────────────────────────╢";
diag_log "║   << DB - Links >>";
diag_log "╟──────────────────────────────────────────────────╢";
diag_log format["║ DB Links                : %1",DBon];
diag_log format["║ DB 1 - skylog           : %1",EXTDB_SETTINGS("DB",0)];
diag_log format["║ DB 2 - support          : %1",EXTDB_SETTINGS("DB",1)];
diag_log format["║ DB 3                    : %1",EXTDB_SETTINGS("DB",2)];
diag_log "╟──────────────────────────────────────────────────╢";
diag_log "║   << Netzwerk >>";
diag_log "╟──────────────────────────────────────────────────╢";
//diag_log format["║ life_fnc_MP Link        : %1",LIFEMPEH];
//diag_log format["║ BIS_fnc_MP Link         : %1",BISMPEH];
//diag_log format["║ HC Link                 : %1",HCLINKEH];
//diag_log format["║ EH Log Aray Größe (MSG) : %1",LOGARSIZE];
diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ <<<< SKY-NET - Init >>>> ";
//diag_log "║ - Erstelle Steuer Array";
//SKY_c_link = [-1]; //[SQL ID LifeDB]
if(EQUAL(DBon,1)) then {
	diag_log "╟──────────────────────────────────────────────────╢";
	diag_log "║   << Initialisiere Datenbanken >>";
	diag_log "╟──────────────────────────────────────────────────╢";
	if!([]call SKY_fnc_DBinit) exitWith {
		diag_log "╠══════════════════════════════════════════════════╣";
		diag_log "║ <<<< SKY-NET - DB Init ERROR... Stop !!! >>>> ";
		diag_log "╚══════════════════════════════════════════════════╝";
		["",false,false] call BIS_fnc_endMission;
	};
};	
[]call SKY_fnc_NETinit;
SYSLOG(SKYID,"HC STATUS","NET INIT","INIT COMPLETE","");
/*
if([]call SKY_fnc_NETinit) exitWith {
		diag_log "╠══════════════════════════════════════════════════╣";
		diag_log "║ <<<< SKY-NET - HC Link Init ... Stop !!! >>>> ";
		diag_log "╚══════════════════════════════════════════════════╝";
	
	["",false,false] call BIS_fnc_endMission;
};
/*
/*
	if!([]call SKY_fnc_EVH) then {	
		diag_log "╠══════════════════════════════════════════════════╣";
		diag_log "║     <<<< SKY-NET - Eventhandler Error >>>> ";
		diag_log "║ << Server Link konnte nicht erstellt werden >> ";
		diag_log "║    << SKY-NET  wird weiterhin ausgeführt >> ";
		diag_log "╠══════════════════════════════════════════════════╣"
	};
*/	
[]spawn SKYINIT_fnc_sessID;
[]execVM "\a3_SkyNet_HC\System\Admin\fn_Code.sqf";
SYSLOG(SKYID,"HC STATUS","Admin Code","compiling COMPLETE","");


diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ <<<< SKY-NET - Init ENDE >>>> ";
diag_log "╚══════════════════════════════════════════════════╝";
	
//["hunting_zone",80]execVM "\a3_SkyNet_HC\Scripte\Jagen\fn_huntingZone.sqf";
if((SCRIP_SETS("Jagen")) 		isEqualTo 1) then {[]execVM "\a3_SkyNet_HC\Scripte\Jagen\fn_huntingZone.sqf";		SYSLOG(SKYID,"HC STATUS","Jagen","INIT COMPLETE","");		};
if((SCRIP_SETS("JagenHasen")) 	isEqualTo 1) then {[]execVM "\a3_SkyNet_HC\Scripte\Jagen\fn_huntingZoneHasen.sqf";	SYSLOG(SKYID,"HC STATUS","JagenHasen","INIT COMPLETE","");	};
if((SCRIP_SETS("Airdrop")) 		isEqualTo 1) then {[]call LIGA_fnc_AirdropConfig;									SYSLOG(SKYID,"HC STATUS","AirdropConf","INIT COMPLETE","");	};
if((SCRIP_SETS("Airdrop")) 		isEqualTo 1) then {[]spawn LIGA_fnc_generateAirdropAuto;							SYSLOG(SKYID,"HC STATUS","Airdrop","INIT COMPLETE","");		};
if((SCRIP_SETS("Schiffswrack")) isEqualTo 1) then {[]spawn LIGA_fnc_schiffwrackauto;								SYSLOG(SKYID,"HC STATUS","Schiffswrack","INIT COMPLETE","");};
if((SCRIP_SETS("Zombies")) 		isEqualTo 1) then {[]execVM "\a3_SkyNet_HC\Scripte\Zombies\fn_zomInit.sqf";			SYSLOG(SKYID,"HC STATUS","Zombies","INIT COMPLETE","");		};
if((SCRIP_SETS("Bohrturm")) 	isEqualTo 1) then {[]spawn LIGA_fnc_turmInit;										SYSLOG(SKYID,"HC STATUS","Bohrturm","INIT COMPLETE","");	};


SAH_offers = ["eBayRead",2,true,0]call SKY_fnc_dbCall;
//SAH_offers = profileNamespace GVAR ["LIGA_BAY",[]];
SAH_offers = (SAH_offers select 0) select 0;
diag_log str SAH_offers;



//[]execVM "\a3_SkyNet_HC\Scripte\Airdrop\fn_generateAirdrop.sqf";
//[]execVM "\a3_SkyNet_HC\Scripte\Missionen\AdminBase.sqf";

SYSLOG(SKYID,"HC STATUS","INIT COMPLETE","HC READY","");
SYSLOG(SKYID,"HC ID",HC_id,"","");
[] call Liga_fnc_player_init; // Performance
[]spawn SKY_fnc_MainLoop;
if(EQUAL(DEB,1)) then {	
	[]spawn {
		sleep 80;
		while {true} do {
			uiSleep 180;
			
			SYSLOG(SKYID,"DIAGNOSE DEBUG","1 ACTTIV SQF  2 FPS",COUNT_SQF,diag_fps);

		//	RPT("SKY_HC_Link",SKY_HC_Link);
		//	SYSLOG(SKYID,"HC DBUG",SKY_HC_Link,"","");
		//	if((HC_isA select 0)) then {SKY_HC_Link = "COM TEST";(owner HC1) publicVariableClient "SKY_HC_Link";};
			{   if(local _x && EQUAL(count units _x,0) && !(EQUAL(_x,infected)))  then {deleteGroup _x;	};} foreach allGroups;	
		};
	};		
};

TON_fnc_index =
compileFinal "
	private[""_item"",""_stack""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;
	{
		if(_item in _x) exitWith {
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
";	

/*
[]spawn {
	sleep 60;
	private["_string","_varname","_typename","_biscode","_lifecode","_socketcode","_kronecode","_dbcode","_fnccode","_infi",
			"_toncode","_ligaclcode","_fncode","_ilcode","_ligafncode","_ligacode","_skycode","_othercode","_disp","_other"];
	_string 	= "";
	_biscode 	= [];
	_lifecode 	= [];
	_socketcode = [];
	_toncode 	= [];
	_ligaclcode	= [];
	_ligacode 	= [];
	_ligafncode = [];
	_skycode 	= [];
	_kronecode 	= [];
	_fncode 	= [];
	_ilcode 	= [];
	_othercode 	= [];
	_other		= [];
	_dbcode 	= [];
	_fnccode	= [];
	_infi		= [];
	{
					if( !(["bis_fnc_",		_x] call BIS_fnc_inString) &&
					!(["sock_fnc_",		_x] call BIS_fnc_inString) &&
					!(["life_fnc_",		_x] call BIS_fnc_inString) &&
					!(["ton_fnc_",		_x] call BIS_fnc_inString) &&
					!(["ligacl_fnc_",	_x] call BIS_fnc_inString) &&
					!(["liga_fn",		_x] call BIS_fnc_inString) &&
					!(["ligafn_",		_x] call BIS_fnc_inString) &&
					!(["fn_",			_x] call BIS_fnc_inString) &&
					!(["il_",			_x] call BIS_fnc_inString) &&
					!(["kron_",			_x] call BIS_fnc_inString) &&
					!(["db_",			_x] call BIS_fnc_inString) &&
					!(["fnc_",			_x] call BIS_fnc_inString) &&
					!(["sky_fnc_",		_x] call BIS_fnc_inString)
				) then {						
					_other pushBack _x;
				};
		switch (typeName (missionNamespace getVariable _x)) do {
		
			case "ARRAY": 		{};
			case "BOOL": 		{};
			case "CODE": 		{
				if( !(["bis_fnc_",		_x] call BIS_fnc_inString) &&
					!(["sock_fnc_",		_x] call BIS_fnc_inString) &&
					!(["life_fnc_",		_x] call BIS_fnc_inString) &&
					!(["ton_fnc_",		_x] call BIS_fnc_inString) &&
					!(["ligacl_fnc_",	_x] call BIS_fnc_inString) &&
					!(["liga_fn",		_x] call BIS_fnc_inString) &&
					!(["ligafn_",		_x] call BIS_fnc_inString) &&
					!(["fn_",			_x] call BIS_fnc_inString) &&
					!(["il_",			_x] call BIS_fnc_inString) &&
					!(["kron_",			_x] call BIS_fnc_inString) &&
					!(["db_",			_x] call BIS_fnc_inString) &&
					!(["fnc_",			_x] call BIS_fnc_inString) &&
					!(["sky_fnc_",		_x] call BIS_fnc_inString)
				) then {	
					if( !(["_",		_x] call BIS_fnc_inString)) then {
						_othercode pushBack _x;
					}else{
						_infi pushBack _x;
					};	
				}else{
					if((["bis_fnc_",	_x] call BIS_fnc_inString)) exitWith {_biscode 		pushBack _x;};	
					if((["sock_fnc_",	_x] call BIS_fnc_inString)) exitWith {_socketcode 	pushBack _x;};	
					if((["life_fnc_",	_x] call BIS_fnc_inString)) exitWith {_lifecode 	pushBack _x;};	
					if((["ton_fnc_",	_x] call BIS_fnc_inString)) exitWith {_toncode		pushBack _x;};	
					if((["ligacl_fnc_",	_x] call BIS_fnc_inString)) exitWith {_ligaclcode	pushBack _x;};	
					if((["liga_fn",		_x] call BIS_fnc_inString)) exitWith {_ligacode		pushBack _x;};	
					if((["sky_fnc_",	_x] call BIS_fnc_inString)) exitWith {_skycode		pushBack _x;};	
					if((["ligafn_",		_x] call BIS_fnc_inString)) exitWith {_ligafncode	pushBack _x;};	
					if((["fn_",			_x] call BIS_fnc_inString)) exitWith {_fncode		pushBack _x;};	
					if((["il_",			_x] call BIS_fnc_inString)) exitWith {_ilcode		pushBack _x;};	
					if((["kron_",		_x] call BIS_fnc_inString)) exitWith {_kronecode	pushBack _x;};	
					if((["db_",			_x] call BIS_fnc_inString)) exitWith {_dbcode		pushBack _x;};	
					if((["fnc_",		_x] call BIS_fnc_inString)) exitWith {_fnccode		pushBack _x;};	
				};
			};
			case "CONFIG": 		{};
			case "CONTROL": 	{};
			case "DISPLAY": 	{};
			case "GROUP": 		{};
			case "LOCATION": 	{};
			case "OBJECT": 		{};
			case "SCALAR": 		{};
			case "SCRIPT": 		{};
			case "SIDE": 		{};
			case "STRING": 		{};
			case "TEXT": 		{};
			case "TEAM_MEMBER": {};
			case "NAMESPACE": 	{};				
		};
	
		
	} foreach allVariables missionNamespace;
	
	diag_log "";	
	diag_log "";	
	diag_log "BIS";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _biscode;

	diag_log "";	
	diag_log "";	
	diag_log "SOCKET";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _socketcode;
	
	diag_log "";	
	diag_log "";	
	diag_log "DB";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _dbcode;	

	diag_log "";	
	diag_log "";	
	diag_log "LIFE";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _lifecode;

	diag_log "";	
	diag_log "";	
	diag_log "TON";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _toncode;

	diag_log "";	
	diag_log "";	
	diag_log "LIGACL";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _ligaclcode;

	diag_log "";	
	diag_log "";	
	diag_log "FN";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _fncode;
	
	diag_log "";	
	diag_log "";	
	diag_log "FNC";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _fnccode;	

	diag_log "";	
	diag_log "";	
	diag_log "LIGAfn";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _ligafncode;

	diag_log "";	
	diag_log "";	
	diag_log "LIGA";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _ligacode;

	diag_log "";	
	diag_log "";	
	diag_log "IL";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _ilcode;

	diag_log "";	
	diag_log "";	
	diag_log "KRNE";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _kronecode;

	diag_log "";	
	diag_log "";	
	diag_log "SKY";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _skycode;
	

	diag_log "";	
	diag_log "";	
	diag_log "Other";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _othercode;	


	diag_log "";	
	diag_log "";	
	diag_log "InfI";	
	{	
		if!(typeName (missionNamespace getVariable _x) == "CODE") then {
			_string = format ["{%1,%2},",str _x,str (typeName (missionNamespace getVariable _x))];
			diag_log _string;
		};	
	}foreach _infi;	
	
	diag_log "";	
	diag_log "";	
	diag_log "VARs";	
	{	
		if!(typeName (missionNamespace getVariable _x) == "CODE") then {
			_string = format ["{%1,%2},",str _x,str (typeName (missionNamespace getVariable _x))];
			diag_log _string;
		};	
	}foreach _other;		
	
	
	_string 	= "";
	_biscode 	= [];
	_lifecode 	= [];
	_socketcode = [];
	_toncode 	= [];
	_ligaclcode	= [];
	_ligacode 	= [];
	_ligafncode = [];
	_skycode 	= [];
	_kronecode 	= [];
	_fncode 	= [];
	_ilcode 	= [];
	_othercode 	= [];
	_dbcode 	= [];
	_fnccode	= [];
	_disp		= [];
	{
		switch (typeName (uiNamespace getVariable _x)) do {
		
			case "ARRAY": 		{};
			case "BOOL": 		{};
			case "CODE": 		{
				if( !(["bis_fnc_",		_x] call BIS_fnc_inString) &&
					!(["sock_fnc_",		_x] call BIS_fnc_inString) &&
					!(["life_fnc_",		_x] call BIS_fnc_inString) &&
					!(["ton_fnc_",		_x] call BIS_fnc_inString) &&
					!(["ligacl_fnc_",	_x] call BIS_fnc_inString) &&
					!(["liga_fn",		_x] call BIS_fnc_inString) &&
					!(["ligafn_",		_x] call BIS_fnc_inString) &&
					!(["fn_",			_x] call BIS_fnc_inString) &&
					!(["il_",			_x] call BIS_fnc_inString) &&
					!(["kron_",			_x] call BIS_fnc_inString) &&
					!(["db_",			_x] call BIS_fnc_inString) &&
					!(["fnc_",			_x] call BIS_fnc_inString) &&
					!(["sky_fnc_",		_x] call BIS_fnc_inString)
				) then {						
					_othercode pushBack _x;
				}else{
					if((["bis_fnc_",	_x] call BIS_fnc_inString)) exitWith {_biscode 		pushBack _x;};	
					if((["sock_fnc_",	_x] call BIS_fnc_inString)) exitWith {_socketcode 	pushBack _x;};	
					if((["life_fnc_",	_x] call BIS_fnc_inString)) exitWith {_lifecode 	pushBack _x;};	
					if((["ton_fnc_",	_x] call BIS_fnc_inString)) exitWith {_toncode		pushBack _x;};	
					if((["ligacl_fnc_",	_x] call BIS_fnc_inString)) exitWith {_ligaclcode	pushBack _x;};	
					if((["liga_fn",		_x] call BIS_fnc_inString)) exitWith {_ligacode		pushBack _x;};	
					if((["sky_fnc_",	_x] call BIS_fnc_inString)) exitWith {_skycode		pushBack _x;};	
					if((["ligafn_",		_x] call BIS_fnc_inString)) exitWith {_ligafncode	pushBack _x;};	
					if((["fn_",			_x] call BIS_fnc_inString)) exitWith {_fncode		pushBack _x;};	
					if((["il_",			_x] call BIS_fnc_inString)) exitWith {_ilcode		pushBack _x;};	
					if((["kron_",		_x] call BIS_fnc_inString)) exitWith {_kronecode	pushBack _x;};	
					if((["db_",			_x] call BIS_fnc_inString)) exitWith {_dbcode		pushBack _x;};	
					if((["fnc_",		_x] call BIS_fnc_inString)) exitWith {_fnccode		pushBack _x;};	
				};
			};
			case "CONFIG": 		{};
			case "CONTROL": 	{};
			case "DISPLAY": 	{_disp	pushBack _x;};
			case "GROUP": 		{};
			case "LOCATION": 	{};
			case "OBJECT": 		{};
			case "SCALAR": 		{};
			case "SCRIPT": 		{};
			case "SIDE": 		{};
			case "STRING": 		{};
			case "TEXT": 		{};
			case "TEAM_MEMBER": {};
			case "NAMESPACE": 	{};				
		};
		_string = format ["{%1,%2},",str _x,str (typeName (uiNamespace getVariable _x))];
		diag_log _string;	
		
	} foreach allVariables uiNamespace;
	
	diag_log "UI NAMESPACHE";	
	diag_log "";	
	diag_log "";	
	diag_log "";	
	diag_log "";	
	diag_log "BIS";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _biscode;

	diag_log "";	
	diag_log "";	
	diag_log "SOCKET";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _socketcode;
	
	diag_log "";	
	diag_log "";	
	diag_log "DB";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _dbcode;	

	diag_log "";	
	diag_log "";	
	diag_log "LIFE";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _lifecode;

	diag_log "";	
	diag_log "";	
	diag_log "TON";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _toncode;

	diag_log "";	
	diag_log "";	
	diag_log "LIGACL";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _ligaclcode;

	diag_log "";	
	diag_log "";	
	diag_log "FN";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _fncode;
	
	diag_log "";	
	diag_log "";	
	diag_log "FNC";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _fnccode;	

	diag_log "";	
	diag_log "";	
	diag_log "LIGAfn";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _ligafncode;

	diag_log "";	
	diag_log "";	
	diag_log "LIGA";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _ligacode;

	diag_log "";	
	diag_log "";	
	diag_log "IL";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _ilcode;

	diag_log "";	
	diag_log "";	
	diag_log "KRNE";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _kronecode;

	diag_log "";	
	diag_log "";	
	diag_log "SKY";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _skycode;
	
	diag_log "";	
	diag_log "";	
	diag_log "DISPLAY";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _disp;	

	diag_log "";	
	diag_log "";	
	diag_log "Other";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _othercode;	
	
		
	_string 	= "";
	_biscode 	= [];
	_lifecode 	= [];
	_socketcode = [];
	_toncode 	= [];
	_ligaclcode	= [];
	_ligacode 	= [];
	_ligafncode = [];
	_skycode 	= [];
	_kronecode 	= [];
	_fncode 	= [];
	_ilcode 	= [];
	_othercode 	= [];
	_dbcode 	= [];
	_fnccode	= [];
	_disp		= [];
	{
		switch (typeName (profileNamespace getVariable _x)) do {
		
			case "ARRAY": 		{};
			case "BOOL": 		{};
			case "CODE": 		{
				if( !(["bis_fnc_",		_x] call BIS_fnc_inString) &&
					!(["sock_fnc_",		_x] call BIS_fnc_inString) &&
					!(["life_fnc_",		_x] call BIS_fnc_inString) &&
					!(["ton_fnc_",		_x] call BIS_fnc_inString) &&
					!(["ligacl_fnc_",	_x] call BIS_fnc_inString) &&
					!(["liga_fn",		_x] call BIS_fnc_inString) &&
					!(["ligafn_",		_x] call BIS_fnc_inString) &&
					!(["fn_",			_x] call BIS_fnc_inString) &&
					!(["il_",			_x] call BIS_fnc_inString) &&
					!(["kron_",			_x] call BIS_fnc_inString) &&
					!(["db_",			_x] call BIS_fnc_inString) &&
					!(["fnc_",			_x] call BIS_fnc_inString) &&
					!(["sky_fnc_",		_x] call BIS_fnc_inString)
				) then {						
					_othercode pushBack _x;
				}else{
					if((["bis_fnc_",	_x] call BIS_fnc_inString)) exitWith {_biscode 		pushBack _x;};	
					if((["sock_fnc_",	_x] call BIS_fnc_inString)) exitWith {_socketcode 	pushBack _x;};	
					if((["life_fnc_",	_x] call BIS_fnc_inString)) exitWith {_lifecode 	pushBack _x;};	
					if((["ton_fnc_",	_x] call BIS_fnc_inString)) exitWith {_toncode		pushBack _x;};	
					if((["ligacl_fnc_",	_x] call BIS_fnc_inString)) exitWith {_ligaclcode	pushBack _x;};	
					if((["liga_fn",		_x] call BIS_fnc_inString)) exitWith {_ligacode		pushBack _x;};	
					if((["sky_fnc_",	_x] call BIS_fnc_inString)) exitWith {_skycode		pushBack _x;};	
					if((["ligafn_",		_x] call BIS_fnc_inString)) exitWith {_ligafncode	pushBack _x;};	
					if((["fn_",			_x] call BIS_fnc_inString)) exitWith {_fncode		pushBack _x;};	
					if((["il_",			_x] call BIS_fnc_inString)) exitWith {_ilcode		pushBack _x;};	
					if((["kron_",		_x] call BIS_fnc_inString)) exitWith {_kronecode	pushBack _x;};	
					if((["db_",			_x] call BIS_fnc_inString)) exitWith {_dbcode		pushBack _x;};	
					if((["fnc_",		_x] call BIS_fnc_inString)) exitWith {_fnccode		pushBack _x;};	
				};
			};
			case "CONFIG": 		{};
			case "CONTROL": 	{};
			case "DISPLAY": 	{_disp	pushBack _x;};
			case "GROUP": 		{};
			case "LOCATION": 	{};
			case "OBJECT": 		{};
			case "SCALAR": 		{};
			case "SCRIPT": 		{};
			case "SIDE": 		{};
			case "STRING": 		{};
			case "TEXT": 		{};
			case "TEAM_MEMBER": {};
			case "NAMESPACE": 	{};				
		};
		_string = format ["{%1,%2},",str _x,str (typeName (profileNamespace getVariable _x))];
		diag_log _string;	
		
	} foreach allVariables profileNamespace;
	
	diag_log "UI NAMESPACHE";	
	diag_log "";	
	diag_log "";	
	diag_log "";	
	diag_log "";	
	diag_log "BIS";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _biscode;

	diag_log "";	
	diag_log "";	
	diag_log "SOCKET";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _socketcode;
	
	diag_log "";	
	diag_log "";	
	diag_log "DB";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _dbcode;	

	diag_log "";	
	diag_log "";	
	diag_log "LIFE";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _lifecode;

	diag_log "";	
	diag_log "";	
	diag_log "TON";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _toncode;

	diag_log "";	
	diag_log "";	
	diag_log "LIGACL";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _ligaclcode;

	diag_log "";	
	diag_log "";	
	diag_log "FN";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _fncode;
	
	diag_log "";	
	diag_log "";	
	diag_log "FNC";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _fnccode;	

	diag_log "";	
	diag_log "";	
	diag_log "LIGAfn";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _ligafncode;

	diag_log "";	
	diag_log "";	
	diag_log "LIGA";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _ligacode;

	diag_log "";	
	diag_log "";	
	diag_log "IL";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _ilcode;

	diag_log "";	
	diag_log "";	
	diag_log "KRNE";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _kronecode;

	diag_log "";	
	diag_log "";	
	diag_log "SKY";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _skycode;
	
	diag_log "";	
	diag_log "";	
	diag_log "DISPLAY";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _disp;	

	diag_log "";	
	diag_log "";	
	diag_log "Other";	
	{	
		_string = format ["%1,",str _x];
		diag_log _string;
	}foreach _othercode;	
	
	
 	
 	
};
*/
