#include "..\..\Liga_script_macros.hpp"
_mode = SEL(_this,0);

if!(SKY_HC_aktiv_1)exitWith{};
 
switch (_mode) do {
	case 0: {// P 2 P
		_var1 = SEL(_this,1);
		_var2 = SEL(_this,2);
		_val = SEL(_this,3);
		_flag = ad_targ_uni getVariable["Sname",name ad_targ_uni];
		_log = [profileName,getPlayerUID player,_val,_var2 ,getPlayerUID ad_targ_uni, name ad_targ_uni,_flag ,_var1,profileNameSteam];
	
		LOG_to_HC(1,_log);
	};
	
	case 1: {// 1 Shot
		_var1 = SEL(_this,1);
		_var2 = SEL(_this,2);
		_val = SEL(_this,3);
		_log = [profileName,getPlayerUID player,str _val,str _var2,"Action",_val,_var2,_var1,profileNameSteam];
		LOG_to_HC(1,_log);
	};	
	
	
}; 
