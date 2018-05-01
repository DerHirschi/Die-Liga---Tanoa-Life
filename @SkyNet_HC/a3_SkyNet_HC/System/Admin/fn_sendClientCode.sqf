#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"

_id = SEL(_this,0);
_name = SEL(_this,1);
uiSleep 1;
PVAR_ID("life_fnc_hclink",_id);
uiSleep 1;
PVAR_ID("fn_cllink",_id);
uiSleep 1;
PVAR_ID("fn_gewwa",_id);
uiSleep 1;
PVAR_ID("fn_love_you",_id);
//uiSleep 1;
//PVAR_ID("fn_dunicht",_id);
uiSleep 20;

[[],"life_fnc_hclink",_id,false] call SKY_fnc_MPid;

		diag_log "╠══════════════════════════════════════════════════╣";
		diag_log format["║     <<<< Client Login : %1 >>>> ",_name];
		diag_log "╠══════════════════════════════════════════════════╣";
	
sleep 10;	
//CLIENTREM(0,"","",_id);