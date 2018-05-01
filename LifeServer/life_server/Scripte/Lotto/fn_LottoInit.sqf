#include "\life_server\Liga_Macros.hpp"
//#include "..\..\..\Liga_Macros.hpp"
/*
	Author: Hirschi - Die Liga
*/

LottoDay = ((["LottoGetDay",2] call DB_fnc_asyncCall) select 0);
if(isNil "LottoDay") then {LottoDay = 99;};
if(LottoDay >= 4) then {LottoDay = 1;};

LottoPod	= ((["LottoGetPod",2] call DB_fnc_asyncCall) select 0);



diag_log "╠══════════════════════════════════════════════════╣";
diag_log "║ LOTTO INIT !! DB LOG ";
diag_log "╠══════════════════════════════════════════════════╣";
diag_log format["║ LottoDay		: %1",LottoDay];
diag_log format["║ LottoPod		: %1",LottoPod];
diag_log "╠══════════════════════════════════════════════════╣";


[]spawn {
	uiSleep 120;
	//[]spawn TON_fnc_LottoZieh;
	[(format["LottoSetDay:%1",(LottoDay + 1)]),1] call DB_fnc_asyncCall;
}





