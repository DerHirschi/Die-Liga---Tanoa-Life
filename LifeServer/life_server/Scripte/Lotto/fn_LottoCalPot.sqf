#include "\life_server\Liga_Macros.hpp"
//#include "..\..\..\Liga_Macros.hpp"
/*
	Author: Hirschi - Die Liga
*/
private ["_restPod","_LottoPod"];
diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ LOTTO POT !!   ";
diag_log "╠══════════════════════════════════════════════════╣";
_lottopodplayer = count _this;
_restPod = 0;
diag_log format["║ _lottopodplayer	: %1",_lottopodplayer];


_aktPod 	= 20000 * _lottopodplayer;
diag_log format["║ _aktPod		: %1",_aktPod];
_LottoPod	= ((["LottoGetPod",2] call DB_fnc_asyncCall) select 0);
diag_log format["║ _LottoPod		: %1",_LottoPod];
_LottoPod	= _LottoPod + _aktPod;
diag_log format["║ _LottoPod SUM	: %1",_LottoPod];
_LottoPod	= _LottoPod max 500000;
diag_log format["║ _LottoPod SUM min: %1",_LottoPod];


diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ LOTTO POT Aufteilung !!   ";


_potteiler3 = count gewinner3;
_potteiler4 = count gewinner4;
_potteiler5 = count gewinner5;
diag_log format["║ _potteiler3		: %1",_potteiler3];
diag_log format["║ _potteiler4		: %1",_potteiler4];
diag_log format["║ _potteiler5		: %1",_potteiler5];

/*Hauptgewinn*/
if(	!(EQUAL(_potteiler5,0)) && EQUAL(_potteiler4,0) && EQUAL(_potteiler3,0) ) exitWith {
	Pot5 	= round (_LottoPod / _potteiler5);
	Pot4 	= 0;
	Pot3 	= 0;
	_restPod= 0;
	diag_log "╠══════════════════════════════════════════════════╣";

	diag_log "║ Hauptgewinn !!   ";
	diag_log "║  ";
	diag_log format["║ Pot3			: %1",Pot3];
	diag_log format["║ Pot4			: %1",Pot4];
	diag_log format["║ Pot5			: %1",Pot5];
	diag_log format["║ Pot5	Gewinner: %1",_potteiler5];
	diag_log format["║ _restPod		: %1",_restPod];
	[(format["LottoSetPod:%1",_restPod]),1] call DB_fnc_asyncCall;

	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log "║ !!! RestPod DB - SAVE !!!   ";
	diag_log format["║ _restPod		: %1",_restPod];
	diag_log "╠══════════════════════════════════════════════════╣";
};

/*Teilgewinn*/
if(	!(EQUAL(_potteiler4,0)) || !(EQUAL(_potteiler3,0)) ) then {
	
	if!(EQUAL(_potteiler5,0)) then {
		Pot5 = round ((_LottoPod * 0.7) / _potteiler5);
	}else{_restPod = _restPod + (round (_LottoPod * 0.7)) };
	
	if!(EQUAL(_potteiler4,0)) then {
		Pot4 = round ((_LottoPod * 0.2) / _potteiler4);
	}else{_restPod = _restPod + (round (_LottoPod * 0.2)) };
	
	if!(EQUAL(_potteiler3,0)) then {
		Pot3 = round ((_LottoPod * 0.1) / _potteiler3);
	}else{_restPod = _restPod + (round (_LottoPod * 0.1)) };
	
	
	diag_log "╠══════════════════════════════════════════════════╣";

	diag_log "║ Teilgewinn !!   ";
	diag_log "║  ";
	diag_log format["║ Pot3			: %1",Pot3];
	diag_log format["║ Pot4			: %1",Pot4];
	diag_log format["║ Pot5			: %1",Pot5];
	diag_log format["║ Pot3	Gewinner: %1",_potteiler3];
	diag_log format["║ Pot4	Gewinner: %1",_potteiler4];
	diag_log format["║ Pot5	Gewinner: %1",_potteiler5];
	diag_log format["║ _restPod		: %1",_restPod];
}else{
	
	Pot5 = 0;
	Pot4 = 0;
	Pot3 = 0;
	_restPod = _LottoPod;
	diag_log "╠══════════════════════════════════════════════════╣";

	diag_log "║ Kein Gewinn all 2 Pot !!   ";
	diag_log "║  ";
	diag_log format["║ Pot3			: %1",Pot3];
	diag_log format["║ Pot4			: %1",Pot4];
	diag_log format["║ Pot5			: %1",Pot5];
	diag_log format["║ Pot3	Gewinner: %1",_potteiler3];
	diag_log format["║ Pot4	Gewinner: %1",_potteiler4];
	diag_log format["║ Pot5	Gewinner: %1",_potteiler5];
	diag_log format["║ _restPod		: %1",_restPod];	
	
	
};

[(format["LottoSetPod:%1",_restPod]),1] call DB_fnc_asyncCall;

diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ !!! RestPod DB - SAVE !!!   ";
diag_log format["║ _restPod		: %1",_restPod];
diag_log "╠══════════════════════════════════════════════════╣";


