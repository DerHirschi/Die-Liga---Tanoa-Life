#include "\life_server\Liga_Macros.hpp"

/*
	Author: Hirschi - Die Liga
*/
private ["_temp","_uid","_pod","_player","_msg"];
diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ CALL WINNER !!   ";
diag_log "╠══════════════════════════════════════════════════╣";


{	
	for "_i" from 3 to 5 do {
		_temp  = missionNamespace GVAR [(format["gewinner%1",_i]),  []  ];
		if(_x in  _temp) exitWith {		
			
			_pod = missionNamespace GVAR [(format["Pot%1",_i]),  -1 ];
			
			if(EQUAL(_pod,-1)) then { 
				diag_log "LOTTO ERROR .. POD -1";
			}else{
				_msg = format["Herzlichen Glueckwunsch. Du hast %1 richtige Zahlen getippt und %2 Dollar gewonnen. Deine Glückszahlen lauten %3, %4, %5, %6, %7",_i,(([_pod] call life_fnc_numberText)),SEL(LottoGlZahl,0),SEL(LottoGlZahl,1),SEL(LottoGlZahl,2),SEL(LottoGlZahl,3),SEL(LottoGlZahl,4)];
				_player = [_x,1] call life_fnc_isUIDActive;
				if(isNull _player) then {
					diag_log format["║ Offline		: %1",_x];

					[_player,_msg,objNull,8] call TON_fnc_handleMessages;
				}else{
					diag_log format["║ Online		: %1",_x];
					[_player,_msg,objNull,9] call TON_fnc_handleMessages;
					
				};				
			};						
		};				
	};	
}forEach allgewinner;
diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ CALL WINNER !!  ENDE !! ";
diag_log "╠══════════════════════════════════════════════════╣";