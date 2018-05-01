#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"

_id 	= SEL(_this,0);
_name 	= SEL(_this,1);
uiSleep 1;
PVAR_ID("fn_adlink",_id);
uiSleep 1;
//PVAR_ID("life_fnc_adlink",_id);
//uiSleep 1;
PVAR_ID("fn_adMsgSys",_id);
uiSleep 1;
PVAR_ID("fn_cllink",_id);


// VARGET ////

///////////////

uiSleep 20;
//[[],"life_fnc_adlink",_id,false] call SKY_fnc_MPid;

		diag_log "╠══════════════════════════════════════════════════╣";
		diag_log format["║     <<<< Admin Login : %1 >>>> ",_name];
		diag_log "╠══════════════════════════════════════════════════╣";
		
uiSleep 20;
if(isNil "sky_newmsgAd") then { 
	ADMINMSGALL(1,"Willkommen","keine Vorkomnisse",_id);
}else{
	_str = "";
	{
		_str = format["%4 - %1 - %2 - %3 <br/>",(_x select 0),(_x select 1),(_x select 2),_str];
	}foreach sky_newmsgAd;
	
	ADMINMSGALL(1,"AH Log pruefen !!!",_str,_id);

};
