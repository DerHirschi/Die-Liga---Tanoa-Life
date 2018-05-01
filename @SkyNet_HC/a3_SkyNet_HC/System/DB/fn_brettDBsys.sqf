#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*

	file: fn_brettDBsys.sqf
	Author: Silex
	Edit: Hirsch - Die Liga

*/	
private["_ar","_mode","_player","_id","_query","_queryResult","_pid"];

_ar 	= 	[_this,	0,	[]		,[[]]		] call BIS_fnc_param;
_mode	= 	[_ar,	1,	-1		,[-1]		] call BIS_fnc_param;
_player = 	[_ar,	2,	ObjNull	,[ObjNull]	] call BIS_fnc_param;
_id 	= 	[_ar,	3,	-1		,[0]		] call BIS_fnc_param;


if(EQUAL(_mode,-1)) exitWith {SYSLOG(SKYID,"ERROR","Brett DB System","SKY_fnc_brettDBsys","Mode ungueltig");	};

if(EQUAL(_mode,1))  exitWith
	{						
		if(EQUAL(_id,-1)) exitWith {SYSLOG(SKYID,"ERROR","Brett DB System","SKY_fnc_brettDBsys","NET ID ungültig");	};

		_queryResult = ["BRETTread",2,true,0]call SKY_fnc_dbCall;		
		
		if((count _queryResult) isEqualTo 0) exitWith {RPT("DB BRett Query NULL",_queryResult);};
		{
			
			[[2,_x]] remoteExecCall ["fn_cllink",_player];
						
			RPT("DB BRett Query",_x);
		}forEach _queryResult;			
	};
	
if(EQUAL(_mode,0))  exitWith
	{		
		if(isNUll _player)  exitWith {SYSLOG(SKYID,"ERROR","Brett DB System","SKY_fnc_brettDBsys","Spieler ungueltig");	};

		_header = 	[_ar,	3,	""		,[""]		] call BIS_fnc_param;
		_msg 	= 	[_ar,	4,	""		,[""]		] call BIS_fnc_param;
		_pid = getPlayerUID _player;		
		_fromName = name _player;

		_query = format["BRETTinsert:%1:%2:%3:%4",_pid,_fromName,_header,_msg];
		
		DBCALL(0);	
	};
if(EQUAL(_mode,2))  exitWith
	{		
		_query = format["BRETTdel:%1",getPlayerUID _player];
		DBCALL(0);	
	};	
	
	
	
