#include "\life_server\Liga_Macros.hpp"
/*
	Author: Hirschi - Die Liga
	[player] remoteExec ['TON_fnc_LottoSuchGewinn',RSERV]
*/
private ["_temp"];

_player 	= [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(
	isNull _player || 
	isNil "allgewinner" || 	
	isNil "gewinner3" || 	
	isNil "gewinner4" || 	
	isNil "gewinner5" ||
	!(EQUAL(LottoDay,4))
)exitWith {};

_uid		= getPlayerUID _player;

if(_uid in allgewinner) then {
	for "_i" from 3 to 5 do {
		_temp  = missionNamespace GVAR [(format["gewinner%1",_i]),  []  ];

		if(_uid in  _temp) exitWith {			
			//_temp 		deleteAt (_temp 		find _uid);
			allgewinner	deleteAt (allgewinner 	find _uid);
			//missionNamespace SVAR [(format["gewinner%1",_i]),  _temp  ];
			
			_pod = missionNamespace GVAR [(format["Pot%1",_i]),  -1 ];
			
			if(EQUAL(_pod,-1)) then { 
				diag_log "LOTTO ERROR .. POD -1";
			}else{
				[_pod] remoteExec ['LIGACL_fnc_LottoGetWin',_player];
			};						
		};				
	};	
};

