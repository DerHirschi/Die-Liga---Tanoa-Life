#include "\life_server\Liga_Macros.hpp"
/*
	Author: Hirschi - Die Liga
*/
_player		= [_this,0,ObjNull 	,[ObjNull] 	] call BIS_fnc_param;
_id			= [_this,1,-1 		,[-1] 		] call BIS_fnc_param;

if(	isNull _player || EQUAL(_id,-1)	) exitWith {};

_query 		= format["GebWagenDet:%1",_id	];
_res		= [_query,2] call DB_fnc_asyncCall;
//diag_log 	format["║ _id GebWagenDet		: %1",_id];
//diag_log 	format["║ _res GebWagenDet		: %1",_res];
//diag_log 	format["║ _query GebWagenDet	: %1",_query];

[3,_res] remoteExec ["LIGACL_fnc_GebHanShowList",_player];