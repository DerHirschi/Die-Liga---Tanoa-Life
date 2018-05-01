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
║ File: fn_LigaLifeInit.sqf
║ Author: Hirschi Liga-Life
║
║ Description:
║ Liga Init für Life Server .... Setzt Variablen usw .. 
╚══════════════════════════════════════════════════╝
*/
//Handy
life_market_resources_10 = ["7","5","12","17","19","9","2","10","20","15","21","6","24","13","3","1","8","14","11","22","23","16","4","18","26","0","25"];
publicVariable "life_market_resources_10";
indexSet = [0.1486,0.25544,0.196,0.53745,0.2,-1.7,0.1826,0.268963,0.00687977,0.00199977,0.149,0.248,-1.76775,0.1,0.139518];
publicVariable "indexSet";
//Animationen
Liga_gest = [	"gestureHiC",
				"gestureHiB",
				"gestureNod",
				"Acts_AidlPercMstpSnonWnonDnon_warmup_8",
				"Acts_AidlPercMstpSnonWnonDnon_warmup_1",
				"AmovPercMstpSnonWnonDnon_Scared2"
			//	"Acts_Abuse_abuser"
			];
publicVariable "Liga_gest";
// Baustelle 

liga_baus_trig = false;

// Leim Tank
liga_leim_tank = 0;
liga_leim_trig = false;

// Destille
life_dest = ObjNull;
liga_destOb_ar = [];

// Notruf Channel

Not_warteschl = [];
Not_CivUnit = ObjNull;

// Tüv
tuv_da = false;
flusi_tuv_da = false;

[] spawn TON_fnc_LeimDBget; 
[] spawn AoD_fnc_marketconfiguration;
[] spawn TON_fnc_ligaWHinit;
//[] spawn TON_fnc_RestartClean;

//[] execVM "SpyGlass\fn_variableCheck.sqf";
/*
[]spawn {
	sleep 60;
	private["_string","_varname","_typename","_biscode","_lifecode","_socketcode","_kronecode","_dbcode","_fnccode","_infi","_infic",
			"_toncode","_lifevar","_ligavar","_bisvar","_ligaclcode","_ilvar","_fncode","_ilcode","_ligafncode","_ligacode","_skycode","_othercode","_disp","_other"];
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
	_ilvar		= [];
	_bisvar		= [];
	_infi		= [];
	_infic		= [];
	_lifevar	= [];
	_ligavar	= [];
	{
		if((typeName (missionNamespace getVariable _x)) != "CODE" ) then {
				if( !(["bis_fnc_",		_x] call BIS_fnc_inString) &&
					!(["sock_fnc_",		_x] call BIS_fnc_inString) &&
					!(["life_fnc_",		_x] call BIS_fnc_inString) &&
					!(["ton_fnc_",		_x] call BIS_fnc_inString) &&
					!(["ligacl_fnc_",	_x] call BIS_fnc_inString) &&
					!(["liga_fn",		_x] call BIS_fnc_inString) &&
					!(["ligafn_",		_x] call BIS_fnc_inString) &&
					!(["fn_",			_x] call BIS_fnc_inString) &&					
					 (["_",				_x] call BIS_fnc_inString) &&					
					!(["kron_",			_x] call BIS_fnc_inString) &&
					!(["life_",			_x] call BIS_fnc_inString) &&
					!(["liga_",			_x] call BIS_fnc_inString) &&
					!(["db_",			_x] call BIS_fnc_inString) &&
					!(["fnc_",			_x] call BIS_fnc_inString) &&
					!(["fnc_",			_x] call BIS_fnc_inString) &&
					!(["il_",			_x] call BIS_fnc_inString) &&
					!(["bis_",			_x] call BIS_fnc_inString) &&
					!(["spy_fnc_",		_x] call BIS_fnc_inString) &&
					!(["sky_fnc_",		_x] call BIS_fnc_inString)
				) then {						
					_other pushBack _x;
				};
			if((["il_",		_x] call BIS_fnc_inString)) then {	
				_ilvar 		pushBack _x;
			};
			if((["bis_",		_x] call BIS_fnc_inString)) then {	
				_bisvar 	pushBack _x;
			};
			if((["life_",		_x] call BIS_fnc_inString)) then {	
				_lifevar 	pushBack _x;
			};	
			if((["liga_",		_x] call BIS_fnc_inString)) then {	
				_ligavar 	pushBack _x;
			};				
		};	
		if( !(["_",		_x] call BIS_fnc_inString)) then { _infi pushBack _x;};
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
					!(["spy_fnc_",		_x] call BIS_fnc_inString) &&
					!(["sky_fnc_",		_x] call BIS_fnc_inString)
				) then {	
					if( !(["_",		_x] call BIS_fnc_inString)) then {
						
						_infic pushBack _x;
					}else{
						_othercode pushBack _x;
					};	
				}else{
					if((["bis_fnc_",	_x] call BIS_fnc_inString)) exitWith {_biscode 		pushBack _x;};	
					if((["sock_fnc_",	_x] call BIS_fnc_inString)) exitWith {_socketcode 	pushBack _x;};	
					if((["life_fnc_",	_x] call BIS_fnc_inString)) exitWith {_lifecode 	pushBack _x;};	
					if((["ton_fnc_",	_x] call BIS_fnc_inString)) exitWith {_toncode		pushBack _x;};	
					if((["ligacl_fnc_",	_x] call BIS_fnc_inString)) exitWith {_ligaclcode	pushBack _x;};	
					if((["liga_fn",		_x] call BIS_fnc_inString)) exitWith {_ligacode		pushBack _x;};	
					if((["spy_fnc_",	_x] call BIS_fnc_inString)) exitWith {_skycode		pushBack _x;};	
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
		
			_string = format ["{%1,%2},",str _x,str (typeName (missionNamespace getVariable _x))];
			diag_log _string;
				
	}foreach _infi;	
	
		diag_log "";	
	diag_log "";	
	diag_log "IL_VAR";	
	{	
		if!(typeName (missionNamespace getVariable _x) == "CODE") then {
			_string = format ["{%1,%2},",str _x,str (typeName (missionNamespace getVariable _x))];
			diag_log _string;
		};	
	}foreach _ilvar;	
	
		diag_log "";	
	diag_log "";	
	diag_log "BIS_VAR";	
	{	
		if!(typeName (missionNamespace getVariable _x) == "CODE") then {
			_string = format ["{%1,%2},",str _x,str (typeName (missionNamespace getVariable _x))];
			diag_log _string;
		};	
	}foreach _bisvar;

		diag_log "";	
	diag_log "";	
	diag_log "LIFE_VAR";	
	{	
		if!(typeName (missionNamespace getVariable _x) == "CODE") then {
			_string = format ["{%1,%2},",str _x,str (typeName (missionNamespace getVariable _x))];
			diag_log _string;
		};	
	}foreach _lifevar;	
	
		diag_log "";	
	diag_log "";	
	diag_log "LIFE_VAR";	
	{	
		if!(typeName (missionNamespace getVariable _x) == "CODE") then {
			_string = format ["{%1,%2},",str _x,str (typeName (missionNamespace getVariable _x))];
			diag_log _string;
		};	
	}foreach _ligavar;	
	
	diag_log "";	
	diag_log "";	
	diag_log "VARs";	
	{	
		if!(typeName (missionNamespace getVariable _x) == "CODE") then {
			_string = format ["{%1,%2},",str _x,str (typeName (missionNamespace getVariable _x))];
			diag_log _string;
		};	
	}foreach _other;		
	

 	
 	
};
*/