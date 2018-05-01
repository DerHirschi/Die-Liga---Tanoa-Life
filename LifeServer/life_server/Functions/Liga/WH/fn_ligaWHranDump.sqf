#include "\life_server\Liga_Macros.hpp"
#define WHFLAG "liga_wh_3"
/*
	liga_wh_3 Konsumgenerator
	Author: Hirschi - Die Liga	
	
	fn_ligaWHranDump.sqf
*/
private["_fac","_whArray","_best"/*,"_query"*/];

_whArray 	= GVAR_MNS [WHFLAG,[[]]];
_fac		= count playableUnits;

if!(EQUAL(_whArray,[[]])) then {
	diag_log format["║ WH 3 RAN DUMP Save- %1  gestartet !!!!!",_whArray];
	{			
		
		_best = SEL(_x,1);
		diag_log format["║ WH 3 RAN DUMP bESTAND vORHER- %1  gestartet !!!!!",_best];
		_fac  = ceil (_fac / 3);
		_best = (_best - _fac) max 0;
		diag_log format["║ WH 3 RAN DUMP bESTAND vORHER- %1  gestartet !!!!!",_fac];
		_best = round _best ;
		diag_log format["║ WH 3 RAN DUMP bESTAND NACHHER- %1  gestartet !!!!!",_best];
		_whArray set [_forEachIndex,[SEL(_x,0),_best]];
	}forEach _whArray;
	
	SVAR_MNS [WHFLAG,_whArray];
	
	diag_log format["║ WH 3 RAN DUMP Save- %1  ende !!!!!",_whArray];
	
//	_query 		= format["WHset:%1:%2",WHFLAG,GVAR_MNS WHFLAG];	
//	_query 		= [_query,1] call DB_fnc_asyncCall;
	
};	