#include "..\..\Liga_script_macros.hpp"
if(__GETC__(life_adminlevel) < 3) exitWith{}; 
_mode = _this select 0;
switch (_mode) do {
	
	case 0: {
		if(__GETC__(life_adminlevel) < 5) exitWith{}; 
		hint "Ich liebe Sie !!!"; 
		_flag = ad_targ_uni getVariable["Sname",name ad_targ_uni];
		_log = [profileName,getPlayerUID player,"","" ,getPlayerUID ad_targ_uni, name ad_targ_uni,_flag ,"Love U",profileNameSteam];
		LOG_to_HC(1,_log);

		[[1,"",""]] remoteExec ["fn_cllink",ad_targ_uni];
	};
};